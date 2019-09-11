module Cart
  class UpdateCartSession
    include Interactor

    def call
      return if context.client.nil? || context.cart_session_id.nil?

      Client
        .session_cart_items(context.cart_session_id)
        .update_all(
          client_id: context.client.id,
          cart_session_id: nil
        )
    end
  end
end
