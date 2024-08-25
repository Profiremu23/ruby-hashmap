# frozen_string_literal: false

## The building block for any linked list
Node = Struct.new(:key, :value, :next_node)

## To represent the missing linked list class for Ruby
class LinkedList
  # Some constant variables for the linked list to work
  def initialize
    @head = Node.new
  end

  # This will add a new Node to the end of the linked list
  def apprend(key, value)
  end

  # This will add a new Node to the beginning of the linked list
  def prepend(key, value)
  end

  def insert_at(index, key, value)
  end

  def remove_at(index)
  end

  # This will get the accurate size of the current linked list
  def size
  end

  # This will return the head node's value
  def head
  end

  # This will return the tail node's value
  def tail
  end

  # This will display a Node element by entering it's index within the linked list
  def at(index)
  end

  # This will delete the last element from the linked list
  def pop
  end

  # This will return a boolean value (true/false) depending on the given key's presentence in the linked list
  def contains?(key)
  end

  # This will find the given value's index position within it's linked list
  def find(key)
  end

  # This will give a more organized and cleaner look to represent a linked list in Ruby
  def to_s
  end
end
