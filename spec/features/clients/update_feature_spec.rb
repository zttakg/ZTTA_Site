feature 'client update' do
  let(:client) { create :client }

  before { login_as client }

  scenario 'success update client' do
    visit edit_client_registration_path

    within('.form_profile') do
      fill_in 'client_name', with: 'Trololocha'
      fill_in 'client_last_name', with: 'Ololoshevich'
      fill_in 'client_email', with: 'Oloshka@trololo.com'
      fill_in 'client_company_name', with: 'CompanyName'
      fill_in 'client_company_INN', with: 'INN'
      fill_in 'client_company_legal_address', with: 'legal address'
      fill_in 'client_company_address', with: 'address'
      fill_in 'client_bank_name', with: 'TiTkoff'
      fill_in 'client_settlement_account', with: 'Oololo'
      fill_in 'client_company_BIC', with: 'BIC'
      fill_in 'client_city', with: 'city'
      fill_in 'client_company_OKPO', with: 'OKPO'

      click_button('Сохранить изменения')
    end

    client.reload

    expect(page).to have_current_path(cabinet_path)
    expect(client.name).to eq('Trololocha')
    expect(client.last_name).to eq('Ololoshevich')
    expect(client.email).to eq('oloshka@trololo.com')
    expect(client.company_name).to eq('CompanyName')
    expect(client.company_INN).to eq('INN')
    expect(client.company_legal_address).to eq('legal address')
    expect(client.company_address).to eq('address')
    expect(client.bank_name).to eq('TiTkoff')
    expect(client.settlement_account).to eq('Oololo')
    expect(client.company_BIC).to eq('BIC')
    expect(client.city).to eq('city')
    expect(client.company_OKPO).to eq('OKPO')
  end
end
