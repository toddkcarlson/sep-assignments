class MyQueue
  attr_accessor :head
  attr_accessor :tail

  def initialize
    @queue = Array.new
    @head = @queue[0]
    @tail = @queue[-1]    
  end

  def enqueue(element)
    @queue << element
    @head = @queue[0]
    @tail = @queue[-1]
  end

  def dequeue
    @queue.delete_at(0)
    @head = @queue[0]
    @tail= @queue[-1]        
  end

  def empty?
    @queue[0] ? false : true    
  end
end