require 'spec_helper'

module RpgLib
  describe Api do
    let(:api) { Class.new { include Api }.new }

    describe 'roll' do
      it 'returns Integer' do
        expect(api.roll('3d6')).to be_instance_of(Integer)
      end

      it 'responds in the specified range' do
        20.times do
          roll = api.roll('3d6')
          expect(roll < 3).to be false
          expect(roll > 18).to be false
        end
      end
    end

    describe 'roll_and_ignore' do
      it 'returns Integer' do
        expect(api.roll_and_ignore('3d6', 5)).to be_instance_of(Integer)
      end

      it 'response in the specified range' do
        20.times do
          roll = api.roll_and_ignore('3d6', 5)
          expect(roll < 3).to be false
          expect(roll > 18).to be false
        end
      end

      it 'ignores a passed number' do
        20.times do
          roll = api.roll_and_ignore('3d6', 5)
          expect(roll).not_to eq(5)
        end
      end

      it 'ignores a passed range' do
        20.times do
          roll = api.roll_and_ignore('3d6', 6..10)
          expect(6..10).not_to include(roll)
        end
      end

      it 'ignores a passed roll set' do
        evens = RollSet.new(4, 6, 8, 10, 12, 14, 16, 18)
        20.times do
          roll = api.roll_and_ignore('3d6', evens)
          expect(roll).to be_odd
        end
      end
    end

    describe 'choose' do
      let(:values) { [:foo, :bar, :baz, :stoo] }

      it 'selects a single item from the list' do
        10.times do
          expect(values).to include(api.choose(values))
        end
      end
    end
  end
end
