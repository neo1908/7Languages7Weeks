# frozen_string_literal: true

class Roman
  def self.method_missing(name, *_args)
    roman = name.to_s
    roman.gsub!('IV', 'IIII')
    roman.gsub!('IX', 'VIIII')
    roman.gsub!('XL', 'XXXX')
    roman.gsub!('XC', 'LXXXX')

    (roman.count('I') +
      roman.count('V') * 5 +
      roman.count('X') * 10 +
      roman.count('L') * 50 +
      roman.count('C') * 100
    )
  end

  def self.respond_to_missing?
    true
  end
end

# There is no "XXI" method defined above. However Ruby runtime will call method_missing where we define the generic code
# To handle all cases. USE THIS CAREFULLY
puts Roman.XXI