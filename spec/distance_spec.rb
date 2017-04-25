RSpec.describe Distance do
  describe '.new' do
    it 'is not public' do
      expect do
        Distance.new(1)
      end.to raise_error(NoMethodError, "private method `new' called for Distance:Class")
    end
  end

  describe '.meters' do
    it 'returns a Distance instance with the value supplied' do
      subject = Distance.meters(4)
      expect(subject).to be_a(Distance)
      expect(subject.to_f).to be_within(FLOATING_POINT_TOLERANCE).of(4)
    end
  end

  describe '.kilometers' do
    it 'returns a Distance instance with 1000 times the value supplied' do
      subject = Distance.kilometers(4)
      expect(subject).to be_a(Distance)
      expect(subject.to_f).to be_within(FLOATING_POINT_TOLERANCE).of(4000)
    end
  end

  describe '.inches' do
    it 'returns a Distance instance with 0.0254 times the value supplied' do
      subject = Distance.inches(1000)
      expect(subject).to be_a(Distance)
      expect(subject.to_f).to be_within(FLOATING_POINT_TOLERANCE).of(25.4)
    end
  end

  describe '.feet' do
    it 'returns a Distance instance with 0.3048 times the value supplied' do
      subject = Distance.feet(100)
      expect(subject).to be_a(Distance)
      expect(subject.to_f).to be_within(FLOATING_POINT_TOLERANCE).of(30.48)
    end
  end

  describe '.miles' do
    it 'returns a Distance instance with 1609.344 times the value supplied' do
      subject = Distance.miles(5)
      expect(subject).to be_a(Distance)
      expect(subject.to_f).to be_within(FLOATING_POINT_TOLERANCE).of(8046.72)
    end
  end

  describe '::MARATHON' do
    it 'returns a Distance of 42195 meters' do
      subject = Distance::MARATHON
      expect(subject).to be_a(Distance)
      expect(subject.to_f).to be_within(FLOATING_POINT_TOLERANCE).of(42195)
    end
  end

  describe '#to_kilometers' do
    it 'returns the initializer argument / 1000' do
      subject = Distance.meters(1525)
      expect(subject.to_kilometers).to be_within(FLOATING_POINT_TOLERANCE).of(1.525)
    end
  end

  describe '#to_inches' do
    it 'returns the initializer argument / 1609.344' do
      subject = Distance.meters(100)
      expect(subject.to_inches).to be_within(FLOATING_POINT_TOLERANCE).of(3937.0079)
    end
  end

  describe '#to_feet' do
    it 'returns the initializer argument / 1609.344' do
      subject = Distance.meters(100)
      expect(subject.to_feet).to be_within(FLOATING_POINT_TOLERANCE).of(328.084)
    end
  end

  describe '#to_miles' do
    it 'returns the initializer argument / 1609.344' do
      subject = Distance.meters(10000)
      expect(subject.to_miles).to be_within(FLOATING_POINT_TOLERANCE).of(6.2137)
    end
  end

  describe '#+' do
    it 'returns a distance instance that is the sum of the 2 distances' do
      sum = Distance.meters(1.23) + Distance.meters(4.44)
      expect(sum).to be_a(Distance)
      expect(sum.to_f).to be_within(FLOATING_POINT_TOLERANCE).of(5.67)
    end

    context 'when the second object is not a distance' do
      it 'raises an ArgumentError' do
        expect do
          Distance.meters(1) + 1
        end.to raise_error(ArgumentError, 'Can only add a Distance to a Distance')
      end
    end
  end

  describe '#-' do
    it 'returns a distance instance that is the difference of the 2 distances' do
      difference = Distance.meters(5.67) - Distance.meters(4.44)
      expect(difference).to be_a(Distance)
      expect(difference.to_f).to be_within(FLOATING_POINT_TOLERANCE).of(1.23)
    end

    context 'when the second object is not a distance' do
      it 'raises an ArgumentError' do
        expect do
          Distance.meters(1) - 1
        end.to raise_error(ArgumentError, 'Can only subtract a Distance from a Distance')
      end
    end
  end

  describe '#*' do
    context 'when the second object is a Integer' do
      it 'returns a distance instance that is the N times the original distance' do
        product = Distance.meters(2.5) * 4
        expect(product).to be_a(Distance)
        expect(product.to_f).to be_within(FLOATING_POINT_TOLERANCE).of(10)
      end
    end

    context 'when the second object is a Float' do
      it 'returns a distance instance that is the N times the original distance' do
        product = Distance.meters(4) * 2.5
        expect(product).to be_a(Distance)
        expect(product.to_f).to be_within(FLOATING_POINT_TOLERANCE).of(10)
      end
    end

    context 'when the second object is a distance' do
      it 'raises an ArgumentError' do
        expect do
          Distance.meters(1) * Distance.meters(1)
        end.to raise_error(ArgumentError, 'Can only multiply a Distance with a number')
      end
    end
  end

  describe '#/' do
    context 'when the second object is a Integer' do
      it 'returns a distance instance that is 1/N the original distance' do
        product = Distance.meters(10) / 4
        expect(product).to be_a(Distance)
        expect(product.to_f).to be_within(FLOATING_POINT_TOLERANCE).of(2.5)
      end
    end

    context 'when the second object is a Float' do
      it 'returns a distance instance that is 1/N the original distance' do
        product = Distance.meters(10) / 2.5
        expect(product).to be_a(Distance)
        expect(product.to_f).to be_within(FLOATING_POINT_TOLERANCE).of(4)
      end
    end

    context 'when the second object is a distance' do
      it 'raises an ArgumentError' do
        expect do
          Distance.meters(1) / Distance.meters(1)
        end.to raise_error(ArgumentError, 'Can only divide a Distance by a number')
      end
    end
  end

  context 'comparison' do
    context 'when the other object is not a distance' do
      describe '#>' do
        it 'returns false' do
          expect(Distance.meters(1) > 1).to eq(false)
        end
      end

      describe '#>=' do
        it 'returns false' do
          expect(Distance.meters(1) >= 1).to eq(false)
        end
      end

      describe '#==' do
        it 'returns false' do
          expect(Distance.meters(1) == 1).to eq(false)
        end
      end

      describe '#<=' do
        it 'returns false' do
          expect(Distance.meters(1) <= 1).to eq(false)
        end
      end

      describe '#<' do
        it 'returns false' do
          expect(Distance.meters(1) < 1).to eq(false)
        end
      end
    end

    context 'when the other object is a shorter distance' do
      describe '#>' do
        it 'returns true' do
          expect(Distance.meters(1) > Distance.meters(0.99)).to eq(true)
        end
      end

      describe '#>=' do
        it 'returns true' do
          expect(Distance.meters(1) >= Distance.meters(0.99)).to eq(true)
        end
      end

      describe '#==' do
        it 'returns false' do
          expect(Distance.meters(1) == Distance.meters(0.99)).to eq(false)
        end
      end

      describe '#<=' do
        it 'returns false' do
          expect(Distance.meters(1) <= Distance.meters(0.99)).to eq(false)
        end
      end

      describe '#<' do
        it 'returns false' do
          expect(Distance.meters(1) < Distance.meters(0.99)).to eq(false)
        end
      end
    end

    context 'when the other object is the same distance' do
      describe '#>' do
        it 'returns false' do
          expect(Distance.meters(1) > Distance.meters(1)).to eq(false)
        end
      end

      describe '#>=' do
        it 'returns true' do
          expect(Distance.meters(1) >= Distance.meters(1)).to eq(true)
        end
      end

      describe '#==' do
        it 'returns true' do
          expect(Distance.meters(1) == Distance.meters(1)).to eq(true)
        end
      end

      describe '#<=' do
        it 'returns true' do
          expect(Distance.meters(1) <= Distance.meters(1)).to eq(true)
        end
      end

      describe '#<' do
        it 'returns false' do
          expect(Distance.meters(1) < Distance.meters(1)).to eq(false)
        end
      end
    end

    context 'when the other object is a longer distance' do
      describe '#>' do
        it 'returns false' do
          expect(Distance.meters(1) > Distance.meters(1.01)).to eq(false)
        end
      end

      describe '#>=' do
        it 'returns false' do
          expect(Distance.meters(1) >= Distance.meters(1.01)).to eq(false)
        end
      end

      describe '#==' do
        it 'returns false' do
          expect(Distance.meters(1) == Distance.meters(1.01)).to eq(false)
        end
      end

      describe '#<=' do
        it 'returns true' do
          expect(Distance.meters(1) <= Distance.meters(1.01)).to eq(true)
        end
      end

      describe '#<' do
        it 'returns true' do
          expect(Distance.meters(1) < Distance.meters(1.01)).to eq(true)
        end
      end
    end
  end
end
