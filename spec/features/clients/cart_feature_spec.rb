feature 'cart' do
  let(:client) { create :client }

  before do
    login_as client
    prepare_cut_and_materials

    create_list(:individual_item, 3, count: 3, price: 5, client_id: client.id, status: :in_cart)
  end

  scenario 'must go to the order page', js: true do
    visit cart_index_path

    expect(page).to have_content('Моя корзина')
    expect(page).to have_selector('.detail-cards-list__item', count: 3)

    first('.cart-total__button').click_button('Оформить заказ')
    expect(page).to have_current_path(new_individual_order_path)
  end

  scenario 'must remove an element', js: true do
    visit cart_index_path

    expect(page).to have_content('Моя корзина')
    expect(page).to have_css('.cart-total__text', text: 'Всего деталей: 3')
    expect(page).to have_selector('.detail-card-item', count: 3)

    first('.detail-card-item__controls-item').click
    expect(page).to have_current_path(cart_index_path)
    expect(page).to have_selector('.detail-card-item', count: 2)
    expect(page).to have_css('.cart-total__text', text: 'Всего деталей: 2')
  end
end
