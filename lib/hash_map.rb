# frozen_string_literal: false

require './lib/linked_list'

# The implementaion of a hash map by Profiremu23
class HashMap
  attr_reader :capacity

  # Creating an array with 16 LinkedList elements (for the starting size) for the bucket list
  # Also defining the load factor and the hash map size
  def initialize
    @bucket_list = Array.new(16) { LinkedList.new }
    @hash_map_size = @bucket_list.size
    @load_factor = 0.75
  end

  # Method for expanding the bucket list when the load factor is exceeded
  def bucket_expansion
    active_lists = 0
    index = 0
    @bucket_list.length.times do
      active_lists += @bucket_list[index].size
      index += 1
    end

    if (active_lists / @hash_map_size.to_f) > @load_factor
      @bucket_list.concat(Array.new(@bucket_list.size) { LinkedList.new })
      @hash_map_size = @bucket_list.size
    end
  end

  # Creates a integer code for the set(key, value) method from the key variable
  def hash(key)
    hash_code = 0
    prime_number = 37

    key.each_char { |char| hash_code = prime_number * hash_code + char.ord }

    hash_code
  end

  # Adds a pair containing a key and a value to one of the buckets within the hash map
  def set(key, value)
    hash_index = hash(key) % @hash_map_size
    raise IndexError if hash_index.negative? || hash_index >= @hash_map_size

    @bucket_list[hash_index].pop if @bucket_list[hash_index].contains?(key)
    p @bucket_list[hash_index].apprend(key, value)
    bucket_expansion
  end

  # Returns a key from the bucket list if it exists, otherwise it will return nil
  def get(key)
    index = 0
    @bucket_list.length.times do
      key_index = @bucket_list[index].find(key)
      p @bucket_list[index].at(key_index).value unless key_index.nil?
      index += 1
    end
    nil
  end

  # Returns a boolean value (true or false), depending on the presence of the key within the bucket list
  def has?(key)
    index = 0
    @bucket_list.length.times do
      return p true if @bucket_list[index].contains?(key)

      index += 1
    end
    p false
  end

  # Removes the given key from the bucket list
  def remove(key)
    index = 0
    @bucket_list.length.times do
      key_index = @bucket_list[index].find(key)
      p @bucket_list[index].remove_at(key_index) unless key_index.nil?
      index += 1
    end
  end

  # Returns the correct size of the hash map by adding the lengths of the individual buckets
  def length
    index = 0
    stored_keys = 0
    @bucket_list.length.times do
      stored_keys += @bucket_list[index].size unless @bucket_list[index].nil?
      index += 1
    end
    p stored_keys
  end

  # Self-explanatory, it will clear the whole hash map, bucket by bucket
  def clear
    index = 0
    @bucket_list.length.times do
      @bucket_list[index] = nil
      index += 1
    end
    p nil
  end

  # Collects and return all existing keys from all buckets of the hash map under an array
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

  # Collects and return all existing values from all buckets of the hash map under an array
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

  # Collects and return all pairs of keys and values of the hash map together under a singular array
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
