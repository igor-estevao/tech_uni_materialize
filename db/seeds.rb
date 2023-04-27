Course.create(short_name: "CSS1", name: "Cascate Style Sheet 1", description: "Course design to teach all the basics skills of CSS tech")
Course.create short_name: "CSS2", name: "Cascate Style Sheet 2", description: "Course design to teach all the moderate skills of CSS tech"
Course.create short_name: "CSS3", name: "Cascate Style Sheet 3", description: "Course design to teach all the advanced skills of C
SS tech"

5.times do
  Student.create name: Faker::Name.name, email: Faker::Internet.email, password: Faker::Internet.password
end