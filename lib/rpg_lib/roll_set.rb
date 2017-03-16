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

require 'set'

module RpgLib
  ##
  # RollSet
  #
  class RollSet
    attr_reader :rolls

    def initialize(*args)
      @rolls = Set.new
      args.each { |a| add(a) }
    end

    def empty?
      @rolls.empty?
    end

    def include?(roll)
      @rolls.include?(roll)
    end

    def add(r)
      if r.is_a?(Integer)
        @rolls.add(r)
      elsif r.is_a?(Range)
        r.to_a.map { |e| @rolls.add(e) }
      elsif r.is_a?(RollSet)
        @rolls.merge(r.rolls)
      else
        raise Exception, "Invalid type (#{r.class}) added to roll set"
      end
    end

    def to_s
      @rolls.to_a.join(', ')
    end
  end
end
