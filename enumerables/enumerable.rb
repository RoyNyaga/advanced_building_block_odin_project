module Enumerable
  #my_each method
  def my_each
    for i in 0...self.length
      yield(self[i])
    end
  end

# my_each_with_index method
  def my_each_with_index
    for i in 0...self.length
      yield(self[i], i)
    end
  end

# my_select method
  def my_select
    result = []
    self.my_each do |e|
      result << e if yield(e)
    end
    result
  end

# my_all method
  def my_all?
    result = true

    self.my_each do |e|
      unless yield(e)
        result = false
        break
      end
    end
    result
  end

# my_any? method
  def my_any?
    result = false
    self.my_each do |e|
      if yield(e)
        result = true
        break
      end
    end
    result
  end

# my_none? method
  def my_none?
    result = true

    self.my_each do |e|
      if yield(e)
        result = false
        break
      end
    end
    result
  end

# my_count method
  def my_count(obj=nil)
    count = 0
    if block_given?
      self.my_each do |e|
        count += 1 if yield(e)
      end
    else
      if obj
        self.my_each do |e|
          count += 1 if e == obj
        end
      else
        count = self.length
      end
    end
    count
  end
# my_map method
  def my_map(proc=nil)
    result = []

    if proc
      self.my_each do |e|
        result << proc.call(e)
      end
    elsif proc.nil? && block_given?
      self.my_each do |e|
        result << yield(e)
      end
    end
    result
  end

# my_inject method
  def my_inject(obj=nil)
    accumulator = obj ? obj : 0

    self.my_each do |e|
      accumulator = yield(accumulator, e)
    end
    accumulator
  end
end


# Example
def multiply_els(array)
  array.my_inject(1) { |acc, e| acc + e }
end
puts multiply_els([2,3,4])
