describe 'POST add_to_cart', type: :request do
  let!(:cut_and_materials) { prepare_cut_and_materials }
  let!(:client) { create :client }

  context 'when user not authorized' do
    before { post(constructor_add_to_cart_path, nil, params) }

    let!(:params) do
      fixture_data = FixtureData.rectangle_with_rectangle_center_holes
      fixture_data[:material] = CutMaterial.third.id
      {shape: fixture_data}
    end

    it { expect(response.status).to eq(200) }
    it { expect(response_json[:success]).to eq('redirectTo' => '/cart') }

    it 'should create session cart item' do
      expect(IndividualItem.where(cart_session_id: session[:cart_session]).count).to eq(1)
    end
  end

  context 'when user authorized' do
    before do
      login_as(client)
      post(constructor_add_to_cart_path, nil, params)
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

      it { expect(response_json[:success]).to eq('redirectTo' => '/cart') }

      it 'should add to cart new item' do
        expect(client.individual_items.count).to eq(1)
        individual_item = client.individual_items.last

        expect(individual_item.id).to be_between(100_000_000, 999_999_999)
        expect(individual_item.individual_order_id).to be_nil
        expect(individual_item.status).to eq('in_cart')
        expect(individual_item.load_type).to eq('constructor')
        expect(individual_item.name).to eq('Закладная 1')
        expect(individual_item.count).to eq(1)
        expect(individual_item.svg).to eq(xml1)
        expect(individual_item.json['type']).to eq('rectangle')
        expect(individual_item.json['title']).to eq(params[:shape][:title])
        expect(individual_item.width).to eq(200)
        expect(individual_item.height).to eq(160)
        expect(individual_item.cut_material_id).to eq(CutMaterial.third.id)
        expect(individual_item.cut_length).to eq(1280)
        expect(individual_item.cut_name).to eq('Газовая резка')
        expect(individual_item.material_name).to eq('Сталь3')
        expect(individual_item.material_thickness).to eq(1.0)
        expect(individual_item.holes_count).to eq(4)
        expect(individual_item.area).to eq(26800)
        expect(individual_item.mass).to eq(69)
        expect(individual_item.preparation_days).to eq(1)
        expect(individual_item.price).to eq(44880)
      end
    end
  end
end
