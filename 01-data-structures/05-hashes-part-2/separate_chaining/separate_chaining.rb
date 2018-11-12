require_relative 'linked_list'

class SeparateChaining
  attr_reader :max_load_factor

  def initialize(size)
    @size = size
    @max_load_factor = 0.7
  end

  def []=(key, value)
  end

  def [](key)
  end

  # Returns a unique, deterministically reproducible index into an array
  # We are hashing based on strings, let's use the ascii value of each string as
  # a starting point.
  def index(key, size)
    key.hash % size
  end

  # Calculate the current load factor
  def load_factor
    values / keys
  end

  # Simple method to return the number of items in the hash
  def size
    @size
  end

  # Resize the hash
  def resize
    @size * 2
  end
end

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