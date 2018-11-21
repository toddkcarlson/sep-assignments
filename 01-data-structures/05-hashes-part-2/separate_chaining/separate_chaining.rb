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

require_relative 'linked_list'

class SeparateChaining
  attr_reader :max_load_factor

  def initialize(size)
    @size = size
    @max_load_factor = 0.7
    @values = 0
    @items = Array.new(@size)
  end

  def []=(key, value, increase = true)
    node = Node.new(key, value)
    h_key = index(key, @size)
   
    if @items[h_key].nil?
      puts "new item"
      @items[h_key] = LinkedList.new
      @items[h_key].add_to_tail(node)
      
      if increase 
       @values += 1
      end  
    # elsif @items[h_key].key == key
    #    #puts "replacing item"
    #    @items[h_key].value = value
    else
      @items[h_key].add_to_tail(node)
      if increase 
       @values += 1
      end  
    end  

    if increase && (load_factor() >= @max_load_factor)
      puts "resizing!"
      resize()      
    end 
  end

  def [](key)
    h_key = index(key, @size)

    current = @items[h_key]

    if current != nil
      current = current.head
    end

    while current != nil
              puts "while 2"
      if current.key == key
        return current.value
      end
        current = current.next
    end 
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
    (@values + 0.0) / @size
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
    @items = Array.new(@size)
    current.each { |ll|
     unless ll.nil?
     curr = ll.head
       while curr != nil
        puts curr
         self.[]=(curr.key, curr.value, false)
         curr = curr.next
        end
      end
    }
    # @items = new_array
  end
end