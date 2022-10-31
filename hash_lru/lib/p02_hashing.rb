class Integer
  # Integer#hash already implemented for you
end

class Array
  def hash
    res = 0
    self.each_with_index { |el, i| res += el*20**(i+1)}
    res
  end
end

class String
  def hash
    alpha = ('a'..'z').to_a + ('A'..'Z').to_a

    res = 0
    self.each_char.with_index { |char, i| res+= (alpha.index(char))*20**(i+1)}
    res
  end
end

class Hash
  # This returns 0 because rspec will break if it returns nil
  # Make sure to implement an actual Hash#hash method
  def hash
    0
  end
end
