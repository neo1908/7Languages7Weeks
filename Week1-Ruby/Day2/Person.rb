class Person
  # Inherit ToFile. Because it is defined in another file we have to require it first
  require './to_file'
  include ToFile
  attr_accessor :name

  def initialize(name)
    @name = name
  end

  def to_s
    name
  end
end

Person.new("Tom").to_f
