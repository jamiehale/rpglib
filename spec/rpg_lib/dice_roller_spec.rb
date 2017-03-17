require 'spec_helper'

module RpgLib
  describe DiceRoller do
    let(:roller) { DiceRoller.clone.instance }
    let(:die_roller) { roller.roller }

    it 'can be accessed' do
      expect { DiceRoller.instance }.not_to raise_error
    end

    describe 'roll_die' do
      before(:each) do
        allow(die_roller).to receive(:roll) { 3 }
        @value = roller.roll_die(6)
      end

      it 'defers to the roller' do
        expect(die_roller).to have_received(:roll).with(6)
      end

      it 'relays the result' do
        expect(@value).to eq(3)
      end
    end

    describe 'roll' do
      let(:parser) { roller.parser }
      let(:tree) { double('tree') }

      before(:each) do
        allow(parser).to receive(:parse) { tree }
        allow(tree).to receive(:eval) { 9 }
        @value = roller.roll('3d6')
      end

      it 'defers to the parser' do
        expect(parser).to have_received(:parse).with('3d6')
      end

      it 'evals the result from the parser' do
        expect(tree).to have_received(:eval).with(die_roller)
      end

      it 'relays the result of eval' do
        expect(@value).to eq(9)
      end
    end

    describe 'roll_and_ignore' do
      describe 'with no collision' do
        before(:each) do
          allow(roller).to receive(:roll) { 4 }
          @value = roller.roll_and_ignore('d6', RollSet.new(0, 9, 100))
        end

        it 'rolls only once' do
          expect(roller).to have_received(:roll).with('d6').once
        end

        it 'relays the roll' do
          expect(@value).to eq(4)
        end
      end

      describe 'with collisions' do
        before(:each) do
          allow(roller).to receive(:roll).and_return(1, 2, 3, 4)
          @value = roller.roll_and_ignore('d6', RollSet.new(1..3))
        end

        it 'rolls multiple times until it finds a value that is not ignored' do
          expect(roller).to have_received(:roll).exactly(4).times
        end

        it 'relays the roll' do
          expect(@value).to eq(4)
        end
      end
    end
  end
end
