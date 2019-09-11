feature 'custom' do
  let(:client) { create :client }

  before do
    login_as client

    cut = create :cut, name: 'МегаДрель5000', consumable_cost: 10, overhead_cost: 5, height_max: 2, width_max: 5
    material = create :material, name: 'Папирус', thickness: 12, price_per_kg: 21, width_max: 21, height_max: 12, density: 1

    create(:cut_material, cut: cut, material: material)
  end

  scenario 'must upload custom detail', js: true do
    visit constructor_attachment_path

    expect(page).to have_current_path(constructor_attachment_path)
    expect(page).to have_content('Отправить чертеж')

    within('.draft-download-form__content') do
      fill_in 'name', with: 'test'
      fill_in 'description', with: 'lorem ...'
      select('МегаДрель5000', from: 'Тип резки')
      select('Папирус', from: 'Материал детали')
      find("form input[type='file']").set(Rails.root.join('spec', 'fixtures', 'detail.jpeg'))

      click_button('Загрузить чертеж')
    end

    find('h2', text: 'Чертежи на отправку')
    find('h3', text: 'test')
    find('span', text: 'detail.jpeg')

    detail = client.details.first

    expect(detail.name).to eq('test')
    expect(detail.load_type).to eq('custom')
    expect(detail.status).to eq('not_send')
    expect(detail.description).to eq('lorem ...')
  end

  context 'when we delete or send a detail' do
    before do
      create :detail, client: client, name: 'detail', cut_material: create(:cut_material), load_type: :custom, status: :not_send
    end

    scenario 'must remove detail', js: true do
      visit constructor_attachment_path

      expect(page).to have_current_path(constructor_attachment_path)

      find('h2', text: 'Чертежи на отправку')
      find('h3', text: 'detail')

      find_link('Удалить').trigger('click')
      sleep 1

      client.details.reload
      expect(client.details).to be_empty
    end
  end
end
