# line_numbers.rb
#
# Goal:
#   Read a file (path in ARGV[0]) and print each line with a 1-based line number.
#
# Expected Output:
#   1: <first line contents>
#   2: <second line contents>
#   ...
#
# TODO:
#   Open the file safely using a block (File.open with "r")
#   Iterate line-by-line (each_line)
#   Print "N: <line>" (remember to remove any trailing newline if you want a clean format)
#

filename = ARGV[0]
