RSpec.describe Distance do
  FLOATING_POINT_TOLERANCE = 0.0001
  
  describe '.kilometers' do
    it 'returns a Distance instance with 1000 times the value supplied' do
      subject = Distance.kilometers(4)
      expect(subject).to be_a(Distance)
      expect(subject.to_f).to be_within(FLOATING_POINT_TOLERANCE).of(4000)
    end
  end

  describe '.miles' do
    it 'returns a Distance instance with 1609.344 times the value supplied' do
      subject = Distance.miles(5)
      expect(subject).to be_a(Distance)
      expect(subject.to_f).to be_within(FLOATING_POINT_TOLERANCE).of(8046.72)
    end
  end

  describe '::HALF_MARATHON' do
    it 'returns a Distance of 21097.5 meteres' do
      subject = Distance::HALF_MARATHON
      expect(subject).to be_a(Distance)
      expect(subject.to_f).to be_within(FLOATING_POINT_TOLERANCE).of(21097.5)
    end
  end

  describe '::MARATHON' do
    it 'returns a Distance of 42195 meteres' do
      subject = Distance::MARATHON
      expect(subject).to be_a(Distance)
      expect(subject.to_f).to be_within(FLOATING_POINT_TOLERANCE).of(42195)
    end
  end

  describe '#to_kilometers' do
    it 'returns the initializer argument / 1000' do
      subject = Distance.new(1525)
      expect(subject.to_kilometers).to be_within(FLOATING_POINT_TOLERANCE).of(1.525)
    end
  end

  describe '#to_miles' do
    it 'returns the initializer argument / 1609.344' do
      subject = Distance.new(10000)
      expect(subject.to_miles).to be_within(FLOATING_POINT_TOLERANCE).of(6.21)
    end
  end

  describe '#+' do
    it 'returns a distance instance that is the sum of the 2 distances' do
      sum = Distance.new(1.23) + Distance.new(4.44)
      expect(sum).to be_a(Distance)
      expect(sum.to_f).to be_within(FLOATING_POINT_TOLERANCE).of(5.67)
    end

    context 'when the second object is not a distance' do
      it 'raises an ArgumentError' do
        expect do
          Distance.new(1) + 1
        end.to raise_error(ArgumentError, 'Can only add a Distance to a Distance')
      end
    end
  end

  describe '#-' do
    it 'returns a distance instance that is the difference of the 2 distances' do
      difference = Distance.new(5.67) - Distance.new(4.44)
      expect(difference).to be_a(Distance)
      expect(difference.to_f).to be_within(FLOATING_POINT_TOLERANCE).of(1.23)
    end

    context 'when the second object is not a distance' do
      it 'raises an ArgumentError' do
        expect do
          Distance.new(1) - 1
        end.to raise_error(ArgumentError, 'Can only subtract a Distance from a Distance')
      end
    end
  end

  describe '#*' do
    context 'when the second object is a Integer' do
      it 'returns a distance instance that is the N times the original distance' do
        product = Distance.new(2.5) * 4
        expect(product).to be_a(Distance)
        expect(product.to_f).to be_within(FLOATING_POINT_TOLERANCE).of(10)
      end
    end

    context 'when the second object is a Float' do
      it 'returns a distance instance that is the N times the original distance' do
        product = Distance.new(4) * 2.5
        expect(product).to be_a(Distance)
        expect(product.to_f).to be_within(FLOATING_POINT_TOLERANCE).of(10)
      end
    end

    context 'when the second object is a distance' do
      it 'raises an ArgumentError' do
        expect do
          Distance.new(1) * Distance.new(1)
        end.to raise_error(ArgumentError, 'Can only multiply a Distance with a number')
      end
    end
  end

  describe '#/' do
    context 'when the second object is a Integer' do
      it 'returns a distance instance that is 1/N the original distance' do
        product = Distance.new(10) / 4
        expect(product).to be_a(Distance)
        expect(product.to_f).to be_within(FLOATING_POINT_TOLERANCE).of(2.5)
      end
    end

    context 'when the second object is a Float' do
      it 'returns a distance instance that is 1/N the original distance' do
        product = Distance.new(10) / 2.5
        expect(product).to be_a(Distance)
        expect(product.to_f).to be_within(FLOATING_POINT_TOLERANCE).of(4)
      end
    end

    context 'when the second object is a distance' do
      it 'raises an ArgumentError' do
        expect do
          Distance.new(1) / Distance.new(1)
        end.to raise_error(ArgumentError, 'Can only divide a Distance by a number')
      end
    end
  end

  context 'comparison' do
    context 'when the other object is not a distance' do
      describe '#>' do
        it 'returns false' do
          expect(Distance.new(1) > 1).to eq(false)
        end
      end

      describe '#>=' do
        it 'returns false' do
          expect(Distance.new(1) >= 1).to eq(false)
        end
      end

      describe '#==' do
        it 'returns false' do
          expect(Distance.new(1) == 1).to eq(false)
        end
      end

      describe '#<=' do
        it 'returns false' do
          expect(Distance.new(1) <= 1).to eq(false)
        end
      end

      describe '#<' do
        it 'returns false' do
          expect(Distance.new(1) < 1).to eq(false)
        end
      end
    end

    context 'when the other object is a shorter distance' do
      describe '#>' do
        it 'returns true' do
          expect(Distance.new(1) > Distance.new(0.99)).to eq(true)
        end
      end

      describe '#>=' do
        it 'returns true' do
          expect(Distance.new(1) >= Distance.new(0.99)).to eq(true)
        end
      end

      describe '#==' do
        it 'returns false' do
          expect(Distance.new(1) == Distance.new(0.99)).to eq(false)
        end
      end

      describe '#<=' do
        it 'returns false' do
          expect(Distance.new(1) <= Distance.new(0.99)).to eq(false)
        end
      end

      describe '#<' do
        it 'returns false' do
          expect(Distance.new(1) < Distance.new(0.99)).to eq(false)
        end
      end
    end

    context 'when the other object is the same distance' do
      describe '#>' do
        it 'returns false' do
          expect(Distance.new(1) > Distance.new(1)).to eq(false)
        end
      end

      describe '#>=' do
        it 'returns true' do
          expect(Distance.new(1) >= Distance.new(1)).to eq(true)
        end
      end

      describe '#==' do
        it 'returns true' do
          expect(Distance.new(1) == Distance.new(1)).to eq(true)
        end
      end

      describe '#<=' do
        it 'returns true' do
          expect(Distance.new(1) <= Distance.new(1)).to eq(true)
        end
      end

      describe '#<' do
        it 'returns false' do
          expect(Distance.new(1) < Distance.new(1)).to eq(false)
        end
      end
    end

    context 'when the other object is a longer distance' do
      describe '#>' do
        it 'returns false' do
          expect(Distance.new(1) > Distance.new(1.01)).to eq(false)
        end
      end

      describe '#>=' do
        it 'returns false' do
          expect(Distance.new(1) >= Distance.new(1.01)).to eq(false)
        end
      end

      describe '#==' do
        it 'returns false' do
          expect(Distance.new(1) == Distance.new(1.01)).to eq(false)
        end
      end

      describe '#<=' do
        it 'returns true' do
          expect(Distance.new(1) <= Distance.new(1.01)).to eq(true)
        end
      end

      describe '#<' do
        it 'returns true' do
          expect(Distance.new(1) < Distance.new(1.01)).to eq(true)
        end
      end
    end
  end
end
