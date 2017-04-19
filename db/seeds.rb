# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
js_topic = Topic.create!(name: "js")
bk_city = City.create(name: "bk")
bk_js_event = Event.create(name: "jsconf", description: "much js", topic: js_topic, city: bk_city)

barcelona = City.create!(name: "Barcelona")
dison = Organizer.create!(name: "Dison")
elixir = Topic.create!(name: 'Elixir')
event = Event.create!(name: 'Elixir Conf EU', description: 'Elixir stuff!', topic: elixir,  city: barcelona, organizer:dison)
