class MaxIntSet

  attr_reader :store
  def initialize(max)
    @store = Array.new(max, false)
  end

  def insert(num)
    if @store.length < num || num < 0
      raise 'Out of bounds'
    else 
      @store[num] = true
    end
  end

  def remove(num)
    @store[num] = false
  end

  def include?(num)
    @store[num]
  end

  private

  def is_valid?(num)
  end

  def validate!(num)
  end
end


class IntSet
  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
  end

  def insert(num)
    idx = num % 20
    @store[idx] << num
  end

  def remove(num)
    idx = num % 20
    @store[idx].pop(num)
  end

  def include?(num)
    idx = num % 20
    @store[idx].include?(num)
    
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
  end

  def num_buckets
    @store.length
  end
end

class ResizingIntSet
  attr_reader :count

  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(num)
    idx = num % @store.length
    if !@store.flatten.include?(num)
      resize! if @store[idx].length>0
      idx = num % @store.length
      @store[idx] << num 
      @count += 1
    end
  end

  def remove(num)
    idx = num % @store.length
    if @store.flatten.include?(num)
      @count -= 1
      @store[idx].pop(num)
    end

  end

  def include?(num)
    idx = num % @store.length
    @store[idx].include?(num)

  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
  end

  def num_buckets
    @store.length
  end

  def resize!
    @count = 0
    duplicated_store = @store.dup
    @store = Array.new(num_buckets * 2) { Array.new }
    duplicated_store.flatten.each {|ele| insert(ele)}
  end
end
