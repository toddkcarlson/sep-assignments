# DEF INSERT(key, value)
#     COMPUTE the hash code for key, ASSIGN to index
#     GET array[index], ASSIGN to oldHead
#     SET array[index] to a link that contains key and value
#     IF oldHead exists THEN
#         SET oldHead as the second link in the chain
#     END IF
# END DEF
# DEF LOOKUP(key)
#     COMPUTE the hash code for key, ASSIGN to index
#     GET array[index], ASSIGN to head
#     IF head exists THEN
#         WHILE the next link in the chain exists
#             IF the key at the current link equals key THEN
#                 RETURN this link's value
#             END IF
#             SET the current link to the next link in the chain
#         END WHILE
#     END IF
#     RETURN nothing
# END DEF

require_relative 'node'
require_relative 'linked_list'

class SeparateChaining
  attr_reader :max_load_factor

  def initialize(size)
    @size = size
    @max_load_factor = 0.7
    @values = 0.0
    @items = Array.new(@size)
  end

  def []=(key, value)
    h_key = index(key, @size)
    current_load_factor = load_factor()

    if current_load_factor >= @max_load_factor
      #puts "resizing!"
      resize()      
      h_key = index(key, @size)
      self.[]=(key, value)      
    elsif @items[h_key].nil?
      #puts "new item"     
      @items[h_key] = Node.new(key, value)
      @values += 1
    elsif @items[h_key].key == key
       #puts "replacing item"
       @items[h_key].value = value
    else
      @items[h_key] = Node.add_to_tail(value)
      @values += 1
    end  
  end

  def [](key)
    h_key = index(key, @size) 
    @items[h_key].value  
  end

  # Returns a unique, deterministically reproducible index into an array
  # We are hashing based on strings, let's use the ascii value of each string as
  # a starting point.
  def index(key, size)
    key.sum % size
  end

  # Calculate the current load factor
  def load_factor
    puts "load_factor: #{@values} / #{@size}"
    @values / @size    
  end

  # Simple method to return the number of items in the hash
  def size
    @size
  end

  # Resize the hash
  def resize
    #puts "resizing" 
    @size = @size * 2
    #puts "@size: #{@size}"    
    current = @items
    new_array = Array.new(@size)
    current.each { |hash_item|
      unless hash_item.nil?
       h_key = index(hash_item.key, @size)
       new_array[h_key] = hash_item
      end
    }
    @items = new_array
  end
end