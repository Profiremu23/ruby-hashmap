# frozen_string_literal: false

require './lib/hash_map'

# node = Node.new('Amogus')
# p node.key
# p node.value

# p test = HashMap.new
# test.set('Denise', 'Bureau')
# test.set('Denise', 'Ledarron')
# test.remove('Denise')
# p test

p list = LinkedList.new
p list.apprend('Charlotte', 'Furbeau')
p list.apprend('Julie', 'Pomme')
p list.prepend('Camille', 'Levent')
p list.insert_at(2, 'Jeanne', 'Mureau')
p list.size
p list
p list.head
p list.tail
p list.at(2)
p list.contains?('Jeanne')
p list.contains?('Isabelle')
p list.find('Vanessa')
puts list
