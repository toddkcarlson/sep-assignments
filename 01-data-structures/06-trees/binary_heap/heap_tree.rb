# 1. Insert a new node at the end of Heap.
# 2. Compare the value of the new child node with its parent.
# 3. If the value of parent node is less than child, then swap the parent node with the child node.
# 4. Repeat step 2 and 3 until the Heap property holds.

require_relative 'node'

class MinHeapTree
  attr_accessor :root
  attr_accessor :heap

  def initialize(root)
    @heap = [root] 
  end

  def insert(root, node)
    @heap << node
    current = @heap.length - 1
    parent = (@heap.length - 1)/2
     
     if @heap[parent].left == nil
      @heap[parent].left = node
      if @heap[current].rating < @heap[parent].rating
         @heap[parent].left = nil
         @heap[current] = @heap[parent]
         @heap[parent] = node
         @heap[parent].left = @heap[current]
      end       
     elsif @heap[parent].right == nil
       @heap[parent].right = node
       if @heap[current].rating < @heap[parent].rating
         @heap[parent].right = nil
         @heap[current] = @heap[parent]
         @heap[parent] = node
         @heap[parent].right = @heap[current]
       end        
     else  
       puts "insert error"      
    end
  end

  # Recursive Depth First Search
  def find(root, data) 

    if data == root.title
      return root
    else
      if root.right != nil
        result = find(root.right, data)
        if result != nil
          return result
        end
      end

      if root.left != nil
        result = find(root.left, data)
        if result != nil
          return result
        end
      end
    end
    nil
  end

  def delete(root, data)
    return nil if data.nil? 

    if data == root.title
      root = nil
    elsif root.right != nil
     if data == root.right.title
      root.right = nil
    else root.right.right != nil
      delete(root.right, data)
    end
  elsif root.left != nil
   if data == root.left.title
    root.left = nil
  else root.left.left != nil
    delete(root.left, data)
  end
else

end

end

  # Recursive Breadth First Search
  def printf(children=nil)

    queue = Queue.new
    queue.push(@root)

    while !queue.empty?
      current = queue.pop
      puts "#{current.title}: #{current.rating}"

      if current.left != nil
        queue.push(current.left)
      end

      if current.right != nil
        queue.push(current.right)
      end
    end
  end

end