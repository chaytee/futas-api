# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# 3.times do |number|
#   Message.create(content: "#{number}番目のメッセージです！", user_id: User.first.id)
#   puts "#{number}番目のメッセージを作成しました。"
# end

# puts "メッセージの作成が完了しました"


Task.create!(title: 'タスク１', limit_day: '2021-07-14', limit_time: '11:00:00')
Task.create!(title: 'タスク2', limit_day: '2021-07-14', limit_time: '11:00:00')
Task.create!(title: 'タスク3', limit_day: '2021-07-14', limit_time: '11:00:00')
Task.create!(title: 'タスク4', limit_day: '2021-07-14', limit_time: '11:00:00')
