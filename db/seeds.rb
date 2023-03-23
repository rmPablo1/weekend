# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

astrid = User.new(email: "astridchazaux@hotmail.fr", full_name: "Astrid Chazaux", password: "astridchazaux@hotmail.fr")
astrid.save!

event = Event.new(google_event_id: "akwjdwjakdajkwh", start_time: Time.now, end_time: Date.today+1, user: User.last, summary: "test_event")
event.save!

otheruser = Event.new(google_event_id: "akwjdwjakdajkwh", start_time: Time.now, end_time: Date.today+1, user: User.last, summary: "test_event")
event.save!
