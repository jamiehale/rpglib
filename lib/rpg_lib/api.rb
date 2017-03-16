module RpgLib
  module Api
    def roll(dice)
      DiceRoller.instance.roll(dice)
    end

    def roll_and_ignore(dice, *args)
      DiceRoller.instance.roll_and_ignore(dice, *args)
    end
  end
end
