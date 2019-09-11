feature 'details' do
  let(:client) { create :client }

  before do
    login_as client

    %w[Деталь№1 Деталь№2 Деталь№3 Деталь№4].each do |name|
      create(:detail, name: name, count: 3, price: 5, client_id: client.id, cut_material: create(:cut_material), load_type: :custom)
    end
  end

  scenario 'must delete the detail' do
    visit details_path

    expect(page).to have_content('Мои детали')
    expect(page).to have_selector('.detail-cards-list__item', count: 4)
    expect(page).to have_css('.top-filter__quantity', text: 'Всего деталей: 4')

    first('.detail-card-item__controls-icon_delete').click
    expect(page).to have_selector('.detail-cards-list__item', count: 3)
    expect(page).to have_css('.top-filter__quantity', text: 'Всего деталей: 3')
  end
end
