# streamer.rb
#
# Goal:
#   Read from a file passed via ARGV (or '-' for STDIN) and print contents.
#   Optional flag: --uppercase (transform output to uppercase).
#
# Usage:
#   ruby streamer.rb [--uppercase] <filename_or_dash>
#
# TODO:
#   If filename == "-", read from STDIN; else open filename with File.open("r")
#   Stream line-by-line; print transformed or raw lines
#   Transformation: line.upcase if options[:uppercase]
#

require "optparse"

options = { uppercase: false }
args = OptionParser.new do |opts|
  opts.on("--uppercase") { options[:uppercase] = true }
end.parse(ARGV)

filename = ARGV[0]
