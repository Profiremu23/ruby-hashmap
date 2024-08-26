# frozen_string_literal: false


## The building block for any linked list
Node = Struct.new(:key, :value, :next_node)

## To represent the missing linked list class for Ruby
class LinkedList
  # Some constant variables for the linked list to work
  def initialize
    @head = nil
  end

  # This will add a new Node to the end of the linked list
  def apprend(key, value)
    if @head.nil?
      @head = Node.new(key, value)
    else
      current = @head
      current = current.next_node until current.next_node.nil?
      current.next_node = Node.new(key, value)
    end
  end

  # This will add a new Node to the beginning of the linked list
  def prepend(key, value)
    @head = Node.new(key, value, @head)
  end

  # This will insert a Node at a given index within the linked list
  def insert_at(index, key, value)
    current = @head
    (index - 1).times do
      current = current.next_node
    end
    current.next_node = Node.new(key, value, current.next_node)
  end

  # This will remove a Node at a given index within the linked list
  def remove_at(index)
    current = @head
    (index - 1).times do
      current = current.next_node
    end
    current.next_node = current.next_node.next_node
  end

  # This will get the accurate size of the current linked list
  def size
    current = @head
    index = 0

    until current.nil?
      index += 1 unless current.nil?
      current = current.next_node
    end

    index
  end

  # This will return the head node's value
  def head
    @head
  end

  # This will return the tail node's value
  def tail
    current = @head
    (@head.size - 2).times do
      current = current.next_node
    end
    current
  end

  # This will display a Node element by entering it's index within the linked list
  def at(index)
    current = @head
    index.times do
      current = current.next_node
    end
    current
  end

  # This will delete the last element from the linked list
  def pop
    current = @head
    (@head.size - 2).times do
      current = current.next_node
    end
    current.next_node = nil
  end

  # This will return a boolean value (true/false) depending on the given key's presentence in the linked list
  def contains?(key)
    current = @head
    (@head.size - 1).times do
      current = current.next_node
      return true if current.key == key
    end
    false
  end

  # This will find the given value's index position within it's linked list
  def find(key)
    current = @head
    index = 0
    @head.size.times do
      current = current.next_node
      index += 1
      return index if current.key == key
    end
    nil
  end

  # This will give the linked list a more organized and cleaner look when printed to the terminal
  def to_s
    current = @head
    display = ''
    @head.size.times do
      display << "( #{current.key} ) -> "
      current = current.next_node
    end
    display << 'nil'
  end
end
