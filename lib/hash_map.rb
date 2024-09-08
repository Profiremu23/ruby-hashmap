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

  def bucket_expansion
    active_lists = 0
    index = 0
    @bucket_list.length.times do
      active_lists += @bucket_list[index].size
      index += 1
    end

    if (active_lists / @capacity.to_f) > @load_factor
      @bucket_list.concat(Array.new(@bucket_list.size) { LinkedList.new })
      @capacity = @bucket_list.size
    end
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
    p stored_keys
  end

  def clear
    index = 0
    @bucket_list.length.times do
      @bucket_list[index] = nil
      index += 1
    end
    nil
  end

  def keys
    index = 0
    stored_keys = []
    @bucket_list.length.times do
      array_index = 0
      @bucket_list[index].size.times do
        stored_keys << @bucket_list[index].at(array_index).key
        array_index += 1
      end
      index += 1
    end
    p stored_keys
  end

  def values
    index = 0
    stored_values = []
    @bucket_list.length.times do
      array_index = 0
      @bucket_list[index].size.times do
        stored_values << @bucket_list[index].at(array_index).value
        array_index += 1
      end
      index += 1
    end
    p stored_values
  end

  def entries
    index = 0
    stored_entries = []
    @bucket_list.length.times do
      array_index = 0
      @bucket_list[index].size.times do
        pair = []
        pair << @bucket_list[index].at(array_index).key
        pair << @bucket_list[index].at(array_index).value
        stored_entries << pair
        array_index += 1
      end
      index += 1
    end
    p stored_entries
  end
end
