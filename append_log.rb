# append_log.rb
#
# Goal:
#   Append a timestamped line to a log file.
#   Usage: ruby append_log.rb <log_filename> <message>
#
# Expected:
#   Each run adds a new line: "YYYY-MM-DDTHH:MM:SSZ - <message>"
#
# TODO:
#   Use Time.now.utc.iso8601 (require "time") for ISO-8601
#   Open file in append mode ("a") WITH a block
#   Write "<timestamp> - <message>"
#


log_filename = ARGV[0]
message      = ARGV[1]
