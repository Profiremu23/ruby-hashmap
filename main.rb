# frozen_string_literal: false

require './lib/hash_map'

p test = HashMap.new
test.set('Denise', 'Bureau')
p test
test.set('Denise', 'Ledarron')
p test
test.remove('Denise')
p test
