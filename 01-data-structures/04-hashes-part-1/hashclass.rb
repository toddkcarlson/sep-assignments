# .hash different value everytime
# how should the data look? How do you see the orginal key value?
# how to re-hash

class HashClass

  def initialize(size)
    @size = size
    @items = Array.new(@size)
  end

  def []=(key, value)
    h_key = index(key, @size)    
    
    while @items[h_key] && @items[h_key] != value
      puts "collison!"
      resize()      
      h_key = index(key, @size)
    end
    
    @items[h_key] = value
    puts "new item"    
  end

  def [](key)
    h_key = index(key, @size) 
    @items[h_key].value
  end

  def resize
    p_size = @size    
    @size = @size * 2
    @items.fill(nil, p_size..@size-1) 
  end

  def index(key, size)
    key.hash % size
  end

  def size
    @size
  end

end