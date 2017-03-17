require 'spec_helper'

module RpgLib
  module Parser
    module DiceExpression
      describe BinaryOperation do
        it 'is touched when we parse a dice descriptor with an operator' do
          expect(RpgLib::Parser::DiceParser.new.parse('3+4').eval(nil)).to eq(7)
        end
      end
    end
  end
end
