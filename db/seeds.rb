# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)


pablo = User.new(email: "pablo@hotmail.fr", full_name: "Pablo", password: "pablo@hotmail.fr")
pablo.save!

tom = User.new(email: "tom@hotmail.fr", full_name: "tom", password: "tom@hotmail.fr")
tom.save!

lloyd = User.new(email: "baywebcreative@gmail.com", full_name: "lloyd", password: "baywebcreative@gmail.com")
lloyd.save!

astrid = User.new(email: "astridchazaux@hotmail.fr", full_name: "Astrid Chazaux", password: "astridchazaux@hotmail.fr")
astrid.save!


astridevent = Event.new(google_event_id: "akwjdwjakdajkwh", start_time: Time.now, end_time: Date.today+1, user: User.last, summary: "test_event")
astridevent.save!

tomevent = Event.new(google_event_id: "akwjdwh", start_time: Time.now, end_time: Date.today+1, user: tom, summary: "test_event")
tomevent.save!

lloydevent = Event.new(google_event_id: "mesrkghj", start_time: Date.today+1, end_time: Date.today+2, user: lloyd, summary: "test_event")
lloydevent.save!

pabloevent = Event.new(google_event_id: "mes", start_time: Date.today+4, end_time: Date.today+5, user: pablo, summary: "test_event")
pabloevent.save!

lloydfriendastrid = Contact.new(sender: lloyd, receiver: astrid, status: 1)
lloydfriendastrid.save!

lloydfriendtom = Contact.new(sender: lloyd, receiver: tom, status: 1)
lloydfriendtom.save!

lloydfriendpablo = Contact.new(sender: lloyd, receiver: pablo, status: 1)
lloydfriendpablo.save!

tomfriendpablo = Contact.new(sender: tom, receiver: pablo, status: 1)
tomfriendpablo.save!

astridfriendtom = Contact.new(sender: astrid, receiver: tom, status: 1)
astridfriendtom.save!

astridfriendpablo = Contact.new(sender: astrid, receiver: pablo, status: 1)
astridfriendpablo.save!

tomfriendpablo = Contact.new(sender: tom, receiver: pablo, status: 1)
tomfriendpablo.save!
