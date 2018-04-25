# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Category.create(id: 1, title: 'Books')
Category.create(id: 2,title: 'World')
Category.create(id: 3,title: 'Animals')

Test.create(id: 1, title: 'First', level: 1, category_id: 1, user_id: 1)
Test.create(id: 2,title: 'Second', level: 2, category_id: 2, user_id: 3)
Test.create(id: 3,title: 'Third', level: 3, category_id: 3, user_id: 2)
Test.create(id: 4,title: 'Fourth', level: 1, category_id: 1, user_id: 1)

Answer.create(id: 1, correct: false)
Answer.create(id: 2, correct: true)

Question.create(id: 1, body: '1?', test_id: 1, answer_id: 1)
Question.create(id: 2, body: '2?', test_id: 2, answer_id: 2)
Question.create(id: 3, body: '3?', test_id: 3, answer_id: 1)
Question.create(id: 4, body: '4?', test_id: 4, answer_id: 2)
Question.create(id: 5, body: '5?', test_id: 4, answer_id: 1)

User.create(id: 1, name: 'Ivanov')
User.create(id: 2, name: 'Petrov')
User.create(id: 3, name: 'Sidorov')


