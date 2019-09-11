describe Components::SVG, '#build' do
  let!(:svg) { Components::SVG.new(component).build }
  let!(:component) { Components::Specification.new(FixtureData.triangle_with_circle_holes) }
  let!(:xml) do
    '<svg xmlns="http://www.w3.org/2000/svg"' \
      ' xml:space="preserve"' \
      ' version="1.1"' \
      ' xmlns:xlink="http://www.w3.org/1999/xlink"' \
      ' width="100%"' \
      ' height="100%"' \
      ' viewBox="0 0 100 300">' \
        '<g id="body">' \
          '<polygon points="0,0 0,100 300,100 0,0"/>' \
        '</g>' \
        '<g id="holes">' \
          '<circle cx="25" cy="45" r="15" fill="white"/>' \
          '<circle cx="80" cy="80" r="10" fill="white"/>' \
        '</g>' \
    '</svg>'
  end

  it { expect(svg).to eq(xml) }
end
