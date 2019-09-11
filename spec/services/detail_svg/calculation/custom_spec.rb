describe DetailSVG::Calculation, '#new' do
  let!(:svg) do
    '<svg xmlns="http://www.w3.org/2000/svg" xml:space="preserve" version="1.1" xmlns:xlink="http://www.w3.org/1999/xlink" width="100%" height="100%" viewBox="0 0 700 660">' \
      '<g id="body">' \
        '<polygon points="0,0 30,0 30,10 20,10 20,40 40,40 40,0 50,0 50,40 70,40 70,30 80,30 80,40 100,40 100,10 90,10 90,0 120,0 120,10 110,10 110,40 130,40 130,0 160,0 160,50 150,50 150,30 140,30 140,50 0,50 0,40 10,40 10,10 0,10 0,0"/>' \
      '</g>' \
      '<g id="holes">' \
        '<polygon points="140,10 150,10 150,20 140,20" fill="white"/>' \
      '</g>' \
    '</svg>'
  end
  let!(:detail_svg) { DetailSVG::Calculation.new(svg) }

  it { expect(detail_svg.body_area).to eq(4300) }
  it { expect(detail_svg.body_perimeter).to eq(800) }
  it { expect(detail_svg.holes.map(&:area)).to match_array([100]) }
  it { expect(detail_svg.holes_area).to eq(100) }
  it { expect(detail_svg.holes.map(&:perimeter)).to match_array([40]) }
  it { expect(detail_svg.holes_perimeter).to eq(40) }
  it { expect(detail_svg.area).to eq(4200) }
  it { expect(detail_svg.perimeter).to eq(840) }
end
