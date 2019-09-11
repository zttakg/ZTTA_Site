describe ServicesHelper, '.round' do
  include ServicesHelper

  it { expect(round(1)).to be_a(Integer) }
  it { expect(round(1.001)).to be_a(Integer) }
  it { expect(round(1.01)).to be_a(Float) }

  it { expect(round(200_000_000).to_s).to eq('200000000') }
  it { expect(round(200_000_000.00).to_s).to eq('200000000') }
  it { expect(round(200_000_000.01).to_s).to eq('200000000.01') }
  it { expect(round(200_000_000.001).to_s).to eq('200000000') }
end
