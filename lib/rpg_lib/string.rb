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

##
# String Patch
#
class String
  def roll
    RpgLib::DiceRoller.instance.roll(self)
  end

  def roll_and_ignore(*args)
    RpgLib::DiceRoller.instance.roll_and_ignore(self, RpgLib::RollSet.new(*args))
  end
end
