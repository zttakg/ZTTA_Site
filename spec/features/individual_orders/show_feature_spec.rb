feature 'show individual order' do
  let(:client) { create :client }
  let(:order) { create :individual_order, client_id: client.id, total_price: 15 }

  before do
    login_as client

    create_list(:individual_item, 3, client_id: client.id, individual_order: order, count: 3, price: 5)
  end

  scenario 'must go to the order viewing page' do
    visit individual_order_path(order)

    expect(page).to have_content("ID заказа: #{order.id}")
    expect(page).to have_content("К оплате: #{order.total_price.to_i} сом")
  end
end
