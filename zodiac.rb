# zodiac.rb
#
# Goal:
#   Read in csv file with names and birthdays. Output a csv with names and chinese zodiac animal.
#
# Usage:
#   ruby zodiac.rb data/famous_birthdays.csv output/famous_zodiacs.csv
#
# Tips:
#   2020 → Rat
#   2021 → Ox
#   2022 → Tiger
#   2023 → Rabbit
#   2024 → Dragon
#   2025 → Snake
#   2026 → Horse
#   2027 → Goat
#   2028 → Monkey
#   2029 → Rooster
#   2030 → Dog
#   2031 → Pig
#
# To calculate the zodiac animal for any year:
# - Take the year, subtract 4, then divide by 12.
# - The remainder tells you the animal index (0 = Rat, 1 = Ox, … 11 = Pig).
#
# Example:
# 1991 → (1991 - 4) ÷ 12 = 165 remainder 3 → Rabbit.
