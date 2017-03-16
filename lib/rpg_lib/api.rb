module RpgLib
  module Api
    def roll(dice)
      DiceRoller.instance.roll(dice)
    end

    def roll_and_ignore(dice, *args)
      DiceRoller.instance.roll_and_ignore(dice, *args)
    end

    def choose(options)
      options[DiceRoller.instance.random_value_in_range(1..options.size) - 1]
    end
  end
end
