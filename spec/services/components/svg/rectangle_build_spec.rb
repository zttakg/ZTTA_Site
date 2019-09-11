describe Components::SVG, '#build' do
  let!(:svg) { Components::SVG.new(component).build }
  let!(:xml1) do
    '<svg xmlns="http://www.w3.org/2000/svg"' \
      ' xml:space="preserve"' \
      ' version="1.1"' \
      ' xmlns:xlink="http://www.w3.org/1999/xlink"' \
      ' width="100%"' \
      ' height="100%"' \
      ' viewBox="0 0 200 160">' \
        '<g id="body">' \
          '<rect x="0" y="0" width="200" height="160" rx="0" ry="0"/>' \
        '</g>' \
        '<g id="holes">' \
          '<rect x="20" y="20" width="40" height="20" rx="0" ry="0" fill="white"/>' \
          '<rect x="150" y="10" width="40" height="40" rx="0" ry="0" fill="white"/>' \
          '<rect x="30" y="120" width="20" height="20" rx="0" ry="0" fill="white"/>' \
          '<rect x="140" y="90" width="40" height="60" rx="0" ry="0" fill="white"/>' \
        '</g>' \
    '</svg>'
  end
  let!(:xml2) do
    '<svg xmlns="http://www.w3.org/2000/svg"' \
      ' xml:space="preserve"' \
      ' version="1.1"' \
      ' xmlns:xlink="http://www.w3.org/1999/xlink"' \
      ' width="100%"' \
      ' height="100%"' \
      ' viewBox="0 0 200 160">' \
        '<g id="body">' \
          '<rect x="0" y="0" width="200" height="160" rx="0" ry="0"/>' \
        '</g>' \
        '<g id="holes">' \
          '<circle cx="40" cy="60" r="10" fill="white"/>' \
          '<circle cx="160" cy="40" r="10" fill="white"/>' \
          '<circle cx="50" cy="120" r="30" fill="white"/>' \
          '<circle cx="150" cy="100" r="20" fill="white"/>' \
        '</g>' \
    '</svg>'
  end

  context 'when holes are rectangles with end point to center' do
    let!(:component) { Components::Specification.new(FixtureData.rectangle_with_rectangle_center_holes) }

    it { expect(svg).to eq(xml1) }
  end

  context 'when holes are rectangles with end point to side' do
    let!(:component) { Components::Specification.new(FixtureData.rectangle_with_rectangle_side_holes) }

    it { expect(svg).to eq(xml1) }
  end

  context 'when holes are circles with end point to center' do
    let!(:component) { Components::Specification.new(FixtureData.rectangle_with_circle_center_holes) }

    it { expect(svg).to eq(xml2) }
  end

  context 'when holes are circles with end point to side' do
    let!(:component) { Components::Specification.new(FixtureData.rectangle_with_circle_side_holes) }

    it { expect(svg).to eq(xml2) }
  end
end
