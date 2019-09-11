describe 'GET info', type: :request do
  before do
    prepare_cut_and_materials
    get(constructor_info_path, nil, nil)
  end

  it { expect(response.status).to eq(200) }

  it 'should return valid json' do
    expect(response_json[:cutTypes].count).to eq(Cut.count)
    expect(response_json[:cutMaterials].count).to eq(CutMaterial.count)

    ct1 = response_json[:cutTypes].first
    cut1 = Cut.find_by(name: 'Газовая резка')
    expect(ct1[:name]).to eq('Газовая резка')
    expect(ct1[:cutMaterialIds]).to match_array(cut1.cut_materials.map { |cm| cm.id.to_s })

    ct2 = response_json[:cutTypes].second
    cut2 = Cut.find_by(name: 'Лазерная резка')
    expect(ct2[:name]).to eq('Лазерная резка')
    expect(ct2[:cutMaterialIds]).to match_array(cut2.cut_materials.map { |cm| cm.id.to_s })
  end

  it 'should return min holes and list/cut max sizes'
end
