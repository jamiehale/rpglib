module RpgLib
  ##
  # DieRoller
  #
  class DieRoller
    def initialize(generator = nil)
      @generator = generator || Random.new
    end

    def roll(sides)
      @generator.rand(1..sides)
    end
  end
end
