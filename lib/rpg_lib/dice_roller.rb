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

require 'singleton'

module RpgLib
  ##
  # DiceRoller
  #
  class DiceRoller
    include Singleton

    attr_reader :parser
    attr_accessor :roller

    def initialize
      @roller = DieRoller.new
      @parser = Parser::DiceParser.new
    end

    def roll_die(n)
      @roller.roll(n)
    end

    def roll(dice)
      @parser.parse(dice).eval(@roller)
    end

    def roll_and_ignore(dice, ignored_values)
      loop do
        rolled_value = roll(dice)
        return rolled_value unless ignored_values.include?(rolled_value)
      end
    end
  end
end
