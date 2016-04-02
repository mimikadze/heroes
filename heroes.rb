dragon = {
  name: "Dragon",
  hp: 2000,
  defense: 120,
  str: 150,
  weapon: 0
}
hell_dog = {
  name: "Hell Dog ><",
  hp: 1500,
  defense: 220,
  str: 250,
  weapon: 0
}
hero = {
  name: "Hero",
  hp: 2000,
  defense: 120,
  str: 150,
  weapon: 250,
  shield: 150,
  shield_active: false
}

characters = [dragon,hell_dog,hero]

def player_step(player, computer)
 puts "It's your turn to go"
 puts "Choose what to do:"
 puts "==========================="
 puts "Press 1 for attack"
 puts "Press 2 to miss the step"
 puts "Press 3 for shield" if player[:name] == "Hero"
 puts "==========================="
 user_action = gets.chomp

 case user_action
 when "1"
  if rand(1..4) < 4
    damage = player[:str] + player[:weapon] - computer[:defense]
    computer[:hp] -= damage
    puts "You hit the #{computer[:name]} with #{damage} hp"
    puts "Now #{computer[:name]} have #{computer[:hp]} HP"
    puts "--------------------------------------"
  else
    puts "You missed! =("
    puts "--------------------------------------"
  end  
 when "3" 
    player[:shield_active] = true
    puts "You decided to rise a shield. Defense mode: on"
    puts "--------------------------------------" 
 else 
   puts "You decided to miss the step. Ok."
   puts "--------------------------------------"
 end
end

def player_defense_calculator(player)
  unless player[:name] == "Hero"
    return player[:defense]
  else
    return player[:defense]+player[:shield]
  end
end

def computer_step(player, computer)
  if rand(1..2) == 1
    damage = computer[:str] + computer[:weapon] - player_defense_calculator(player)
    player[:hp] -= damage
    puts "The #{computer[:name]} hits you with #{damage} hp"
    puts "Now you have #{player[:hp]} HP"
    puts "--------------------------------------"
  else
    puts "#{computer[:name]} missed his step!"
    puts "--------------------------------------"
  end
  player[:shield_active] = false
end

def player_dead?(player)
  true if player[:hp] <= 0 
end

def computer_dead?(computer)
  true if computer[:hp] <= 0 
end

system('clear')
puts "== Choose your destiny =="
puts
characters.each_with_index do |character, index|
 puts "== print #{index+1} for =="
 puts "Name: #{character[:name]}"
 puts "Power: #{character[:str]}"
 puts "HP: #{character[:hp]}"
 puts "Defense: #{character[:defense]}"
 print "\n\n"
end

choice = gets.chomp.to_i - 1

player = characters[choice]
characters.delete(player)

computer = characters[rand(characters.length)]

puts "== You have chosen  #{player[:name]}!=="
puts "== The Computer have chosen  #{computer[:name]}!=="
puts " Press Enter to start..."
gets.chomp
system('clear')

round_counter = 0
loop do
  round_counter += 1
  puts "************* Round #{round_counter}. Fight! *************"
  player_step(player, computer) unless player_dead?(player)
  computer_step(player, computer) unless computer_dead?(computer)
  print "\n\n"

  if player_dead?(player)
    puts "Sorry, you are dead =("
    break
  elsif computer_dead?(computer)
    puts "You defeated the #{computer[:name]}, yay!"
    break
  end 
end