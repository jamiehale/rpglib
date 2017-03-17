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

module RpgLib
  ##
  # Api
  #
  module Api
    def roll(dice)
      DiceRoller.instance.roll(dice)
    end

    def roll_and_ignore(dice, *args)
      DiceRoller.instance.roll_and_ignore(dice, *args)
    end

    def choose(options)
      options[DiceRoller.instance.roll_die(options.size) - 1]
    end
  end
end
