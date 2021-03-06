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
  module Parser
    describe DiceParser do
      it 'can be created' do
        expect { DiceParser.new }.not_to raise_error
      end

      describe 'parse' do
        let(:parser) { DiceParser.new }
        let(:treetop) { parser.parser }
        let(:tree) { double('tree') }

        before(:each) do
          allow(treetop).to receive(:parse) { tree }
        end

        describe 'uncached' do
          before(:each) do
            @value = parser.parse('3d6')
          end

          it 'defers to the treetop parser' do
            expect(treetop).to have_received(:parse).with('3d6')
          end

          it 'relays the parsed tree' do
            expect(@value).to eq(tree)
          end
        end

        describe 'cached' do
          before(:each) do
            parser.parse('3d6')
            parser.parse('3d6')
            @value = parser.parse('3d6')
          end

          it 'uses the cached value' do
            expect(treetop).to have_received(:parse).once
          end

          it 'relays the cached value' do
            expect(@value).to eq(tree)
          end
        end
      end
    end
  end
end
