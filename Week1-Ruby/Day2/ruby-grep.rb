# frozen_string_literal: true

def grep
  if ARGV.length != 2
    puts "Usage -> ruby ruby-grep 'pattern' 'filename'"
    exit
  end

  pattern = ARGV[0]
  filename = ARGV[1]

  IO.foreach(filename) { |line| puts line.to_s if line.match(pattern) }
end

grep
