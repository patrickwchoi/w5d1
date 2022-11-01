require_relative 'p02_hashing'
class HashSet
  attr_reader :count

  def initialize(num_buckets = 8)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(key)
    num = key.hash
    idx = num % @store.length
    if !@store.flatten.include?(num)
      resize! if @store[idx].length>0
      idx = num % @store.length
      @store[idx] << num 
      @count += 1
    end
  end

  def include?(key)
    num = key.hash
    idx = num % @store.length
    @store[idx].include?(num)
  end

  def remove(key)
    num = key.hash
    idx = num % @store.length
    if @store.flatten.include?(num)
      @count -= 1
      @store[idx].pop(num)
    end
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
