describe 'Calculation SVG' do
  let(:client) { create :client }
  let(:detail) { create :detail, name: 'test', count: 3, client_id: client.id, cut_material: CutMaterial.first, svg: svg }
  let!(:svg) do
    '<svg xmlns="http://www.w3.org/2000/svg"' \
      ' xml:space="preserve"' \
      ' version="1.1"' \
      ' xmlns:xlink="http://www.w3.org/1999/xlink"' \
      ' width="100%"' \
      ' height="100%"' \
      ' viewBox="0 0 200 160">' \
        '<g id="body">' \
          '<rect x="0" y="0" width="200" height="160" rx="0" ry="0"/>' \
        '</g>' \
        '<g id="holes">' \
          '<rect x="20" y="20" width="40" height="20" rx="0" ry="0" fill="white"/>' \
          '<rect x="150" y="10" width="40" height="40" rx="0" ry="0" fill="white"/>' \
          '<rect x="30" y="120" width="20" height="20" rx="0" ry="0" fill="white"/>' \
          '<rect x="140" y="90" width="40" height="60" rx="0" ry="0" fill="white"/>' \
        '</g>' \
    '</svg>'
  end

  let(:params) { {detail_id: detail.id, svg: svg} }

  before do
    prepare_cut_and_materials
    post(api_details_calculation_svg_path, nil, params)
  end

  it 'must calculate the cost' do
    expect(response.status).to eq(200)

    json = JSON.parse(response.body)
    expect(json['price']).to eq(50845)
  end

  context 'when the wrong svg is passed' do
    let(:detail) { create :detail, name: 'test', count: 3, client_id: client.id, cut_material: CutMaterial.first, svg: incorrect_svg }
    let(:params) { {detail_id: detail.id, svg: incorrect_svg} }
    let!(:incorrect_svg) do
      '<svg xmlns="http://www.w3.org/2000/svg"' \
        ' xml:space="preserve"' \
        ' version="1.1"' \
        ' xmlns:xlink="http://www.w3.org/1999/xlink"' \
        ' width="100%"' \
        ' height="100%"' \
        ' viewBox="0 0 200 160">' \
          '<g id="body">' \
          '</g>' \
          '<g id="holes">' \
          '</g>' \
      '</svg>'
    end

    it 'must return an error' do
      expect(response.status).to eq(422)

      json = JSON.parse(response.body)
      expect(json['error_message']).to eq('Проверьте корректность SVG формата')
    end
  end
end
