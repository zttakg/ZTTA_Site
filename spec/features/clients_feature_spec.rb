feature 'clients feature' do
  let(:user) { create :client }
  let!(:contact) { create :contact}

  context 'client log in' do
    scenario 'success log in' do
      visit new_client_session_path

      within('.new_client') do
        fill_in 'client[email]', with: user.email
        fill_in 'client[password]', with: user.password
        click_button('Войти')
        expect(page).to have_current_path(root_path)
      end
    end

    scenario 'client log in with wrong params' do
      visit new_client_session_path

      within('.new_client') do
        fill_in 'client[email]', with: 'wrong_email@example.com'
        fill_in 'client[password]', with: 'very_seQured_buT-wR0ngPa$$w0rd'
        click_button('Войти')
        expect(page).to have_current_path(new_client_session_path)
      end
    end

    scenario 'client sign up' do
      visit new_client_registration_path

      within('.new_client') do
        fill_in 'client[email]', with: 'some_new_email@example.com'
        fill_in 'client[password]', with: 'very_seQured-Pa$$w0rd'
        fill_in 'client[password_confirmation]', with: 'very_seQured-Pa$$w0rd'
        click_button('Зарегистрироваться')

        save_and_open_page
        expect(page).to have_current_path(root_path)
      end
    end
  end
end
