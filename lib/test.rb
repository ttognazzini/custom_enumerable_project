# frozen_string_literal: true

require_relative '../lib/my_enumerables'
require 'pry-byebug'

#binding.pry

def test_my_each
  puts "\n\n ********** Test my_each *************"
  puts "Ruby Doc example one"
  puts "When a block given, passes each successive array element to the block; returns self:"
  a = [:foo, 'bar', 2]
  a.each {|element|  puts "#{element.class} #{element}" }
  puts "my_each version:"
  a = [:foo, 'bar', 2]
  a.my_each {|element|  puts "#{element.class} #{element}" }

  puts
  puts "Ruby Doc example two"
  puts "Allows the array to be modified during iteration:"
  a = [:foo, 'bar', 2]
  a.each {|element| puts element; a.clear if element.to_s.start_with?('b') }
  puts "my_each version:"
  a = [:foo, 'bar', 2]
  a.my_each {|element| puts element; a.clear if element.to_s.start_with?('b') }

  puts
  puts "Ruby Doc example three"
  puts "When no block given, returns a new Enumerator:"
  a = [:foo, 'bar', 2]
  e = a.each
  a1 = e.each {|element|  puts "#{element.class} #{element}" }
  print a1
  puts "\nmy_each version:"
  a = [:foo, 'bar', 2]
  e = a.my_each
  a1 = e.my_each {|element|  puts "#{element.class} #{element}" }
  print a1
end

def test_my_all
  puts "\n\n ********** Test my_all *************"
  puts "Ruby Doc example one"
  puts "With no block given and no argument, returns true if self contains only truthy elements, false otherwise:"
  puts "[0, 1, :foo].all? # => true =>  #{[0, 1, :foo].my_all?}"
  puts "[0, nil, 2].all? # => false => #{[0, nil, 2].my_all?}"
  puts "[].all? # => true =>  #{[].my_all?}"

  puts "\nRuby Doc example two"
  puts "With a block given and no argument, calls the block with each element in self; returns true if the block returns only truthy values, false otherwise:"
  puts "[0, 1, 2].all? { |element| element < 3 } # => true => #{[0, 1, 2].my_all? { |element| element < 3 }}"
  puts "[0, 1, 2].all? { |element| element < 2 } # => false => #{[0, 1, 2].my_all? { |element| element < 2 }}"

  puts "\nRuby Doc example three"
  puts "If argument obj is given, returns true if obj.=== every element, false otherwise:"
  puts "['food', 'fool', 'foot'].all?(/foo/) # => true => #{['food', 'fool', 'foot'].my_all?(/foo/)}"
  puts "['food', 'drink'].all?(/bar/) # => false => #{['food', 'drink'].my_all?(/bar/)}"
  puts "[].all?(/foo/) # => true => #{[].my_all?(/foo/)}"
  puts "[0, 0, 0].all?(0) # => true => #{[0, 0, 0].my_all?(0)}"
  puts "[0, 1, 2].all?(1) # => false => #{[0, 1, 2].my_all?(1)}"
end

#test_my_each
test_my_all

