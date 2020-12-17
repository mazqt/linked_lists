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
    counter
  end

  def at(index)
    size = self.size
    return if index < 0 || index >= size
    counter = 0
    current_node = @head
    while counter != index
      current_node = current_node.next
      counter += 1
    end
    current_node.value
  end

  def pop
    current_node = @head
    prev_node = 0

    until current_node == @tail
      prev_node = current_node
      current_node = current_node.next
    end

    prev_node.next = nil
    @tail = prev_node
  end

  def contains?(value)
    current_node = @head

    until current_node.nil?
      return true if current_node.value == value
      current_node = current_node.next
    end

    false
  end

  def find(value)
    current_node = @head
    index = 0

    until current_node.nil?
      return index if current_node.value == value
      current_node = current_node.next
      index += 1
    end

    nil
  end

  def to_s
    current_node = @head

    until current_node.nil?
      p current_node.value
      current_node = current_node.next
    end
  end

  def insert_at(value, index)
    return if index > self.size || index < 0
    if index == self.size
      self.append(value)
      return
    elsif index == 0
      self.prepend(value)
      return
    end

    new_node = Node.new(value)
    current_node = @head
    count = 0

    until current_node.nil?
      if count == index
        new_node.next = current_node.next
        current_node.next = new_node
      end
      count += 1
      current_node = current_node.next
    end
  end

  def remove_at(index)
    return if index < 0 || index >= self.size
    current_node = @head
    prev_node = nil
    count = 0

    until count == index
      prev_node = current_node
      current_node = current_node.next
      count += 1
    end

    prev_node.next = current_node.next
    current_node.next = nil
  end
end
