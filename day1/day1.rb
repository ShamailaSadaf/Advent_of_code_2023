require 'csv'

  NUM_DICT = {
  "one" => "1",
  "two" => "2",
  "three" => "3",
  "four" => "4",
  "five" => "5",
  "six" => "6",
  "seven" => "7",
  "eight" => "8",
  "nine" => "9",
  "1" => "1",
  "2" => "2",
  "3" => "3",
  "4" => "4",
  "5" => "5",
  "6" => "6",
  "7" => "7",
  "8" => "8",
  "9" => "9"
}

def data
  CSV.read("data.csv").flatten
end

def part_1
  calibrate(/\d/)
end

def part_2
  calibrate(/(?=(\d|one|two|three|four|five|six|seven|eight|nine))/)
end

def calibrate(regex)
  data.each.map do |line|
    digits = line.scan(regex)
    (NUM_DICT[digits.first[0]] + NUM_DICT[digits.last[0]]).to_i
  end.sum
end



puts "Part 1 Result: #{part_1}"
puts "Part 2 Result: #{part_2}"
