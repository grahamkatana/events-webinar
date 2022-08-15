# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

puts "Seeding database................"

admin = AdminUser.create(email:'admin@site.com',password:'password')


webinars = Workshop.create([
    {
        name:"React Native Beginners",
        description:"A hands on webinar on developing mobile applications",
        start_date:Date.today + 2.days,
        end_date:Date.today + 12.days,
        start_time:"13:00 PM",
        end_time:"16:00 PM",
        total_spots:300,
        remaining_spots:300,
        registration_fee:1000.00
    },
    {
        name:"Ruby on rails",
        description:"Develop web applications using Ruby on rails. This is targetted for beginners wanting to know backend and MVC concepts",
        start_date:Date.today + 12.days,
        end_date:Date.today + 36.days,
        start_time:"12:00 PM",
        end_time:"13:30 PM",
        total_spots:100,
        remaining_spots:100,
        registration_fee:3000.00
    },
    {
        name:"Backend with Go lang and React Native",
        description:"Build an API with Go and consume the API with React Native. You will also learn about ORM using GORM. This webinar will teach you all the necessary tools used in the industry.",
        start_date:Date.today + 32.days,
        end_date:Date.today + 56.days,
        start_time:"09:00 AM",
        end_time:"12:30 PM",
        total_spots:250,
        remaining_spots:100,
        registration_fee:5200.00
    },
    {
        name:"Laravel from the ground up",
        description:"Learn one of the best progressive frameworks. Get to know backend development and designing modern apps plus a bonus of building a simple REST API.",
        start_date:Date.today + 12.days,
        end_date:Date.today + 26.days,
        start_time:"09:00 AM",
        end_time:"12:30 PM",
        total_spots:500,
        remaining_spots:500,
        registration_fee:2200.00
    },
    {
        name:"Backend for everyone + Frontend",
        description:"Based on previous webinars, now you can quickly pickup on python. Develop using Flask, FastApi and a bit of Django.After some python we get into Node js and express using sequalize as our ORM. Get to know React, Vue js and Svelte and connect any of your backend.",
        start_date:Date.today + 112.days,
        end_date:Date.today + 162.days,
        start_time:"19:00 PM",
        end_time:"20:30 PM",
        total_spots:100,
        remaining_spots:100,
        registration_fee:2500.00
    },
    {
        name:"Past Event",
        description:"A hands on webinar on developing mobile applications",
        start_date:Date.today - 12.days,
        end_date:Date.today - 2.days,
        start_time:"13:00 PM",
        end_time:"16:00 PM",
        total_spots:300,
        remaining_spots:300,
        registration_fee:1000.00
    }
])


puts "Database has been seeded........."