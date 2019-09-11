describe 'POST save', type: :request do
  let!(:cut_and_materials) { prepare_cut_and_materials }
  let!(:client) { create :client }
  let!(:client_detail) { Details::AddToList.call(detail: client.details.new, detail_data: FixtureData.triangle_with_circle_holes.merge(material: CutMaterial.first.id)) }

  context 'when user not authorized' do
    before { post(constructor_save_path, nil, nil) }

    it { expect(response.status).to eq(401) }

    it 'should response error message' do
      expect(response_json[:errors]).to match_array([{type: 'critical', source: 'critical', message: 'Вам необходимо войти в систему или зарегистрироваться', description: ''}])
    end
  end

  context 'when user authorized' do
    before do
      login_as(client)
      post(constructor_save_path, nil, params)
    end

    context 'and send invalid json' do
      let!(:params) { {shape: 'blablablablabla'} }

      it { expect(response.status).to eq(422) }

      it 'should return error message' do
        expect(response_json[:errors]).to match_array([{type: 'critical', source: 'critical', message: "Ошибка получения данных ##{CurrentThread.id}", description: ''}])
      end
    end

    context 'and send invalid key name' do
      let!(:params) { {blablabla: FixtureData.rectangle_with_rectangle_center_holes} }

      it { expect(response.status).to eq(422) }

      it 'should return error message' do
        expect(response_json[:errors]).to match_array([{type: 'critical', source: 'critical', message: "Ошибка получения данных ##{CurrentThread.id}", description: ''}])
      end
    end

    context 'and send invalid params' do
      context 'not precence name' do
        let!(:params) do
          fixture_data = FixtureData.rectangle_with_rectangle_center_holes
          fixture_data[:title] = ''
          fixture_data[:material] = CutMaterial.third.id
          fixture_data.delete(:quantity)

          {shape: fixture_data}
        end

        it { expect(response.status).to eq(422) }

        it 'should return error message' do
          expect(response_json[:errors]).to match_array(
            [
              {type: 'validation', source: 'title', message: 'Название должно быть заполнено', description: ''},
              {type: 'validation', source: 'quantity', message: 'Кол-во деталей должно быть больше нуля', description: ''}
            ]
          )
        end
      end

      context 'name already exists' do
        let!(:params) { {shape: FixtureData.triangle_with_circle_holes.merge(material: CutMaterial.third.id)} }

        it { expect(response.status).to eq(422) }

        it 'should return error message' do
          expect(response_json[:errors]).to match_array([{type: 'validation', source: 'title', message: 'Деталь с таким названием уже существует', description: ''}])
        end
      end
    end

    context 'and send valid json' do
      let!(:params) do
        fixture_data = FixtureData.rectangle_with_rectangle_center_holes
        fixture_data[:material] = CutMaterial.third.id
        {shape: fixture_data}
      end

      let!(:xml1) do
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

      it { expect(response.status).to eq(200) }

      it 'should create detail' do
        expect(client.details.count).to eq(2)
        detail = client.details.last

        expect(detail.name).to eq('Закладная 1')
        expect(detail.json['type']).to eq('rectangle')
        expect(detail.json['title']).to eq(params[:shape][:title])
        expect(detail.svg).to eq(xml1)
        expect(detail.load_type).to eq('constructor')
        expect(detail.width).to eq(200)
        expect(detail.height).to eq(160)
        expect(detail.cut_material_id).to eq(CutMaterial.third.id)
        expect(detail.count).to eq(1)
        expect(detail.cut_length).to eq(1280)
        expect(detail.area).to eq(26800)
        expect(detail.mass).to eq(69)
        expect(detail.holes_count).to eq(4)
        expect(detail.price).to eq(44880)
      end

      it 'should return success message' do
        expect(response_json[:shape][:id]).to eq(client.details.last.id)
        expect(response_json[:shape][:title]).to eq('Закладная 1')
        expect(response_json[:shape][:type]).to eq('rectangle')
      end
    end
  end
end
