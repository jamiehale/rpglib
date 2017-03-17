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
