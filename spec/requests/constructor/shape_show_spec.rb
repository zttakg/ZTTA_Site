describe 'GET shape show', type: :request do
  let!(:cut_materials) { prepare_cut_and_materials }
  let!(:client) { create :client }
  let!(:another_client) { create :client }
  let!(:detail) { Details::AddToList.call(detail: client.details.new, detail_data: FixtureData.rectangle_with_rectangle_center_holes.merge(material: CutMaterial.first.id)).detail }
  let!(:another_detail) { Details::AddToList.call(detail: another_client.details.new, detail_data: FixtureData.rectangle_with_rectangle_center_holes.merge(material: CutMaterial.first.id)).detail }

  context 'when user not authorized' do
    before { get("/constructor/shape/#{detail.id}", nil, nil) }

    it { expect(response.status).to eq(401) }
  end

  context 'when client authorized' do
    before { login_as(client) }

    context 'when client get not own detail' do
      before { get("/constructor/shape/#{another_detail.id}", nil, nil) }

      it { expect(response.status).to eq(404) }

      it 'should return error message' do
        expect(response_json[:errors]).to match_array([{type: 'critical', source: 'critical', message: 'Деталь не найдена', description: ''}])
      end
    end

    context 'when client get own detail' do
      before { get("/constructor/shape/#{detail.id}", nil, nil) }

      it { expect(response.status).to eq(200) }

      it 'should return success message' do
        expect(response_json[:shape][:id]).to eq(client.details.last.id)
        expect(response_json[:shape][:title]).to eq('Закладная 1')
        expect(response_json[:shape][:type]).to eq('rectangle')
      end
    end
  end
end
