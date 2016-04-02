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

def player_step(hero, dragon)
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
end

def dragon_step(hero, dragon)
  if rand(1..2) == 1
    damage = dragon[:str] + dragon[:weapon] - hero[:defense]
    hero[:hp] -= damage
    puts "The Dragon hits you with #{damage} hp"
    puts "Now you have #{hero[:hp]} HP"
    puts "--------------------------------------"
  else
    puts "Dragon missed his step!"
    puts "--------------------------------------"
  end
end

def hero_dead?(hero)
  true if hero[:hp] <= 0 
end

def dragon_dead?(dragon)
  true if dragon[:hp] <= 0 
end

loop do
  player_step(hero, dragon) unless hero_dead?(hero)
  dragon_step(hero, dragon) unless dragon_dead?(dragon)

  if hero_dead?(hero) 
    puts "Sorry, you are dead =("
    break
  elsif dragon_dead?(dragon)
    puts "You defeated the dragon, yay!"
    break
  end
    
end