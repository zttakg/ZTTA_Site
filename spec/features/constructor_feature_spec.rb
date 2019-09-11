feature 'constructor' do
  let(:client) { create :client }
  before { login_as client }

  scenario 'should detail created' do
    visit constructor_path

    expect(current_path).to eq('/constructor')

    # TODO: ilia write correct test
  end
end
