power_sum = 0
sum_part1 = 0

File.open('data2.txt', 'r') do |file|
  file.each_line do |line|
    game = line.strip.split(':')
    game_id = game[0].strip.split(' ')[1].to_i
    moves = game[1].split(';')

    min_red = min_green = min_blue = 0

    moves.each do |move|
      pieces = move.strip.split(',')
      pieces.each do |piece|
        count, color = piece.strip.split(' ')
        count = count.to_i

        case color
        when 'red'
          min_red = count if count > min_red
        when 'blue'
          min_blue = count if count > min_blue
        when 'green'
          min_green = count if count > min_green
        end
      end
    end

    if min_green <= 13 && min_blue <= 14 && min_red <= 12
      sum_part1 += game_id
    end

    power = min_red * min_green * min_blue
    power_sum += power
  end
end

puts "Part 1 = #{sum_part1}"
puts "Part 2 = #{power_sum}"
