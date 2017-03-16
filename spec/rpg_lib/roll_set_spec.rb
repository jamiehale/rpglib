# Copyright 2017 Jamie Hale
#
# This file is part of the RpgLib gem.
#
# RpgLib is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# RpgLib is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with RpgLib.  If not, see <http://www.gnu.org/licenses/>.

require 'spec_helper'

module RpgLib
  describe RollSet do
    it 'can be created' do
      expect { RollSet.new }.not_to raise_error
    end

    describe 'when empty' do
      let(:roll_set) { RollSet.new }

      it 'has no rolls' do
        expect(roll_set.rolls).to be_empty
      end

      it 'is empty' do
        expect(roll_set).to be_empty
      end

      it 'has an empty string rep' do
        expect(roll_set.to_s).to be_empty
      end

      describe 'adding integer' do
        before(:each) do
          roll_set.add(4)
        end

        it 'is no longer empty' do
          expect(roll_set).not_to be_empty
        end

        it 'has the roll' do
          expect(roll_set).to include(4)
        end

        it 'has a simple string rep' do
          expect(roll_set.to_s).to eq('4')
        end
      end

      describe 'adding range' do
        before(:each) do
          roll_set.add(2..5)
        end

        it 'is no longer empty' do
          expect(roll_set).not_to be_empty
        end

        it 'includes all rolls' do
          expect(roll_set).to include(2, 3, 4, 5)
        end

        it 'has a string rep' do
          expect(roll_set.to_s).to eq('2, 3, 4, 5')
        end
      end

      describe 'adding roll set' do
        before(:each) do
          roll_set.add(RollSet.new(3, 5, 7))
        end

        it 'is no longer empty' do
          expect(roll_set).not_to be_empty
        end

        it 'includes all rolls' do
          expect(roll_set).to include(3, 5, 7)
        end

        it 'has a string rep' do
          expect(roll_set.to_s).to eq('3, 5, 7')
        end
      end

      describe 'adding multiple types' do
        before(:each) do
          roll_set.add(1)
          roll_set.add(2..5)
          roll_set.add(RollSet.new(6..7))
        end

        it 'includes all rolls' do
          expect(roll_set).to include(1, 2, 3, 4, 5, 6, 7)
        end
      end

      describe 'adding invalid type' do
        it 'throws when adding anything other than integer, range, or roll set' do
          expect { roll_set.add('fail') }.to raise_error(Exception)
        end
      end
    end
  end
end
