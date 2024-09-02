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

  def get(key)
    index = 0
    @bucket_list.length.times do
      key_index = @bucket_list[index].find(key)
      @bucket_list[index].at(key_index) unless key_index.nil?
      index += 1
    end
    nil
  end

  def has?(key)
    index = 0
    @bucket_list.length.times do
      return true if @bucket_list[index].contains?(key)

      index += 1
    end
    false
  end

  def remove(key)
    index = 0
    @bucket_list.length.times do
      key_index = @bucket_list[index].find(key)
      @bucket_list[index].remove_at(key_index) unless key_index.nil?
      index += 1
    end
  end

  def length
    index = 0
    stored_keys = 0
    @bucket_list.length.times do
      stored_keys += @bucket_list[index].size unless @bucket_list[index].nil?
      index += 1
    end
    stored_keys
  end

  def clear
    index = 0
    @bucket_list.length.times do
      @bucket_list[index] = nil
      index += 1
    end
    nil
  end

  def keys; end

  def values; end

  def entries; end
end
