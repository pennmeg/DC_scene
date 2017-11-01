# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.create([
 { fullname:"Megan", username:"mtp", password:"mtp123", email:"megan@gmail.com",
  age: 27, gender: "female", country: "canada", primary_lang_id: "english",
  secondary_lang_id: "french", us_state: nil, bio: nil, admin: true },
  { fullname:"Joshua", username:"jkm", password:"jkm123", email:"joshua@gmail.com",
   age: 25, gender: "male", country: "usa", primary_lang_id: "english",
   secondary_lang_id: "italian", us_state: "ca", bio: nil, admin: false }
])
