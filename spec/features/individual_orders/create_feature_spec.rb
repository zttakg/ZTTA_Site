feature 'create individual order' do
  let(:client) { create :client }

  before do
    login_as client
    prepare_cut_and_materials
    create_list(:individual_order, 3)
    create_list(:individual_item, 3, client_id: client.id, preparation_days: 60, count: 3, price: 5, status: :in_cart, cut_material: CutMaterial.first, cut_name: CutMaterial.first.cut.name)
  end

  context 'when the customer is an individual', js: true do
    scenario 'success create order' do
      visit new_individual_order_path

      within('.ordering-form__form') do
        fill_in 'last_name', with: 'Trololocha'
        fill_in 'name', with: 'Ololoshevich'
        fill_in 'phone_number', with: '555123123'
        fill_in 'email', with: 'ololo@gmail.com'
        click_button('Подтвердить заказ')
      end

      sleep 1
      individual_order = client.individual_orders.last
      expect(page).to have_current_path(thx_individual_order_path(individual_order.id))
      expect(page).to have_content('Спасибо, заказ успешно оформлен')
      expect(client.individual_orders.count).to eq(1)
      expect(individual_order.last_name).to eq('Trololocha')
      expect(individual_order.name).to eq('Ololoshevich')
      expect(individual_order.phone_number).to eq('555123123')
      expect(individual_order.email).to eq('ololo@gmail.com')
      expect(individual_order.total_price).to eq(15)
      expect(individual_order.individual_items.count).to eq(3)
      expect(individual_order.individual_items.first.status).to eq('pending')
    end
  end

  context 'when the customer is a legal entity', js: true do
    scenario 'success create order' do
      visit new_individual_order_path

      click_button('Юридическое лицо')

      within('.ordering-form__form') do
        fill_in 'company_name', with: 'CompanyName'
        fill_in 'company_INN', with: 'INN'
        fill_in 'company_legal_address', with: 'Taganka'
        fill_in 'company_address', with: 'Arbat'
        fill_in 'bank_name', with: 'Batkovich'
        fill_in 'contact_person_name', with: 'Ololosha'
        fill_in 'contact_person_last_name', with: 'Ololoshkii'
        fill_in 'contact_person_phone_number', with: '555666777'
        fill_in 'contact_person_email', with: 'person@email.com'

        click_button('Подтвердить заказ')
      end

      sleep 1
      individual_order = client.individual_orders.last
      expect(page).to have_current_path(thx_individual_order_path(individual_order.id))
      expect(page).to have_content('Спасибо, заказ успешно оформлен')
      expect(individual_order.last_name).to eq('Ololoshkii')
      expect(individual_order.name).to eq('Ololosha')
      expect(individual_order.phone_number).to eq('555666777')
      expect(individual_order.email).to eq('person@email.com')
      expect(client.individual_orders.count).to eq(1)
      expect(individual_order.individual_items.count).to eq(3)
    end
  end
end
