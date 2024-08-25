# frozen_string_literal: false

require './lib/linked_list'

# The implementaion of a hash map by Profiremu23
class HashMap
  def initialize
  end

  def hash(key)
    hash_code = 0
    prime_number = 37

    key.each_char { |char| hash_code = prime_number * hash_code + char.ord }

    hash_code
  end

  def set(key, value)
  end

  def get(key) end

  def has?(key) end

  def remove(key) end

  def length
  end

  def clear
  end

  def keys
  end

  def values
  end

  def entries
  end
end
