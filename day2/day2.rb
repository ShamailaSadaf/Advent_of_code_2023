sum = 0
red_cubes = 12
green_cubes = 13
blue_cubes = 14

File.open("data2.txt", "r") do |input|
  input.each_line do |line|
    game = line.strip.split(':')
    moves = game[1].split(';')
    gameID = game[0].strip.split(' ')[1].to_i
    real_red = 0
    real_green = 0
    real_blue = 0

    moves.each do |move|
      pieces = move.strip.split(',')
      pieces.each do |piece|
        count, color = piece.strip.split(' ')
        count = count.to_i

        if color == 'red' && count > real_red
          real_red = count
          puts "Rot is da #{real_red}"
        end

        if color == 'blue' && count > real_blue
          real_blue = count
          puts "Blau is da #{real_blue}"
        end

        if color == 'green' && count > real_green
          real_green = count
          puts "Grün is da #{real_green}"
        end
      end
    end

    if real_red <= red_cubes && real_blue <= blue_cubes && real_green <= green_cubes
      puts "klappt doch"
      sum += gameID
      puts "Erfolgreiche gameID: #{gameID}"
      puts "Aktuelle Summe: #{sum}"
    else
      puts "kann nicht sein"
    end
  end
end

puts "Ergebnis: #{sum}"
