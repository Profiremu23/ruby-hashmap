# frozen_string_literal: false

## The building block for any linked list
Node = Struct.new(:key, :value, :next_node)

## To represent the missing linked list class for Ruby
class LinkedList
  attr_reader :head # This will return the head node's value

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
    index.times do
      current = current.next_node
    end

    if current.next_node.nil?
      self.pop
    elsif index.zero?
      @head = Node.new(current.next_node.key, current.next_node.value, current.next_node.next_node)
    else
      current.key = current.next_node.key
      current.value = current.next_node.key
      current.next_node = current.next_node.next_node
    end
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

  # This will return the tail node's value
  def tail
    current = @head
    current = current.next_node until current.next_node.nil?
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
    current = current.next_node until current.next_node.nil? || current.next_node.next_node.nil?
    p current

    if self.size == 1
      @head = nil
    else
      current.next_node = nil
    end
  end

  # This will return a boolean value (true/false) depending on the given key's presentence in the linked list
  def contains?(key)
    current = @head
    until current.nil?
      return true if current.key == key

      current = current.next_node
    end
    false
  end

  # This will find the given value's index position within it's linked list
  def find(key)
    current = @head
    index = 0
    until current.nil?
      return index if current.key == key

      current = current.next_node
      index += 1
    end
    nil
  end

  # This will give the linked list a more organized and cleaner look when printed to the terminal
  def to_s
    current = @head
    display = ''
    until current.nil?
      display << "( #{current.key} ) -> "
      current = current.next_node
    end
    display << 'nil'
  end
end
