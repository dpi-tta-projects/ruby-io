# safe_read.rb
#
# Goal:
#   Read and print the first line of a file (ARGV[0]).
#   If the file doesn't exist, print to STDERR:
#     "Error: file not found: <path>"
#   and exit non-zero.
#
# Hints:
#   - rescue Errno::ENOENT
#   - print to $stderr
#   - exit(1) for error
#
# TODO:
#   Try to open and read the first line
#   Rescue Errno::ENOENT and handle gracefully
#


path = ARGV[0]
