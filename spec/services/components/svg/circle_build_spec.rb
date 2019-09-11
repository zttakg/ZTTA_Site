describe Components::SVG, '#build' do
  let!(:svg) { Components::SVG.new(component).build }
  let!(:xml) do
    '<svg xmlns="http://www.w3.org/2000/svg"' \
      ' xml:space="preserve"' \
      ' version="1.1"' \
      ' xmlns:xlink="http://www.w3.org/1999/xlink"' \
      ' width="100%"' \
      ' height="100%"' \
      ' viewBox="0 0 200 200">' \
        '<g id="body">' \
          '<circle cx="100" cy="100" r="100"/>' \
        '</g>' \
        '<g id="holes">' \
          '<circle cx="149.7" cy="50.3" r="20" fill="white"/>' \
          '<circle cx="149.7" cy="149.7" r="20" fill="white"/>' \
          '<circle cx="50.3" cy="149.7" r="20" fill="white"/>' \
          '<circle cx="50.3" cy="50.3" r="20" fill="white"/>' \
        '</g>' \
    '</svg>'
  end

  context 'when holes are circles with start point in center and endpoint in center 1' do
    let!(:component) { Components::Specification.new(FixtureData.circle_with_circle_holes_center_center1) }
    let!(:xml1) do
      '<svg xmlns="http://www.w3.org/2000/svg"' \
        ' xml:space="preserve"' \
        ' version="1.1"' \
        ' xmlns:xlink="http://www.w3.org/1999/xlink"' \
        ' width="100%"' \
        ' height="100%"' \
        ' viewBox="0 0 80 80">' \
          '<g id="body">' \
            '<circle cx="40" cy="40" r="40"/>' \
          '</g>' \
          '<g id="holes">' \
            '<circle cx="59.9" cy="29.94" r="15" fill="white"/>' \
            '<circle cx="59.88" cy="59.88" r="10" fill="white"/>' \
            '<circle cx="30.1" cy="59.58" r="10" fill="white"/>' \
            '<circle cx="20" cy="25" r="10" fill="white"/>' \
          '</g>' \
      '</svg>'
    end

    it { expect(svg).to eq(xml1) }
  end

  context 'when holes are circles with start point in center and endpoint in center' do
    let!(:component) { Components::Specification.new(FixtureData.circle_with_circle_holes_center_center) }

    it { expect(svg).to eq(xml) }
  end

  context 'when holes are circles with start point in center and endpoint on side' do
    let!(:component) { Components::Specification.new(FixtureData.circle_with_circle_holes_center_side) }

    it { expect(svg).to eq(xml) }
  end

  context 'when holes are circles with start point on side and endpoint in center' do
    let!(:component) { Components::Specification.new(FixtureData.circle_with_circle_holes_side_center) }

    it { expect(svg).to eq(xml) }
  end

  context 'when holes are circles with start point on side and endpoint on side' do
    let!(:component) { Components::Specification.new(FixtureData.circle_with_circle_holes_side_side) }

    it { expect(svg).to eq(xml) }
  end

  # context 'test many some holes' do
  #   let!(:attrs) do
  #     hsh = {
  #       type: 'circle',
  #       title: 'Detail #2',
  #       material: 1,
  #       quantity: 2,
  #       circle: {diameter: 200},
  #       holes: {}
  #     }

  #     20.times{|a| hsh[:holes]["_a#{a}"] = { id: '_a', type: 'circle', position: {zeroPoint: {circle: 'center', hole: 'center'}, l: 80, angle: a * 30}, diameter: 20}}
  #     20.times{|a| hsh[:holes]["_b#{a}"] = { id: '_a', type: 'circle', position: {zeroPoint: {circle: 'center', hole: 'center'}, l: 60, angle: a * 20}, diameter: 20}}
  #     hsh
  #   end
  #   let!(:component) { Components::Specification.new(attrs) }
  #   let!(:svg) { Components::SVG.new(component).build }

  #   it 'should parametrize holes' do
  #     File.write('/Users/ilia/TEMP/test.svg', svg)
  #   end
  # end
end
