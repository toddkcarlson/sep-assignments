class Node
  attr_accessor :next
  attr_accessor :key
  attr_accessor :value

  def initialize(key, value)
   @next = nil
   @key = key
   @value = value	
  end
end