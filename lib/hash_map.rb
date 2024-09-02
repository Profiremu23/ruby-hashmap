# frozen_string_literal: false

require './lib/linked_list'

# The implementaion of a hash map by Profiremu23
class HashMap
  attr_reader :capacity

  def initialize
    @bucket_list = Array.new(16) { LinkedList.new }
    @capacity = @bucket_list.size
    @load_factor = 0.75
  end

  def hash(key)
    hash_code = 0
    prime_number = 37

    key.each_char { |char| hash_code = prime_number * hash_code + char.ord }

    hash_code
  end

  def set(key, value)
    hash_value = hash(key)

    @bucket_list[hash_value % @capacity].pop if @bucket_list[hash_value % @capacity].contains?(key)
    @bucket_list[hash_value % @capacity].apprend(key, value)
  end

  def get(key) end

  def has?(key) end

  def remove(key)
    index = 0
    @bucket_list.length.times do
      p key_index = @bucket_list[index].find(key)
      p @bucket_list[index].remove_at(key_index) unless key_index.nil?
      index += 1
    end
  end

  def length; end

  def clear; end

  def keys; end

  def values; end

  def entries; end
end
