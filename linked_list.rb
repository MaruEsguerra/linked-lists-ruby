class LinkedList
  def initialize
    @head = nil
  end

  def append(value)
    new_node = Node.new(value)

    if @head.nil?
      @head = new_node
    else
      current = @head
      until current.next_node.nil?
        current = current.next_node
      end
      current.next_node = new_node
    end
  end

  def prepend(value)
    new_node = Node.new(value, @head)
    @head = new_node
  end

  def size
    count = 0
    current = @head
    while current
      count += 1
      current = current.next_node
    end
    count
  end

  def head
    @head
  end

  def tail
   current = @head
   while current.next_node
     current = current.next_node
   end
   current
  end

  def at(index)
    count = 0
    current = @head
    while current && count < index
      count += 1
      current = current.next_node
    end
    current
  end

  def pop
    return nil if @head.nil?

    if @head.next_node.nil?
      value = @head.value
      @head = nil
      value
    end

    current = @head
    while current.next_node.next_node
      current = current.next_node
    end

    value = current.next_node.value
    current.next_node = nil
    value
  end

  def contains?(value)
    current = @head
    while current
      return true if current.value == value
      current = current.next_node
    end
    false
  end

  def find(value)
    index = 0
    current = @head
    while current
      return index if current.value == value
      current = current.next_node
      index += 1
    end
    nil
  end

  def to_s
    nodes = []
    current = @head
    while current
      nodes << "( #{current.value} )"
      current = current.next_node
    end
    nodes.join(" -> ") + " -> nil"
  end

  def insert_at(value, index)
    if index == 0
      @head = Node.new(value, @head)
      return
    end

    count = 0
    current = @head
    while current && count < index - 1
      current = current.next_node
      count += 1
    end

    return nil unless current
    new_node = Node.new(value, current.next_node)
    current.next_node = new_node
  end

  def remove_at(index)
    return nil if @head.nil?

    if index == 0
      removed_value = @head.each_value
      @head = @head.next_node
      return removed_value
    end

    count = 0
    current = @head
    while current && count < index - 1
      current = current.next_node
      count += 1
    end

    return nil unless current && current.next_node

    removed_value = current.next_node.value
    current.next_node = current.next_node.next_node
    removed_value
  end
end

class Node
  attr_accessor :value, :next_node

  def initialize(value = nil, next_node = nil)
    @value = value
    @next_node = next_node
  end
end