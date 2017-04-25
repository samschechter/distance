require_relative '../../../lib/distance/core_ext/integer'
require_relative '../../../lib/distance/core_ext/numeric'

RSpec.describe Integer do
  describe '#kilometers' do
    it 'returns a Distance instance with the correct number of meters' do
      distance = 5.kilometers
      expect(distance).to be_a(Distance)
      expect(distance.to_f).to be_within(FLOATING_POINT_TOLERANCE).of(5000)
    end
  end

  describe '#kilometer' do
    it 'returns a Distance instance with the correct number of meters' do
      distance = 1.kilometer
      expect(distance).to be_a(Distance)
      expect(distance.to_f).to be_within(FLOATING_POINT_TOLERANCE).of(1000)
    end
  end

  describe '#miles' do
    it 'returns a Distance instance with the correct number of meters' do
      distance = 5.miles
      expect(distance).to be_a(Distance)
      expect(distance.to_f).to be_within(FLOATING_POINT_TOLERANCE).of(8046.72)
    end
  end

  describe '#mile' do
    it 'returns a Distance instance with the correct number of meters' do
      distance = 1.mile
      expect(distance).to be_a(Distance)
      expect(distance.to_f).to be_within(FLOATING_POINT_TOLERANCE).of(1609.344)
    end
  end

  describe '#*' do
    context 'when the other instance is a Distance' do
      it 'returns a distance instance that is the N times the original distance' do
        product = 4 * Distance.meters(2.5)
        expect(product).to be_a(Distance)
        expect(product.to_f).to be_within(FLOATING_POINT_TOLERANCE).of(10)
      end
    end

    context 'when the other instance is a Numeric' do
      # Make sure we call super so we don't break the original implementation
      it 'multiplies the 2 numbers' do
        expect(4 * 6).to eq(24)
      end
    end
  end
end
