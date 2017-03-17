# RpgLib

RpgLib is a Ruby gem that performs tasks that tabletop role-playing game nerds need to automate things.

At the moment, the API contains 3 entries: roll\_die, roll, and choose.

## roll\_die

roll\_die(sides) generates a random number between 1 and *sides*.

    # generate a d6 roll
    roll_die(6)
    
    # generate a d100 roll
    roll_die(100)
    
    # generate a d9 roll - doesn't have to be standard polyhedrals
    roll_die(9)

## roll

roll(dice) evaluates the passed *dice* expression. *dice* can be any mathematical expression using whole numbers, operators +, -, \*, and /, and dice expressions of the form [X]dY (where X is the optional number of times to roll, and Y is the side-count of the die).

    roll('d100')
    roll('3d6')
    roll('2d10*100 + 3d6*10')

## choose

choose(options) selects a random entry from the passed array.

    choose(['red', 'green', 'blue', 'white'])
    choose([:standard_treasure, :alternative_treasure])
    choose([:one, 2, 'three'])

# Installation

    $> gem install rpg_lib

# Use

For simple use:

    require 'rpg_lib'
    include RpgLib::Api
    
    puts roll('3d6')

Exclude the *include* statement to use the internal classes directly, or to import into another namespace.

# Development

    $> rake spec
    $> rake rubocop

If you make changes to the Treetop grammar, run:

    $> rake treetop

and check in the new lib/rpg\_list/parser/dice\_expression\_parser.rb.
