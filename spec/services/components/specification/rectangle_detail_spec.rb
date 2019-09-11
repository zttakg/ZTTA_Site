describe Components::Specification, '#new' do
  context 'when holes are rectangles with end point to center' do
    let!(:component) { Components::Specification.new(FixtureData.rectangle_with_rectangle_center_holes) }

    it { expect(component.title).to eq('Закладная 1') }
    it { expect(component.attributes).to eq(element: :rect, attrs: {x: 0, y: 0, width: 200, height: 160, rx: 0, ry: 0}) }
    it { expect(component.cut_material_id).to eq(1) }
    it { expect(component.quantity).to eq(1) }
    it { expect(component.detail_width).to eq(200) }
    it { expect(component.detail_height).to eq(160) }

    it 'should parametrize holes' do
      expect(component.holes[0].attributes).to eq(element: :rect, attrs: {x: 20, y: 20, width: 40, height: 20, rx: 0, ry: 0})
      expect(component.holes[1].attributes).to eq(element: :rect, attrs: {x: 150, y: 10, width: 40, height: 40, rx: 0, ry: 0})
      expect(component.holes[2].attributes).to eq(element: :rect, attrs: {x: 30, y: 120, width: 20, height: 20, rx: 0, ry: 0})
      expect(component.holes[3].attributes).to eq(element: :rect, attrs: {x: 140, y: 90, width: 40, height: 60, rx: 0, ry: 0})
    end
  end

  context 'when holes are rectangles with end point to side' do
    let!(:component) { Components::Specification.new(FixtureData.rectangle_with_rectangle_side_holes) }

    it { expect(component.title).to eq('Закладная 1') }
    it { expect(component.attributes).to eq(element: :rect, attrs: {x: 0, y: 0, width: 200, height: 160, rx: 0, ry: 0}) }
    it { expect(component.cut_material_id).to eq(1) }
    it { expect(component.quantity).to eq(1) }
    it { expect(component.detail_width).to eq(200) }
    it { expect(component.detail_height).to eq(160) }

    it 'should parametrize holes' do
      expect(component.holes[0].attributes).to eq(element: :rect, attrs: {x: 20, y: 20, width: 40, height: 20, rx: 0, ry: 0})
      expect(component.holes[1].attributes).to eq(element: :rect, attrs: {x: 150, y: 10, width: 40, height: 40, rx: 0, ry: 0})
      expect(component.holes[2].attributes).to eq(element: :rect, attrs: {x: 30, y: 120, width: 20, height: 20, rx: 0, ry: 0})
      expect(component.holes[3].attributes).to eq(element: :rect, attrs: {x: 140, y: 90, width: 40, height: 60, rx: 0, ry: 0})
    end
  end

  context 'when holes are circles with end point to center' do
    let!(:component) { Components::Specification.new(FixtureData.rectangle_with_circle_center_holes) }

    it { expect(component.title).to eq('Закладная 1') }
    it { expect(component.attributes).to eq(element: :rect, attrs: {x: 0, y: 0, width: 200, height: 160, rx: 0, ry: 0}) }
    it { expect(component.cut_material_id).to eq(1) }
    it { expect(component.quantity).to eq(1) }
    it { expect(component.detail_width).to eq(200) }
    it { expect(component.detail_height).to eq(160) }

    it 'should parametrize holes' do
      expect(component.holes[0].attributes).to eq(element: :circle, attrs: {cx: 40, cy: 60, r: 10})
      expect(component.holes[1].attributes).to eq(element: :circle, attrs: {cx: 160, cy: 40, r: 10})
      expect(component.holes[2].attributes).to eq(element: :circle, attrs: {cx: 50, cy: 120, r: 30})
      expect(component.holes[3].attributes).to eq(element: :circle, attrs: {cx: 150, cy: 100, r: 20})
    end
  end

  context 'when holes are circles with end point to side' do
    let!(:component) { Components::Specification.new(FixtureData.rectangle_with_circle_side_holes) }

    it { expect(component.title).to eq('Закладная 1') }
    it { expect(component.attributes).to eq(element: :rect, attrs: {x: 0, y: 0, width: 200, height: 160, rx: 0, ry: 0}) }
    it { expect(component.cut_material_id).to eq(1) }
    it { expect(component.quantity).to eq(1) }
    it { expect(component.detail_width).to eq(200) }
    it { expect(component.detail_height).to eq(160) }

    it 'should parametrize holes' do
      expect(component.holes[0].attributes).to eq(element: :circle, attrs: {cx: 40, cy: 60, r: 10})
      expect(component.holes[1].attributes).to eq(element: :circle, attrs: {cx: 160, cy: 40, r: 10})
      expect(component.holes[2].attributes).to eq(element: :circle, attrs: {cx: 50, cy: 120, r: 30})
      expect(component.holes[3].attributes).to eq(element: :circle, attrs: {cx: 150, cy: 100, r: 20})
    end
  end

  context 'when component is invalid' do
    it 'should raise error'
  end
end
