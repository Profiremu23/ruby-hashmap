# frozen_string_literal: false

require './lib/hash_map'

test = HashMap.new
test.set('Axelle', 'Poche')
test.set('Catherine', 'Devent')
test.set('Denise', 'Hardy')
test.set('Emma', 'Bureau')
test.set('Esther', 'Garron')
test.set('Françoise', 'Bureau')
test.set('Hélène', 'Ledarron')
test.set('Jeannette', 'Ballon')
test.set('Louise', 'Pierre')
test.set('Lunette', 'Faure')
test.set('Marguerite', 'Laforet')
test.set('Virginie', 'Argent')
test.set('Yvonne', 'Lepont')
p test
test.set('Axelle', 'Red')
p test
test.get('Louise')
test.has?('Emma')
test.has?('Elisa')
test.remove('Yvonne')
test.length
test.keys
test.values
test.entries
test.clear
