# frozen_string_literal: true

# These methods both achieve the same thing. However, by calling with a code block the file will auto-close after the string is written

def manual_file
  f = File.open("#{Time.new.strftime('%Y-%m-%dT%H:%M:%S')}.txt", 'w')
  f.write('Hello')
  f.flush
  f.close
end

def auto_file
  File.open("#{Time.new.strftime('%Y-%m-%dT%H:%M:%S')}.txt", 'w') { |f| f.write('Hello') }
end
