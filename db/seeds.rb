# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'

    Team.destroy_all
    10.times do
        @team = Team.create(name: Faker::Team.unique.name, region: Faker::Address.city)
        10.times do
            user = @team.users.build(name: Faker::Name.name, phone: Faker::PhoneNumber.cell_phone, male: true)
            user.save!
        end
    end
