describe DetailSVG::Calculation, '#new' do
  let!(:component) { Components::Specification.new(FixtureData.rectangle_with_rectangle_center_holes) }
  let!(:svg) { Components::SVG.new(component).build }
  let!(:detail_svg) { DetailSVG::Calculation.new(svg) }
  let!(:detail_cost) { Details::Cost.new(detail_svg) }

  context 'rectangle body' do
    # it { binding.pry }
    # it { expect(detail_svg.body_area).to eq(31807) }
    # it { expect(detail_svg.body_perimeter).to eq(694) }
    # it { expect(detail_svg.holes.map(&:area)).to match_array([800, 1600, 400, 2400]) }
    # it { expect(detail_svg.holes_area).to eq(5200) }
    # it { expect(detail_svg.holes.map(&:perimeter)).to match_array([120, 160, 80, 200]) }
    # it { expect(detail_svg.holes_perimeter).to eq(560) }
    # it { expect(detail_svg.area).to eq(26607) }
    # it { expect(detail_svg.perimeter).to eq(1254) }
  end
end
