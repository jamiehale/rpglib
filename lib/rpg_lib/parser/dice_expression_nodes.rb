module RpgLib
  module Parser
    module DiceExpression
      class BinaryOperation < Treetop::Runtime::SyntaxNode
        def eval(roller)
          tail.elements.inject(head.eval(roller)) do |value, element|
            element.operator.apply(value, element.operand.eval(roller))
          end
        end
      end
    end
  end
end
