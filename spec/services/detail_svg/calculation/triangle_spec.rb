describe DetailSVG::Calculation, '#new' do
  let!(:fixture) { FixtureData.triangle_with_circle_holes }
  let!(:component) { Components::Specification.new(fixture) }
  let!(:svg) { Components::SVG.new(component).build }
  let!(:detail_svg) { DetailSVG::Calculation.new(svg) }

  context 'triangle body' do
    it { expect(detail_svg.body_area).to eq(15000) }
    it { expect(detail_svg.body_perimeter).to eq(716.23) }
    it { expect(detail_svg.holes.map(&:area)).to match_array([314.16, 706.86]) }
    it { expect(detail_svg.holes_area).to eq(1021.02) }
    it { expect(detail_svg.holes.map(&:perimeter)).to match_array([62.83, 94.25]) }
    it { expect(detail_svg.holes_perimeter).to eq(157.08) }
    it { expect(detail_svg.area).to eq(13979) }
    it { expect(detail_svg.perimeter).to eq(874) }
  end
end
