# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
categories = Category.create!([
  { title: 'Books' },
  { title: 'World' },
  { title: 'Animals' }
])

users = User.create!([
  { name: 'Ivanov' },
  { name: 'Petrov' },
  { name: 'Sidorov' }
])

tests = Test.create!([
  { title: 'First', level: 1, category_id: categories[0].id, author_id: users[0].id},
  { title: 'Second', level: 2, category_id: categories[1].id, author_id: users[0].id },
  { title: 'Third', level: 3, category_id: categories[2].id, author_id: users[0].id },
  { title: 'Fourth', level: 1, category_id: categories[0].id, author_id: users[1].id }
])

UserTest.create!([
  { user_id: users[0].id, test_id: tests[0].id },
  { user_id: users[1].id, test_id: tests[2].id },
  { user_id: users[2].id, test_id: tests[1].id },
  { user_id: users[0].id, test_id: tests[3].id }
])

questions = Question.create!([
  { body: '1?', test_id: tests[0].id },
  { body: '2?', test_id: tests[1].id },
  { body: '3?', test_id: tests[2].id },
  { body: '4?', test_id: tests[3].id },
  { body: '5?', test_id: tests[3].id }
])

Answer.create!([
  { correct: false, question_id: questions[0].id },
  { correct: true, question_id: questions[1].id}
])