# dice.rb
#
# Goal:
#   Roll one or more dice with configurable sides and count.
#   Use ARGV to parse inputs.
#
# Usage:
#   ruby dice.rb <sides> [count]
#
# TODO:
#   If using ARGV:
#     - ARGV[0] → number of sides (default: 6)
#     - ARGV[1] → number of dice to roll (default: 1)
#   Generate rolls with rand(1..sides) for each die
#   Print results joined by commas
#
# Expected Output:
#   ruby dice.rb 6 2
#   6,1
#
