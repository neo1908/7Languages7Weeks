# frozen_string_literal: true

# We can pass code as a first class citizen...

def call_block(&block)
  puts "I'm going to call #{block}"
  block.call
end

# Not strictly required I guess....
def pass_block(&block)
  call_block(&block)
end

pass_block { puts 'Hello, Block!' }
