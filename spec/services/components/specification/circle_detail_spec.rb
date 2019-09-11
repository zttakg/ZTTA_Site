describe Components::Specification, '#new' do
  context 'when holes are circles with start point in center and endpoint in center 1' do
    let!(:component) { Components::Specification.new(FixtureData.circle_with_circle_holes_center_center1) }

    it { expect(component.title).to eq('Закладная 21') }
    it { expect(component.attributes).to eq(element: :circle, attrs: {cx: 40, cy: 40, r: 40}) }
    it { expect(component.cut_material_id).to eq(1) }
    it { expect(component.quantity).to eq(2) }
    it { expect(component.detail_width).to eq(80) }
    it { expect(component.detail_height).to eq(80) }

    it 'should parametrize holes' do
      expect(component.holes[0].attributes).to eq(element: :circle, attrs: {cx: 59.9, cy: 29.94, r: 15})
      expect(component.holes[1].attributes).to eq(element: :circle, attrs: {cx: 59.88, cy: 59.88, r: 10})
      expect(component.holes[2].attributes).to eq(element: :circle, attrs: {cx: 30.1, cy: 59.58, r: 10})
      expect(component.holes[3].attributes).to eq(element: :circle, attrs: {cx: 20, cy: 25, r: 10})
    end
  end

  context 'when holes are circles with start point in center and endpoint in center' do
    let!(:component) { Components::Specification.new(FixtureData.circle_with_circle_holes_center_center) }

    it { expect(component.title).to eq('Закладная 2') }
    it { expect(component.attributes).to eq(element: :circle, attrs: {cx: 100, cy: 100, r: 100}) }
    it { expect(component.cut_material_id).to eq(1) }
    it { expect(component.quantity).to eq(2) }
    it { expect(component.detail_width).to eq(200) }
    it { expect(component.detail_height).to eq(200) }

    it 'should parametrize holes' do
      expect(component.holes[0].attributes).to eq(element: :circle, attrs: {cx: 149.7, cy: 50.3, r: 20})
      expect(component.holes[1].attributes).to eq(element: :circle, attrs: {cx: 149.7, cy: 149.7, r: 20})
      expect(component.holes[2].attributes).to eq(element: :circle, attrs: {cx: 50.3, cy: 149.7, r: 20})
      expect(component.holes[3].attributes).to eq(element: :circle, attrs: {cx: 50.3, cy: 50.3, r: 20})
    end
  end

  context 'when holes are circles with start point in center and endpoint on side' do
    let!(:component) { Components::Specification.new(FixtureData.circle_with_circle_holes_center_side) }

    it { expect(component.title).to eq('Закладная 2') }
    it { expect(component.attributes).to eq(element: :circle, attrs: {cx: 100, cy: 100, r: 100}) }
    it { expect(component.cut_material_id).to eq(1) }
    it { expect(component.quantity).to eq(2) }
    it { expect(component.detail_width).to eq(200) }
    it { expect(component.detail_height).to eq(200) }

    it 'should parametrize holes' do
      expect(component.holes[0].attributes).to eq(element: :circle, attrs: {cx: 149.7, cy: 50.3, r: 20})
      expect(component.holes[1].attributes).to eq(element: :circle, attrs: {cx: 149.7, cy: 149.7, r: 20})
      expect(component.holes[2].attributes).to eq(element: :circle, attrs: {cx: 50.3, cy: 149.7, r: 20})
      expect(component.holes[3].attributes).to eq(element: :circle, attrs: {cx: 50.3, cy: 50.3, r: 20})
    end
  end

  context 'when holes are circles with start point on side and endpoint in center' do
    let!(:component) { Components::Specification.new(FixtureData.circle_with_circle_holes_side_center) }

    it { expect(component.title).to eq('Закладная 2') }
    it { expect(component.attributes).to eq(element: :circle, attrs: {cx: 100, cy: 100, r: 100}) }
    it { expect(component.cut_material_id).to eq(1) }
    it { expect(component.quantity).to eq(2) }
    it { expect(component.detail_width).to eq(200) }
    it { expect(component.detail_height).to eq(200) }

    it 'should parametrize holes' do
      expect(component.holes[0].attributes).to eq(element: :circle, attrs: {cx: 149.7, cy: 50.3, r: 20})
      expect(component.holes[1].attributes).to eq(element: :circle, attrs: {cx: 149.7, cy: 149.7, r: 20})
      expect(component.holes[2].attributes).to eq(element: :circle, attrs: {cx: 50.3, cy: 149.7, r: 20})
      expect(component.holes[3].attributes).to eq(element: :circle, attrs: {cx: 50.3, cy: 50.3, r: 20})
    end
  end

  context 'when holes are circles with start point on side and endpoint on side' do
    let!(:component) { Components::Specification.new(FixtureData.circle_with_circle_holes_side_side) }

    it { expect(component.title).to eq('Закладная 2') }
    it { expect(component.attributes).to eq(element: :circle, attrs: {cx: 100, cy: 100, r: 100}) }
    it { expect(component.cut_material_id).to eq(1) }
    it { expect(component.quantity).to eq(2) }
    it { expect(component.detail_width).to eq(200) }
    it { expect(component.detail_height).to eq(200) }

    it 'should parametrize holes' do
      expect(component.holes[0].attributes).to eq(element: :circle, attrs: {cx: 149.7, cy: 50.3, r: 20})
      expect(component.holes[1].attributes).to eq(element: :circle, attrs: {cx: 149.7, cy: 149.7, r: 20})
      expect(component.holes[2].attributes).to eq(element: :circle, attrs: {cx: 50.3, cy: 149.7, r: 20})
      expect(component.holes[3].attributes).to eq(element: :circle, attrs: {cx: 50.3, cy: 50.3, r: 20})
    end
  end
end
