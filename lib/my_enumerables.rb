module Enumerable
  # Your code goes here
  def my_each_with_index
    if block_given?
      i = 0
      until i >= self.length do
        yield(self[i],i)
        i += 1
      end
    end
    self
  end

  def my_select
    array = []
    if block_given?
      self.my_each do |value|
        array.push(value) if yield(value)
      end
    end
    array
  end

  def my_all?(object = false)
    self.my_each do |value|
      return false if block_given? && !yield(value)
      return false if !block_given? && !object and !value
      if object.class == Regexp
        return false if not value.match(object)
      else
        return false if object && (not value === object)
      end
    end
    true
  end

  def my_any?(object = false)
    self.my_each do |value|
      return true if block_given? && yield(value)
      return true if !block_given? && !object and value
      if object.class == Regexp
        return true if value.match(object)
      else
        return true if object && (value === object)
      end
    end
    false
  end

  def my_none?(object = false)
    self.my_each do |value|
      return false if block_given? && yield(value)
      return false if !block_given? && !object and value
      if object.class == Regexp
        return false if value.match(object)
      else
        return false if object && (value === object)
      end
    end
    true
  end

  def my_count(object = false)
    count = 0
    self.my_each do |value|
      count += 1 if block_given? && yield(value)
      count += 1 if !block_given? && !object and value
      if object.class == Regexp
        count += 1 if value.match(object)
      else
        count += 1 if object && (value === object)
      end
    end
    count
  end

  def my_map()
    return_array = []
    self.my_each do |value|
      return_array.push(yield(value)) if block_given?
      return_array.push(value) if !block_given?
    end
    return_array
  end

  def my_inject(initial_value = 0)
    return_value = initial_value
    self.my_each do |value|
      return_value = yield(return_value, value)
    end
    return_value
  end

end

# You will first have to define my_each
# on the Array class. Methods defined in
# your enumerable module will have access
# to this method
class Array
  # Define my_each here
  def my_each
    if block_given?
      i = 0
      until i >= self.length do
        yield(self[i])
        i += 1
      end
    end
    self
  end

end
