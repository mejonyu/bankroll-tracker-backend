# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

users = [
    {
        first_name: "Jonathan",
        last_name: "Yu",
        username: "jonyu",
        password_digest: "jonyu"
    },
    {
        first_name: "Andrew",
        last_name: "Yu",
        username: "ayu",
        password_digest: "ayu"
    },
    {
        first_name: "Raffy",
        last_name: "Rios",
        username: "raffyrios",
        password_digest: "raffyrios"
    }
]

sessions = [
    {
        stakes: "0.1/0.2",
        hours_played: 2,
        location: "Donkhouse",
        belongs_to: "jonyu",
        buy_in: 20,
        out_for: 50
    },
    {
        stakes: "0.1/0.2",
        hours_played: 5,
        location: "Donkhouse",
        belongs_to: "jonyu",
        buy_in: 50,
        out_for: 21
    },
    {
        stakes: "0.25/0.5",
        hours_played: 4,
        location: "Donkhouse",
        belongs_to: "ayu",
        buy_in: 100,
        out_for: 168
    },
    {
        stakes: "1/3",
        hours_played: 8,
        location: "Bellagio",
        belongs_to: "raffyrios",
        buy_in: 300,
        out_for: 1000
    },
    {
        stakes: "2/5",
        hours_played: 7,
        location: "Bellagio",
        belongs_to: "raffyrios",
        buy_in: 1000,
        out_for: 2570
    }
]

user_sessions = [
    {
        user_id: 1,
        session_id: 1
    },
    {
        user_id: 1,
        session_id: 2
    },
    {
        user_id: 2,
        session_id: 3
    },
    {
        user_id: 3,
        session_id: 4
    },
    {
        user_id: 3,
        session_id: 5
    }
]

User.create(users)
Session.create(sessions)
UserSession.create(user_sessions)
