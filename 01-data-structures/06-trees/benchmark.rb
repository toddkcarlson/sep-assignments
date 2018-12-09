require 'benchmark'
require './binary_tree/binary_search_tree.rb'
require './binary_heap/heap_tree.rb'

def insert_elements(tree)
	(2..100000).to_a.shuffle.each do |x|
	# 2.upto(10000) do |x|
		tree.insert(tree.root, Node.new("title", x))
	end
end
root = Node.new("title", 1)
binaryTree = BinarySearchTree.new(root)
binaryHeap = MinHeapTree.new(root)

Benchmark.bm do |x|
  x.report("insert (tree):") { insert_elements(binaryTree) }
  x.report("insert (heap):") { insert_elements(binaryHeap) }
   x.report("find (tree):") { binaryTree.find(root, Node.new("title", 50000))}
   x.report("find (heap):") { binaryHeap.find(root, Node.new("title", 50000))}
   x.report("delete (tree):") { binaryTree.delete(root, Node.new("title", 10000)) }
   x.report("delete (heap):") { binaryHeap.delete(root, Node.new("title", 10000)) }
end