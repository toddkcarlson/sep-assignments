require_relative 'node'

class BinarySearchTree
  attr_accessor :root

  def initialize(root)
    @root = root
  end

  def insert(root, node)

    if node.rating > root.rating
     if root.right == nil
      root.right = node
     else
      insert(root.right, node)      
     end
    elsif #node.rating < root.rating
     if root.left == nil
       root.left = node
     else  
      insert(root.left, node)       
    end    
  end 

end

  # Recursive Depth First Search
  def find(root, data)
    return nil if data.nil?    

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
    node = @root
    puts "#{node.title}: #{node.rating}" 

    while (node = node.left)
        puts "#{node.title}: #{node.rating}"
    end

    # while (node = node.right)
    #     puts "#{node.title}: #{node.rating}"
    # end    

  end
end