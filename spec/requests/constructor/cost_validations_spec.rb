describe 'POST cost validation', type: :request do
  let!(:client) { create :client }

  before do
    prepare_cut_and_materials
    login_as(client)
    post(constructor_cost_path, nil, params)
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
    context 'with empty data' do
      let!(:params) do
        fixture_data = FixtureData.rectangle_with_rectangle_center_holes
        fixture_data[:title] = ''
        fixture_data[:cutType] = ''
        fixture_data[:material] = ''
        fixture_data.delete(:quantity)

        {shape: fixture_data}
      end

      it { expect(response.status).to eq(422) }

      it 'should return error message' do
        expect(response_json[:errors]).to match_array(
          [
            {type: 'validation', source: 'cutType', message: 'Выберите тип реза', description: ''},
            {type: 'validation', source: 'material', message: 'Выберите материал', description: ''},
            {type: 'validation', source: 'quantity', message: 'Кол-во деталей должно быть больше нуля', description: ''}
          ]
        )
      end
    end

    context 'with invalid figure size data' do
      context 'when figure is rectangle' do
        context 'with empty data' do
          let!(:params) do
            fixture_data = FixtureData.rectangle_with_rectangle_center_holes
            fixture_data[:rectangle] = {}
            {shape: fixture_data}
          end

          it { expect(response.status).to eq(422) }

          it 'should return error message' do
            expect(response_json[:errors]).to match_array([{type: 'critical', source: 'critical', message: "Ошибка получения данных ##{CurrentThread.id}", description: ''}])
          end
        end

        context 'with invalid values' do
          let!(:params) do
            fixture_data = FixtureData.rectangle_with_rectangle_center_holes
            fixture_data[:rectangle] = {width: 0, height: 0, radius: -10}
            {shape: fixture_data}
          end

          it { expect(response.status).to eq(422) }

          it 'should return error message' do
            expect(response_json[:errors]).to include(
              {type: 'validation', source: 'rectangle.width', message: 'Длинна фигуры должна быть больше нуля', description: ''},
              {type: 'validation', source: 'rectangle.height', message: 'Ширина фигуры должна быть больше нуля', description: ''},
              {type: 'validation', source: 'rectangle.radius', message: 'Радиус скругления фигуры должен быть больше нуля', description: ''}
            )
          end
        end
      end

      context 'when figure is circle' do
        context 'with empty data' do
          let!(:params) do
            fixture_data = FixtureData.circle_with_circle_holes_center_center
            fixture_data[:circle] = {}
            {shape: fixture_data}
          end

          it { expect(response.status).to eq(422) }

          it 'should return error message' do
            expect(response_json[:errors]).to match_array([{type: 'critical', source: 'critical', message: "Ошибка получения данных ##{CurrentThread.id}", description: ''}])
          end
        end

        context 'with invalid values' do
          let!(:params) do
            fixture_data = FixtureData.circle_with_circle_holes_center_center
            fixture_data[:circle] = {width: 0, height: 0, radius: -10}
            {shape: fixture_data}
          end

          it { expect(response.status).to eq(422) }

          it 'should return error message' do
            expect(response_json[:errors]).to include(
              {type: 'validation', source: 'circle.diameter', message: 'Диаметр фигуры должен быть больше нуля', description: ''}
            )
          end
        end
      end

      context 'when figure is triangle' do
        context 'with empty data' do
          let!(:params) do
            fixture_data = FixtureData.triangle_with_circle_holes
            fixture_data[:triangle] = {}
            {shape: fixture_data}
          end

          it { expect(response.status).to eq(422) }

          it 'should return error message' do
            expect(response_json[:errors]).to match_array([{type: 'critical', source: 'critical', message: "Ошибка получения данных ##{CurrentThread.id}", description: ''}])
          end
        end

        context 'with invalid values' do
          let!(:params) do
            fixture_data = FixtureData.triangle_with_circle_holes
            fixture_data[:triangle] = {side1: 0, side2: 0}
            {shape: fixture_data}
          end

          it { expect(response.status).to eq(422) }

          it 'should return error message' do
            expect(response_json[:errors]).to match_array(
              [
                {type: 'validation', source: 'triangle.side1', message: 'Длинна фигуры должна быть больше нуля', description: ''},
                {type: 'validation', source: 'triangle.side2', message: 'Ширина фигуры должна быть больше нуля', description: ''}
              ]
            )
          end
        end
      end
    end
  end
end

describe 'POST critical cost validation', type: :request do
  let!(:client) { create :client }

  before do
    login_as(client)
    post(constructor_cost_path, nil, params)
  end

  context 'when empty constants' do
    let!(:params) { {shape: FixtureData.rectangle_with_rectangle_center_holes} }

    it { expect(response.status).to eq(422) }

    it 'should return error message' do
      expect(response_json[:errors]).to match_array([{type: 'critical', source: 'critical', message: "Ошибка вычисления стоимости ##{CurrentThread.id}", description: ''}])
    end
  end
end
