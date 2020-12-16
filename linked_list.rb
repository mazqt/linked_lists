require "./node.rb"
require 'byebug'

class LinkedList
  attr_reader :head, :tail
  def initialize()
    @head = nil
    @tail = nil
  end

  def append(value)
    new_node = Node.new(value)
    if @head.nil?
      @head = new_node
      @tail = new_node
    else
      @tail.next = new_node
      @tail = new_node
    end
  end

  def prepend(value)
    new_node = Node.new(value)
    if @head.nil?
      @head = new_node
      @tail = new_node
    else
      new_node.next = @head
      @head = new_node
    end
  end

  def size
    counter = 0
    current_node = @head

    while current_node != nil
      counter += 1
      current_node = current_node.next
    end
    puts counter
  end

  def at(index)
    counter = 0
    current_node = @head
    while counter != index
      current_node = current_node.next
      counter += 1
    end
    current_node.value
  end

  def pop

  end
end

l = LinkedList.new()
l.append("Hello")
l.append("World")
l.prepend("Oh my,")
l.append("How are you")
l.append("Doing?")
l.prepend("2")
l.prepend("haha")
l.size
l.at(4)
l.at(6)
l.at(1)

