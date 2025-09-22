# csv_etl.rb
#
# Goal:
#   Read input CSV (ARGV[0]), transform fields, write to output CSV (ARGV[1]).
#   - name: uppercase
#   - age: to_i + 1
#
# Usage:
#   ruby csv_etl.rb input.csv output.csv
#
# TODO:
#   Use CSV.foreach(input, headers: true) to iterate rows
#   Build transformed rows
#   Use CSV.open(output, "w") with headers to write results
#

require "csv"

input  = ARGV[0]
output = ARGV[1]
