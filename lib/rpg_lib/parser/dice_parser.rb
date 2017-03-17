
module RpgLib
  module Parser
    class DiceParser
      def initialize
        @parser = DiceExpressionParser.new
      end

      def parse(data)
        tree = @parser.parse(data)

        raise Exception, "Parse error #{@parser.failure_reason} at offset: #{@parser.index}" if tree.nil?

        tree
      end
    end
  end
end
