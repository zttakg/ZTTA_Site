describe DetailSVG::Calculation, '#new' do
  let!(:fixture) { FixtureData.circle_with_circle_holes_center_center1 }
  let!(:component) { Components::Specification.new(fixture) }
  let!(:svg) { Components::SVG.new(component).build }
  let!(:detail_svg) { DetailSVG::Calculation.new(svg) }

  context 'circle body' do
    it { expect(detail_svg.body_area).to eq(5026.55) }
    it { expect(detail_svg.body_perimeter).to eq(251.33) }
    it { expect(detail_svg.holes.map(&:area)).to match_array([314.16, 706.86, 314.16, 314.16]) }
    it { expect(detail_svg.holes_area).to eq(1649.34) }
    it { expect(detail_svg.holes.map(&:perimeter)).to match_array([62.83, 94.25, 62.83, 62.83]) }
    it { expect(detail_svg.holes_perimeter).to eq(282.74) }
    it { expect(detail_svg.area).to eq(3378) }
    it { expect(detail_svg.perimeter).to eq(535) }
  end
end
