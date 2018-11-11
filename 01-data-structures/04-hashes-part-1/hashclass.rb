require_relative 'hash_item'

class HashClass

  def initialize(size)
    @size = size
    @items = Array.new(@size)
  end

  def []=(key, value)
    h_key = index(key, @size)    
    if @items[h_key].nil?
      puts "new item" 
      @items[h_key] = HashItem.new(key, value)
    elsif @items[h_key].key == key
      puts "replacing item"
      @items[h_key].value = value 
    else
      puts "collision!"
      resize()      
      h_key = index(key, @size)
      self.[]=(key, value)
    end
  end
  
  def [](key)
    h_key = index(key, @size) 
    @items[h_key].value
  end

  def resize 
    puts "resizing" 
    puts "@size: #{@size}"
    @size = @size * 2
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

  def index(key, size)
    key.sum % size
  end

  def size
    @size
  end

end