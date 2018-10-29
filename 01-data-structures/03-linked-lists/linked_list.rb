require_relative 'node'

class LinkedList
  attr_accessor :head
  attr_accessor :tail

  def initialize
    @head = nil
  end

  # This method creates a new `Node` using `data`, and inserts it at the end of the list.
  def add_to_tail(node)
    current = @head

    if @head
      while current.next != nil
        current = current.next
      end
      current.next = Node.new(node)
    else
      @head = Node.new(node)
    end
  end

  # This method removes the last node in the lists and must keep the rest of the list intact.
  def remove_tail
    current = @head
    until current.next = nil
      current.next = current
    end
    @head = nil
  end

  # This method prints out a representation of the list.
  def print
    node = @head
    puts node
    
    while (node = node.next)
      puts node
    end  
  end

  # This method removes `node` from the list and must keep the rest of the list intact.
  def delete(node)
    if @head == node
      @head = @head.next
      return
    end

    current = @head
    while current.next != null
      if current.next == node
        current.next = current.next.next
        return
      else
        current = current.next
      end
    end        
  end

  # This method adds `node` to the front of the list and must set the list's head to `node`.
  def add_to_front(node)
    hold = @head
    @head = Node.new(node)
    @head.next = hold    
  end

  # This method removes and returns the first node in the Linked List and must set Linked List's head to the second node.
  def remove_front
    @head = @head.next
  end
end