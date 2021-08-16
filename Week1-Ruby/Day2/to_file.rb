module ToFile
  def filename
    "object_#{object_id}.txt"
  end

  def to_f
    File.open(filename, 'w') { |f| f.write(to_s) }
  end
end