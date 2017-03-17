module RpgLib
  ##
  # DieRoller
  #
  class DieRoller
    def initialize
      @generator = Random.new
    end

    def roll(n)
      @generator.rand(1..n)
    end
  end
end
