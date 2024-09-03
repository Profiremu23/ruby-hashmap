# frozen_string_literal: false

require './lib/hash_map'

test = HashMap.new
test.set('Denise', 'Bureau')
test.set('Jeanne', 'Ledarron')
test.set('Marie', 'Laforet')
test.set('Marianne', 'Ballon')
test.entries
p test
