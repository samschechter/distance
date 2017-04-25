RSpec.describe Distance do
  describe '.kilometers' do
    it 'returns a Distance instance with 1000 times the value supplied' do
      subject = Distance.kilometers(4)
      expect(subject).to be_a(Distance)
      expect(subject.to_f).to eq(4000)
    end
  end

  describe '.miles' do
    it 'returns a Distance instance with 1609.344 times the value supplied' do
      subject = Distance.miles(5)
      expect(subject).to be_a(Distance)
      expect(subject.to_f).to be_within(0.01).of(8046.72)
    end
  end

  describe 'HALF_MARATHON' do
    it 'returns a Distance of 21097.5 meteres' do
      subject = Distance::HALF_MARATHON
      expect(subject).to be_a(Distance)
      expect(subject.to_f).to be_within(0.01).of(21097.5)
    end
  end

  describe 'MARATHON' do
    it 'returns a Distance of 42195 meteres' do
      subject = Distance::MARATHON
      expect(subject).to be_a(Distance)
      expect(subject.to_f).to be_within(0.01).of(42195)
    end
  end
end
