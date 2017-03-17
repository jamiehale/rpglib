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
