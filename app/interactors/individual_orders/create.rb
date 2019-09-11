module IndividualOrders
  class Create
    include Interactor

    def call
      legal_params = context.legal_params
      individual_params = context.individual_params
      person_type = context.legal_params['person_type']
      client = fetch_client

      params = fetch_params(person_type, legal_params, individual_params)
      individual_order = client.individual_orders.create(params.merge(id: context.order_id.to_s))

      if individual_order.valid?
        update_order(client, individual_order)

        context.status = :created
        context.order = individual_order
      else
        context.fail! status: :unprocessable_entity, errors: individual_order.errors
      end
    end

    private

    def fetch_client
      Client.find(context.client_id)
    rescue ActiveRecord::RecordNotFound
      context.fail! status: :not_found, errors: 'Клиент не найден'
    end

    def fetch_params(person_type, legal_params, individual_params)
      case person_type
      when 'individual'
        # validate_individual_params(individual_params)
        individual_params
      when 'legal'
        # validate_legal_params(legal_params)
        _params = legal_params
        _params[:name] = legal_params[:contact_person_name]
        _params[:last_name] = legal_params[:contact_person_last_name]
        _params[:phone_number] = legal_params[:contact_person_phone_number]
        _params[:email] = legal_params[:contact_person_email]
        _params
      end
    end

    def update_order(client, individual_order)
      items = client.cart_items
      user_discount = client.discount.nil? ? 0 : client.discount
      items_sum = items.sum(:price)
      items_sum_with_user_discount = items_sum - items_sum * (user_discount / 100.0)

      time_c = IndividualOrders::TimeCalculator.new(items)

      individual_order.update(
        total_price: items_sum_with_user_discount,
        production_time: time_c.production_time,
        status: IndividualOrder.statuses[:pending_payment]
      )

      items.update_all(individual_order_id: individual_order.id, status: IndividualItem.statuses[:pending])
    end

    # def validate_individual_params(individual_params)
    #   required_params = individual_params.values_at('name', 'last_name', 'email', 'phone_number')
    #   required_params.delete_if(&:nil?)

    #   number_of_required_params = 4
    #   if required_params.size != number_of_required_params
    #     context.fail! status: :unprocessable_entity, errors: {
    #       individual_order: [I18n.t('errors.critical.individual_order.required')]
    #     }
    #   end
    # end

    # def validate_legal_params(legal_params)
    #   required_params = legal_params.values_at(
    #     'contact_person_name', 'contact_person_last_name', 'contact_person_email', 'contact_person_phone_number'
    #   )
    #   required_params.delete_if(&:nil?)

    #   number_of_required_params = 4
    #   if required_params.size != number_of_required_params
    #     context.fail! status: :unprocessable_entity, errors: {
    #       individual_order: [I18n.t('errors.critical.individual_order.required')]
    #     }
    #   end
    # end

    def delivery?(params)
      params[:delivery_method].present? && params[:delivery_method].to_i == IndividualOrder.delivery_methods[:delivery] &&
        params[:client_address].present? && params[:city].present?
    end

    def merge_params(params, person_type)
      params.merge!(person_type: person_type)
    end
  end
end
