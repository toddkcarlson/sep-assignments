require_relative 'node'
# DEF INSERT(key, value)
#     COMPUTE the hash code for key, ASSIGN to index
#     WHILE a key and value exist at array[index]
#         INCREMENT index by 1
#         IF we've checked the entire array THEN
#             CALL RESIZE
#             CALL INSERT(key, value)
#             RETURN
#         END IF
#     END WHILE
#     SET array[index] to the new key and value
# END DEF
class OpenAddressing
  def initialize(size)
    @size = size
    @items = Array.new(@size)
    @counter = 0
  end

  # def []=(key, value)
  #   h_key = index(key, @size)
  #   h_key = h_key + @counter

  #   if @items[h_key].nil?
  #     puts "new item" 
  #     @items[h_key] = Node.new(key, value)
  #     @counter = 0
  #   elsif @items[h_key].key == key
  #     puts "replacing item"
  #     @items[h_key].value = value
  #     @counter = 0 
  #   elsif h_key > @items.length
  #     puts "collision! - resizing"
  #     puts h_key
  #     puts @items.length
  #     resize()      
  #     h_key = index(key, @size)
  #     @counter += 1
  #     self.[]=(key, value)
  #   else
  #     puts "collision! - iterate"
  #     #h_key = next_open_index(index)
  #     @counter += 1
  #     self.[]=(key, value)
  #   end
  # end

  def []=(key, value)
     h_key = index(key, @size)

     if @items[h_key].nil?
       @items[h_key] = Node.new(key, value)
     # elsif @items[h_key].key == key
     #   @items[h_key].value = value
     else
      while h_key < @items.size
        if @items[h_key].nil?
          @items[h_key] = Node.new(key, value)
          return
        else
          h_key = h_key + 1
        end
      end

      resize()
      self.[]=(key, value)
    end
  end

  def [](key)
    h_key = index(key, @size)
    while not @items[h_key].nil? && h_key >= @items.size
      if @items[h_key].key == key
         return @items[h_key].value
      else
         h_key += 1
      end
    end
  end

  # Returns a unique, deterministically reproducible index into an array
  # We are hashing based on strings, let's use the ascii value of each string as
  # a starting point.
  def index(key, size)
    key.sum % size    
  end

  # Given an index, find the next open index in @items
  def next_open_index(index)
   while index < @items.size
    if @items[index].nil?
      return index
     else
      index += 1
     end
    end

    return -1
  end

  # Simple method to return the number of items in the hash
  def size
    @size
  end

  # Resize the hash
  def resize
    puts "resizing" 
    @size = @size * 2
    puts "@size: #{@size}"    
    current = @items
    @items = Array.new(@size)
    current.each { |hash_item|
      unless hash_item.nil?
       self.[]=(hash_item.key, hash_item.value)
       # h_key = index(hash_item.key, @size)
       # @items[h_key] = hash_item
      end
    } 
  end
end