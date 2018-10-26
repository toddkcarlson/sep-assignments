#Use the mystack_spec.rb spec file and mystack.rb skeleton file in the sep-assignments repository to create a stack class in Ruby.
#Write push(element), pop, and empty? functions.
#Keep a pointer to the top of the stack.

class MyStack
  attr_accessor :top

  def initialize
    @stack = Array.new
    self.top = nil
  end

  def push(item)
    @stack.insert(0, item)
    self.top = @stack[0]
  end

  def pop
    @stack.delete_at(0)
    #self.top = @stack[0]
  end

  def empty?
    @stack[0] ? false : true
  end
end