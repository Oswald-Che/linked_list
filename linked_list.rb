require_relative 'node'
class LinkedList
  def intizialize
    @head = nil
  end

  def append(value)
    return @head = Node.new(value) if @head.nil?

    tmp = @head
    tmp = tmp.next_node until tmp.next_node.nil?
    tmp.next_node = Node.new(value)
  end

  def prepend(value)
    @head = Node.new(value, @head)
  end

  def size
    return 0 if @head.nil?

    tmp = @head
    count = 1
    until tmp.next_node.nil?
      count += 1
      tmp = tmp.next_node
    end
    count
  end

  def head
    @head
  end

  def tail
    tmp = @head
    tmp = tmp.next_node until tmp.next_node.nil?
    tmp
  end

  def at(index)
    tmp = @head
    count = 0
    until count == index
      tmp = tmp.next_node
      count += 1
    end
    tmp
  end

  def pop
    tmp = @head
    tmp = tmp.next_node while tmp.next_node != tail
    last = tmp.next_node
    tmp.next_node = nil
    last
  end

  def contains?(value)
    tmp = @head
    until tmp.nil?
      return true if tmp.value == value
      tmp = tmp.next_node
    end
    false
  end

  def find(value)
    tmp = @head
    count = 0
    index = nil
    until tmp.nil?
      index = count if tmp.value == value
      tmp = tmp.next_node
      count += 1
    end
    index
  end

  def to_s
    tmp = @head
    str = ''
    until tmp.nil?
      str += "( #{tmp.value} ) -> "
      tmp = tmp.next_node
    end
    str + 'nil'
  end

  def insert_at(value, index)
    return prepend(value) if index.zero?

    tmp = at(index - 1)
    tmp.next_node = Node.new(value, tmp.next_node)
  end

  def delete_at(index)
    return @head = @head.next_node if index.zero?

    tmp = at(index - 1)
    tmp.next_node = tmp.next_node.next_node
  end
end

list = LinkedList.new
list.append(55)
list.append(66)
list.prepend(44)
list.insert_at(50, 1)
list.delete_at(1)
p list.at(1)
p list.to_s