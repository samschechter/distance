require_relative '../../../lib/distance/core_ext/float'
require_relative '../../../lib/distance/core_ext/numeric'

RSpec.describe Float do
  describe '#kilometers' do
    it 'returns a Distance instance with the correct number of meters' do
      distance = 5.5.kilometers
      expect(distance).to be_a(Distance)
      expect(distance.to_f).to be_within(FLOATING_POINT_TOLERANCE).of(5500)
    end
  end

  describe '#kilometer' do
    it 'returns a Distance instance with the correct number of meters' do
      distance = 0.5.kilometer
      expect(distance).to be_a(Distance)
      expect(distance.to_f).to be_within(FLOATING_POINT_TOLERANCE).of(500)
    end
  end

  describe '#miles' do
    it 'returns a Distance instance with the correct number of meters' do
      distance = 2.5.miles
      expect(distance).to be_a(Distance)
      expect(distance.to_f).to be_within(FLOATING_POINT_TOLERANCE).of(4023.36)
    end
  end

  describe '#mile' do
    it 'returns a Distance instance with the correct number of meters' do
      distance = 0.5.mile
      expect(distance).to be_a(Distance)
      expect(distance.to_f).to be_within(FLOATING_POINT_TOLERANCE).of(804.672)
    end
  end

  describe '#*' do
    context 'when the other instance is a Distance' do
      it 'returns a distance instance that is the N times the original distance' do
        product = 2.5 * Distance.meters(4)
        expect(product).to be_a(Distance)
        expect(product.to_f).to be_within(FLOATING_POINT_TOLERANCE).of(10)
      end
    end

    context 'when the other instance is a Numeric' do
      # Make sure we call super so we don't break the original implementation
      it 'multiplies the 2 numbers' do
        expect(4.5 * 2.5).to eq(11.25)
      end
    end
  end
end
