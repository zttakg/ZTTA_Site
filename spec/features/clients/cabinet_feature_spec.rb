feature 'cabinet' do
  let(:client) { create :client }

  before do
    login_as client
    prepare_cut_and_materials

    create_list(:individual_item, 3, count: 3, price: 5, client_id: client.id, status: :in_cart)
    create_list(:individual_order, 3, client: client, total_price: 10, status: :finished)

    create :individual_order, client: client, total_price: 10, status: :in_progress

    cut_material = create :cut_material

    create :detail, client: client, load_type: :custom, name: 'hexahedron', cut_material: cut_material, count: 1
    create :detail, client: client, load_type: :custom, name: 'trololo', cut_material: cut_material, count: 1
    create :detail, client: client, load_type: :constructor, name: 'Screwdriver', cut_material: cut_material, count: 1
    create :detail, client: client, load_type: :constructor, name: 'ololo', cut_material: cut_material, count: 1
    create :detail, client: client, load_type: :constructor, name: 'Bauelement', cut_material: cut_material, count: 1
  end

  scenario 'must go to the cabinet page' do
    visit cabinet_path

    expect(page).to have_current_path(cabinet_path)
    expect(page).to have_content('Личный кабинет')

    expect(page).to have_css('div.info-card-item__text', text: 'Заказано деталей: 3')
    expect(page).to have_css('div.info-card-item__text', text: 'Количество: 9')
    expect(page).to have_css('div.info-card-item__text', text: 'На сумму: 15')

    expect(page).to have_css('div.info-card-item__text', text: 'Всего деталей: 5')
    expect(page).to have_css('div.info-card-item__text', text: 'Конструктор: 3')
    expect(page).to have_css('div.info-card-item__text', text: 'Загруженно: 2')

    expect(page).to have_css('div.info-card-item__text', text: 'Всего: 4')
    expect(page).to have_css('div.info-card-item__text', text: 'Завершенные: 3')
    expect(page).to have_css('div.info-card-item__text', text: 'На сумму: 30')
  end

  scenario "when click on 'Моя корзина'" do
    visit cabinet_path

    expect(page).to have_content('Личный кабинет')

    first('.profile-menu__inner').click_link('Моя корзина')
    expect(page).to have_current_path(cart_index_path)
  end

  scenario "when click on 'Мои заказы'" do
    visit cabinet_path

    expect(page).to have_content('Личный кабинет')

    first('.profile-menu__inner').click_link('Мои заказы')
    expect(page).to have_current_path(individual_orders_path)
  end

  context 'transition to profile editing' do
    scenario "when click on 'Настройки профиля'" do
      visit cabinet_path

      expect(page).to have_content('Личный кабинет')

      first('.profile-menu__inner').click_link('Настройки профиля')
      expect(page).to have_current_path(edit_client_registration_path)
    end

    scenario "when click on 'Заполнить данные'" do
      visit cabinet_path

      expect(page).to have_content('Личный кабинет')

      first('.image-message__text').click_link('Заполнить данные')
      expect(page).to have_current_path(edit_client_registration_path)
    end
  end

  context 'transitions to the details page' do
    scenario "when click on 'Мои детали'" do
      visit cabinet_path

      expect(page).to have_content('Личный кабинет')

      first('.profile-menu__inner').click_link('Мои детали')
      expect(page).to have_current_path(details_path)
    end

    scenario "when click on 'Загрузить чертеж детали'" do
      visit cabinet_path

      expect(page).to have_content('Личный кабинет')

      first('.image-link-item_upload').find('.image-link-item__mask').click
      expect(page).to have_current_path(constructor_attachment_path)
    end
  end

  scenario "when click on 'Конструктор деталей'" do
    visit cabinet_path

    expect(page).to have_content('Личный кабинет')

    first('.image-link-item_calc').find('.image-link-item__mask').click
    expect(page).to have_current_path(constructor_path)
  end
end
