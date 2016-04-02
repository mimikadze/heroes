system('clear')

dragon = {
  hp: 2000,
  defense: 120,
  str: 150,
  weapon: 0
}
hero = {
  hp: 2000,
  defense: 120,
  str: 150,
  weapon: 250,
  shield: 150
}


loop do
  puts "It's your turn to go"
  if rand(1..4) < 4
    damage = hero[:str] + hero[:weapon] - dragon[:defense]
    dragon[:hp] -= damage
    puts "You hit the Dragon with #{damage} hp"
    puts "Now dragon have #{dragon[:hp]} HP"
    puts "--------------------------------------"
  else
    puts "You missed!"
    puts "--------------------------------------"
  end
  break if dragon[:hp] <= 0 
end