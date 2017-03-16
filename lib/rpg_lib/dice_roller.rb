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

    DICE_REGEXP = /(\d*)d(\d+)((dl)(\d*)|(dh)(\d*))?/

    def random_value_in_range(range)
      rand(range)
    end

    def roll_dice(roll_descriptor)
      rolled_values = roll_all_dice_from_descriptor(roll_descriptor)
      drop_lowest(rolled_values, roll_descriptor)
      drop_highest(rolled_values, roll_descriptor)
      total(rolled_values)
    end

    def roll(dice)
      local_dice = dice.dup
      loop do
        m = local_dice.downcase.match(DICE_REGEXP)
        break if m.nil?
        rolled_value = roll_dice(RollDescriptor.new(m))
        local_dice[m.begin(0)...m.end(0)] = rolled_value.to_s
      end
      eval(local_dice)
    end

    def roll_and_ignore(dice, ignored_values)
      rolled_value = nil
      loop do
        rolled_value = roll(dice)
        break unless ignored_values.include?(rolled_value)
      end
      rolled_value
    end

    private

    def roll_all_dice_from_descriptor(roll_descriptor)
      rolled_values = []
      1.upto roll_descriptor.count do
        rolled_values << random_value_in_range(1..roll_descriptor.die)
      end
      rolled_values.sort
    end

    def drop_lowest(rolled_values, roll_descriptor)
      rolled_values.slice!(0, roll_descriptor.drop_lowest)
    end

    def drop_highest(rolled_values, roll_descriptor)
      rolled_values.slice!(rolled_values.size - roll_descriptor.drop_highest, roll_descriptor.drop_highest)
    end

    def total(rolled_values)
      rolled_values.inject(:+)
    end
  end
end