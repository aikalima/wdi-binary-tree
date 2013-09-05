
class Node
  attr_accessor :d, :p, :n

  def initialize(data)
    @d = data
    @p = @n = nil
  end

  def to_s
    nxt = @n.nil? ? 'empty' : @n.d
    prv = @p.nil? ? 'empty' : @p.d
    "#{prv} <- #{@d} -> #{nxt}"
  end
end

class Tree
  attr_accessor :root, :nodes

  def insert(name)
    if @root.nil?
      @root = Node.new(name)
    else
      insert_node(@root, name)
    end
  end

  def insert_node(node, name)
    if (name < node.d) && (!node.p.nil?)
      insert_node(node.p, name)
    elsif (name > node.d) && (!node.n.nil?)
      insert_node(node.n, name)
    elsif (name < node.d) && (node.p.nil?)
      node.p = Node.new(name)
    elsif (name > node.d) && (node.n.nil?)
      node.n = Node.new(name)
    end
  end

  def find(name)
    find_node(@root, name)
  end

  def find_node(node, name)
    puts "call to find"
    if name == node.d
      node
    elsif name < node.d && !node.p.nil?
      find_node(node.p, name)
    elsif name > node.d && !node.n.nil?
      find_node(node.n, name)
    else
      nil
    end
  end

  def to_s
    @nodes = []
    inorder_traversal(@root)
    #preorder_traversal(@root)
    #postorder_traversal(@root)
    @nodes.join(', ')
  end

  def inorder_traversal(node)
    inorder_traversal(node.p) if !node.p.nil?
    @nodes << node.d
    inorder_traversal(node.n) if !node.n.nil?
  end

  def preorder_traversal(node)
    @nodes << node.d
    preorder_traversal(node.p) if !node.p.nil?
    preorder_traversal(node.n) if !node.n.nil?
  end

  def postorder_traversal(node)
    postorder_traversal(node.p) if !node.p.nil?
    postorder_traversal(node.n) if !node.n.nil?
    @nodes << node.d
  end

end

t1 = Tree.new
t1.insert('Josh')
t1.insert('Karl')
t1.insert('Justin')
t1.insert('Ian')
t1.insert('Matt')
t1.insert('David')
t1.insert('Xiao')
t1.insert('Donielle')
t1.insert('Lior')
t1.insert('Bryan')
t1.insert('Ryan')
t1.insert('Lauren')
t1.insert('Sharif')
t1.insert('Ricky')
t1.insert('Alex')
t1.insert('Todd')


brian = t1.find('Bryan')
ricky = t1.find('Ricky')
karl = t1.find('Karl')
puts "b: #{brian}"
puts "R: #{ricky}"
puts "K: #{karl}"
puts "Tree: #{t1}"

