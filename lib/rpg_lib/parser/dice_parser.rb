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
  module Parser
    ##
    # DiceParser
    #
    class DiceParser
      attr_reader :parser

      def initialize
        @parser = DiceExpressionParser.new
        @cache = {}
      end

      def parse(dice)
        return @cache[dice] if @cache.key?(dice)
        parse_new_dice(dice)
      end

      private

      def parse_new_dice(dice)
        tree = @parser.parse(dice)
        raise Exception, "Parse error #{@parser.failure_reason} at offset: #{@parser.index}" if tree.nil?
        @cache[dice] = tree
        tree
      end
    end
  end
end
