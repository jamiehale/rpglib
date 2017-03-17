# Copyright 2017 Jamie Hale
# Autogenerated from a Treetop grammar. Edits may be lost.


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
    # :nocov:
    module DiceExpression
      include Treetop::Runtime

      def root
        @root ||= :additive
      end

      module Additive0
        def space1
          elements[0]
        end

        def operator
          elements[1]
        end

        def space2
          elements[2]
        end

        def operand
          elements[3]
        end
      end

      module Additive1
        def head
          elements[0]
        end

        def tail
          elements[1]
        end
      end

      def _nt_additive
        start_index = index
        if node_cache[:additive].has_key?(index)
          cached = node_cache[:additive][index]
          if cached
            node_cache[:additive][index] = cached = SyntaxNode.new(input, index...(index + 1)) if cached == true
            @index = cached.interval.end
          end
          return cached
        end

        i0, s0 = index, []
        r1 = _nt_multitive
        s0 << r1
        if r1
          s2, i2 = [], index
          loop do
            i3, s3 = index, []
            r4 = _nt_space
            s3 << r4
            if r4
              r5 = _nt_additive_op
              s3 << r5
              if r5
                r6 = _nt_space
                s3 << r6
                if r6
                  r7 = _nt_multitive
                  s3 << r7
                end
              end
            end
            if s3.last
              r3 = instantiate_node(SyntaxNode,input, i3...index, s3)
              r3.extend(Additive0)
            else
              @index = i3
              r3 = nil
            end
            if r3
              s2 << r3
            else
              break
            end
          end
          r2 = instantiate_node(SyntaxNode,input, i2...index, s2)
          s0 << r2
        end
        if s0.last
          r0 = instantiate_node(BinaryOperation,input, i0...index, s0)
          r0.extend(Additive1)
        else
          @index = i0
          r0 = nil
        end

        node_cache[:additive][start_index] = r0

        r0
      end

      module AdditiveOp0
        def apply(a, b)
          a + b
        end
      end

      module AdditiveOp1
        def apply(a, b)
          a - b
        end
      end

      def _nt_additive_op
        start_index = index
        if node_cache[:additive_op].has_key?(index)
          cached = node_cache[:additive_op][index]
          if cached
            node_cache[:additive_op][index] = cached = SyntaxNode.new(input, index...(index + 1)) if cached == true
            @index = cached.interval.end
          end
          return cached
        end

        i0 = index
        if (match_len = has_terminal?('+', false, index))
          r1 = instantiate_node(SyntaxNode,input, index...(index + match_len))
          r1.extend(AdditiveOp0)
          @index += match_len
        else
          terminal_parse_failure('\'+\'')
          r1 = nil
        end
        if r1
          r1 = SyntaxNode.new(input, (index-1)...index) if r1 == true
          r0 = r1
        else
          if (match_len = has_terminal?('-', false, index))
            r2 = instantiate_node(SyntaxNode,input, index...(index + match_len))
            r2.extend(AdditiveOp1)
            @index += match_len
          else
            terminal_parse_failure('\'-\'')
            r2 = nil
          end
          if r2
            r2 = SyntaxNode.new(input, (index-1)...index) if r2 == true
            r0 = r2
          else
            @index = i0
            r0 = nil
          end
        end

        node_cache[:additive_op][start_index] = r0

        r0
      end

      module Multitive0
        def space1
          elements[0]
        end

        def operator
          elements[1]
        end

        def space2
          elements[2]
        end

        def operand
          elements[3]
        end
      end

      module Multitive1
        def head
          elements[0]
        end

        def tail
          elements[1]
        end
      end

      def _nt_multitive
        start_index = index
        if node_cache[:multitive].has_key?(index)
          cached = node_cache[:multitive][index]
          if cached
            node_cache[:multitive][index] = cached = SyntaxNode.new(input, index...(index + 1)) if cached == true
            @index = cached.interval.end
          end
          return cached
        end

        i0, s0 = index, []
        r1 = _nt_primary
        s0 << r1
        if r1
          s2, i2 = [], index
          loop do
            i3, s3 = index, []
            r4 = _nt_space
            s3 << r4
            if r4
              r5 = _nt_multitive_op
              s3 << r5
              if r5
                r6 = _nt_space
                s3 << r6
                if r6
                  r7 = _nt_primary
                  s3 << r7
                end
              end
            end
            if s3.last
              r3 = instantiate_node(SyntaxNode,input, i3...index, s3)
              r3.extend(Multitive0)
            else
              @index = i3
              r3 = nil
            end
            if r3
              s2 << r3
            else
              break
            end
          end
          r2 = instantiate_node(SyntaxNode,input, i2...index, s2)
          s0 << r2
        end
        if s0.last
          r0 = instantiate_node(BinaryOperation,input, i0...index, s0)
          r0.extend(Multitive1)
        else
          @index = i0
          r0 = nil
        end

        node_cache[:multitive][start_index] = r0

        r0
      end

      module MultitiveOp0
        def apply(a, b)
          a * b
        end
      end

      module MultitiveOp1
        def apply(a, b)
          a / b
        end
      end

      def _nt_multitive_op
        start_index = index
        if node_cache[:multitive_op].has_key?(index)
          cached = node_cache[:multitive_op][index]
          if cached
            node_cache[:multitive_op][index] = cached = SyntaxNode.new(input, index...(index + 1)) if cached == true
            @index = cached.interval.end
          end
          return cached
        end

        i0 = index
        if (match_len = has_terminal?('*', false, index))
          r1 = instantiate_node(SyntaxNode,input, index...(index + match_len))
          r1.extend(MultitiveOp0)
          @index += match_len
        else
          terminal_parse_failure('\'*\'')
          r1 = nil
        end
        if r1
          r1 = SyntaxNode.new(input, (index-1)...index) if r1 == true
          r0 = r1
        else
          if (match_len = has_terminal?('/', false, index))
            r2 = instantiate_node(SyntaxNode,input, index...(index + match_len))
            r2.extend(MultitiveOp1)
            @index += match_len
          else
            terminal_parse_failure('\'/\'')
            r2 = nil
          end
          if r2
            r2 = SyntaxNode.new(input, (index-1)...index) if r2 == true
            r0 = r2
          else
            @index = i0
            r0 = nil
          end
        end

        node_cache[:multitive_op][start_index] = r0

        r0
      end

      module Primary0
        def space1
          elements[1]
        end

        def additive
          elements[2]
        end

        def space2
          elements[3]
        end

      end

      module Primary1
        def eval(roller)
          additive.eval(roller)
        end
      end

      def _nt_primary
        start_index = index
        if node_cache[:primary].has_key?(index)
          cached = node_cache[:primary][index]
          if cached
            node_cache[:primary][index] = cached = SyntaxNode.new(input, index...(index + 1)) if cached == true
            @index = cached.interval.end
          end
          return cached
        end

        i0 = index
        r1 = _nt_dice
        if r1
          r1 = SyntaxNode.new(input, (index-1)...index) if r1 == true
          r0 = r1
        else
          r2 = _nt_number
          if r2
            r2 = SyntaxNode.new(input, (index-1)...index) if r2 == true
            r0 = r2
          else
            i3, s3 = index, []
            if (match_len = has_terminal?('(', false, index))
              r4 = true
              @index += match_len
            else
              terminal_parse_failure('\'(\'')
              r4 = nil
            end
            s3 << r4
            if r4
              r5 = _nt_space
              s3 << r5
              if r5
                r6 = _nt_additive
                s3 << r6
                if r6
                  r7 = _nt_space
                  s3 << r7
                  if r7
                    if (match_len = has_terminal?(')', false, index))
                      r8 = true
                      @index += match_len
                    else
                      terminal_parse_failure('\')\'')
                      r8 = nil
                    end
                    s3 << r8
                  end
                end
              end
            end
            if s3.last
              r3 = instantiate_node(SyntaxNode,input, i3...index, s3)
              r3.extend(Primary0)
              r3.extend(Primary1)
            else
              @index = i3
              r3 = nil
            end
            if r3
              r3 = SyntaxNode.new(input, (index-1)...index) if r3 == true
              r0 = r3
            else
              @index = i0
              r0 = nil
            end
          end
        end

        node_cache[:primary][start_index] = r0

        r0
      end

      module Number0
      end

      module Number1
        def eval(_roller)
          text_value.to_i
        end
      end

      def _nt_number
        start_index = index
        if node_cache[:number].has_key?(index)
          cached = node_cache[:number][index]
          if cached
            node_cache[:number][index] = cached = SyntaxNode.new(input, index...(index + 1)) if cached == true
            @index = cached.interval.end
          end
          return cached
        end

        i0 = index
        i1, s1 = index, []
        if (match_len = has_terminal?('-', false, index))
          r3 = true
          @index += match_len
        else
          terminal_parse_failure('\'-\'')
          r3 = nil
        end
        if r3
          r2 = r3
        else
          r2 = instantiate_node(SyntaxNode,input, index...index)
        end
        s1 << r2
        if r2
          if has_terminal?(@regexps[gr = '\A[1-9]'] ||= Regexp.new(gr), :regexp, index)
            r4 = true
            @index += 1
          else
            terminal_parse_failure('[1-9]')
            r4 = nil
          end
          s1 << r4
          if r4
            s5, i5 = [], index
            loop do
              if has_terminal?(@regexps[gr = '\A[0-9]'] ||= Regexp.new(gr), :regexp, index)
                r6 = true
                @index += 1
              else
                terminal_parse_failure('[0-9]')
                r6 = nil
              end
              if r6
                s5 << r6
              else
                break
              end
            end
            r5 = instantiate_node(SyntaxNode,input, i5...index, s5)
            s1 << r5
          end
        end
        if s1.last
          r1 = instantiate_node(SyntaxNode,input, i1...index, s1)
          r1.extend(Number0)
        else
          @index = i1
          r1 = nil
        end
        if r1
          r1 = SyntaxNode.new(input, (index-1)...index) if r1 == true
          r0 = r1
          r0.extend(Number1)
          r0.extend(Number1)
        else
          if (match_len = has_terminal?('0', false, index))
            r7 = true
            @index += match_len
          else
            terminal_parse_failure('\'0\'')
            r7 = nil
          end
          if r7
            r7 = SyntaxNode.new(input, (index-1)...index) if r7 == true
            r0 = r7
            r0.extend(Number1)
            r0.extend(Number1)
          else
            @index = i0
            r0 = nil
          end
        end

        node_cache[:number][start_index] = r0

        r0
      end

      module PositiveInteger0
      end

      module PositiveInteger1
        def eval(_roller)
          text_value.to_i
        end
      end

      def _nt_positive_integer
        start_index = index
        if node_cache[:positive_integer].has_key?(index)
          cached = node_cache[:positive_integer][index]
          if cached
            node_cache[:positive_integer][index] = cached = SyntaxNode.new(input, index...(index + 1)) if cached == true
            @index = cached.interval.end
          end
          return cached
        end

        i0, s0 = index, []
        if has_terminal?(@regexps[gr = '\A[1-9]'] ||= Regexp.new(gr), :regexp, index)
          r1 = true
          @index += 1
        else
          terminal_parse_failure('[1-9]')
          r1 = nil
        end
        s0 << r1
        if r1
          s2, i2 = [], index
          loop do
            if has_terminal?(@regexps[gr = '\A[0-9]'] ||= Regexp.new(gr), :regexp, index)
              r3 = true
              @index += 1
            else
              terminal_parse_failure('[0-9]')
              r3 = nil
            end
            if r3
              s2 << r3
            else
              break
            end
          end
          r2 = instantiate_node(SyntaxNode,input, i2...index, s2)
          s0 << r2
        end
        if s0.last
          r0 = instantiate_node(SyntaxNode,input, i0...index, s0)
          r0.extend(PositiveInteger0)
          r0.extend(PositiveInteger1)
        else
          @index = i0
          r0 = nil
        end

        node_cache[:positive_integer][start_index] = r0

        r0
      end

      module Dice0
        def count
          elements[0]
        end

        def sides
          elements[2]
        end
      end

      module Dice1
        def eval(roller)
          die_count = count.empty? ? 1 : count.eval(nil)
          die_sides = sides.eval(nil)
          rolls = []
          die_count.times do
            rolls << roller.roll(die_sides)
          end
          rolls.inject(&:+)
        end
      end

      def _nt_dice
        start_index = index
        if node_cache[:dice].has_key?(index)
          cached = node_cache[:dice][index]
          if cached
            node_cache[:dice][index] = cached = SyntaxNode.new(input, index...(index + 1)) if cached == true
            @index = cached.interval.end
          end
          return cached
        end

        i0, s0 = index, []
        r2 = _nt_positive_integer
        if r2
          r1 = r2
        else
          r1 = instantiate_node(SyntaxNode,input, index...index)
        end
        s0 << r1
        if r1
          if (match_len = has_terminal?('d', false, index))
            r3 = true
            @index += match_len
          else
            terminal_parse_failure('\'d\'')
            r3 = nil
          end
          s0 << r3
          if r3
            r4 = _nt_positive_integer
            s0 << r4
          end
        end
        if s0.last
          r0 = instantiate_node(SyntaxNode,input, i0...index, s0)
          r0.extend(Dice0)
          r0.extend(Dice1)
        else
          @index = i0
          r0 = nil
        end

        node_cache[:dice][start_index] = r0

        r0
      end

      def _nt_space
        start_index = index
        if node_cache[:space].has_key?(index)
          cached = node_cache[:space][index]
          if cached
            node_cache[:space][index] = cached = SyntaxNode.new(input, index...(index + 1)) if cached == true
            @index = cached.interval.end
          end
          return cached
        end

        s0, i0 = [], index
        loop do
          if (match_len = has_terminal?(' ', false, index))
            r1 = true
            @index += match_len
          else
            terminal_parse_failure('\' \'')
            r1 = nil
          end
          if r1
            s0 << r1
          else
            break
          end
        end
        r0 = instantiate_node(SyntaxNode,input, i0...index, s0)

        node_cache[:space][start_index] = r0

        r0
      end

    end

    class DiceExpressionParser < Treetop::Runtime::CompiledParser
      include DiceExpression
    end

    # :nocov:
  end
end
