describe Components::Specification, '#new' do
  let!(:component) { Components::Specification.new(FixtureData.triangle_with_circle_holes) }

  it { expect(component.title).to eq('Закладная 3') }
  it { expect(component.attributes).to eq(element: :polygon, attrs: {points: [[0, 0], [0, 100], [300, 100], [0, 0]]}) }
  it { expect(component.cut_material_id).to eq(1) }
  it { expect(component.quantity).to eq(3) }
  it { expect(component.detail_width).to eq(100) }
  it { expect(component.detail_height).to eq(300) }

  it 'should parametrize holes' do
    expect(component.holes[0].attributes).to eq(element: :circle, attrs: {cx: 25, cy: 45, r: 15})
    expect(component.holes[1].attributes).to eq(element: :circle, attrs: {cx: 80, cy: 80, r: 10})
  end
end
