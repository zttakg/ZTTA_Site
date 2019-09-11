describe 'POST holes validation', type: :request do
  let!(:client) { create :client }

  before do
    prepare_cut_and_materials
    login_as(client)
    post(constructor_cost_path, nil, params)
  end

  context 'when empty constants' do
    let!(:params) { {shape: FixtureData.triangle_with_circle_holes} }

    it { expect(response.status).to eq(422) }

    # it 'should return error message' do
    #   binding.pry
    #   expect(response_json[:errors]).to match_array([{type: 'critical', source: 'critical', message: "Ошибка вычисления стоимости ##{CurrentThread.id}", description: ''}])
    # end
  end
end