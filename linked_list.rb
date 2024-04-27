require_relative 'node'
class LinkedList
  def intizialize(head = nil)
    @head = head
  end

  def append(value)
    return @head = Node.new(value) if @head == nil

    tmp = @head
    tmp = tmp.next_node while tmp.next_node != nil
    tmp.next_node = Node.new(value)
  end
end

list = LinkedList.new
list.append(55)
list.append(66)
p list