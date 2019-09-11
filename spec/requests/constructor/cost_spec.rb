describe 'POST cost', type: :request do
  before do
    prepare_cut_and_materials
    post(constructor_cost_path, nil, params)
  end

  context 'and send valid json' do
    let!(:params) do
      fixture_data = FixtureData.rectangle_with_rectangle_center_holes
      fixture_data[:title] = ''
      fixture_data[:material] = CutMaterial.third.id
      {shape: fixture_data}
    end

    it { expect(response.status).to eq(200) }
    it { expect(Detail.count).to eq(0) }

    it 'should return success message' do
      expect(response_json[:cost][:price]).to eq(44880)
      expect(response_json[:cost][:createDays].to_i).to eq(1)
      expect(response_json[:cost][:shapeType]).to eq('rectangle')
      expect(response_json[:cost][:cutTypeTitle]).to eq(CutMaterial.third.cut.name)
      expect(response_json[:cost][:materialTitle]).to eq("#{CutMaterial.third.material.name} #{CutMaterial.third.material.thickness} мм")
      expect(response_json[:cost][:count]).to eq(1)
      expect(response_json[:cost][:width]).to eq(200)
      expect(response_json[:cost][:height]).to eq(160)
      expect(response_json[:cost][:cutLength]).to eq(1280)
      expect(response_json[:cost][:area]).to eq(26800)
      expect(response_json[:cost][:mass]).to eq(69)
    end
  end
end
