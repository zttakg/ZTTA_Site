describe DetailSVG::Calculation, '#new' do
  let!(:component) { Components::Specification.new(fixture) }
  let!(:svg) { Components::SVG.new(component).build }
  let!(:detail_svg) { DetailSVG::Calculation.new(svg) }

  context 'rectangle body with rounded corners' do
    let!(:fixture) do
      fx = FixtureData.rectangle_with_rectangle_center_holes
      fx[:rectangle][:radius] = 15
      fx
    end

    it { expect(detail_svg.body_area).to eq(31806.86) }
    it { expect(detail_svg.body_perimeter).to eq(694.25) }
    it { expect(detail_svg.holes.map(&:area)).to match_array([800, 1600, 400, 2400]) }
    it { expect(detail_svg.holes_area).to eq(5200) }
    it { expect(detail_svg.holes.map(&:perimeter)).to match_array([120, 160, 80, 200]) }
    it { expect(detail_svg.holes_perimeter).to eq(560) }
    it { expect(detail_svg.area).to eq(26607) }
    it { expect(detail_svg.perimeter).to eq(1255) }
  end

  context 'rectangle body without rounded corners' do
    let!(:fixture) { FixtureData.rectangle_with_rectangle_center_holes }

    it { expect(detail_svg.body_area).to eq(32000) }
    it { expect(detail_svg.body_perimeter).to eq(720) }
    it { expect(detail_svg.holes.map(&:area)).to match_array([800, 1600, 400, 2400]) }
    it { expect(detail_svg.holes_area).to eq(5200) }
    it { expect(detail_svg.holes.map(&:perimeter)).to match_array([120, 160, 80, 200]) }
    it { expect(detail_svg.holes_perimeter).to eq(560) }
    it { expect(detail_svg.area).to eq(26800) }
    it { expect(detail_svg.perimeter).to eq(1280) }
  end
end
