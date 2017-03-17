require 'spec_helper'

module RpgLib
  describe DieRoller do
    it 'can be created' do
      expect { DieRoller.new }.not_to raise_error
    end

    describe 'roll' do
      let(:generator) { double('generator') }
      let(:value) { 99 }
      let(:roller) { DieRoller.new(generator) }

      before(:each) do
        allow(generator).to receive(:rand) { value }
        @result = roller.roll(10)
      end

      it 'defers to the generator' do
        expect(generator).to have_received(:rand).with(1..10)
      end

      it 'relays the generated value' do
        expect(@result).to eq(value)
      end
    end
  end
end
