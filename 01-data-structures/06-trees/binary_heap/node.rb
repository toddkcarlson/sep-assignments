class Node
  attr_accessor :title
  attr_accessor :rating
  attr_accessor :right
  attr_accessor :left

  def initialize(title, rating)
  	@title = title
  	@rating = rating
  	@right = nil
  	@left = nil
  end
end