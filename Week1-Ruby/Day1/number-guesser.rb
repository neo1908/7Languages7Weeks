def random_int
  # Print does not add a \n but it's a good idea to flush
  print 'Please choose range to guess in!'
  $stdout.flush
  range = gets

  rand(Integer(range))
end

def run_game
  random = random_int
  attempts = 0
  while attempts < 3 do
    attempts = attempts+1
    print 'What is your guess? '
    $stdout.flush
    guess = Integer(gets)
    if guess == random
      puts 'You guessed it!'
      break
    elsif guess < random
      puts "You were too low! #{3 - attempts} remaining" if attempts.positive?
    elsif guess > random
      puts "You were too high! #{3 - attempts} remaining" if attempts.positive?
    end
  end
  puts 'Thanks for playing!'
end

run_game