# students listed in an array variable
students = [
  {name: "Dr. Hannibal Lecter", cohort: :november},
  {name: "Darth Vader", cohort: :november},
  {name: "Nurse Ratched", cohort: :november},
  {name: "Michael Corleone", cohort: :november},
  {name: "Alex Delarge", cohort: :november},
  {name: "The Wicked Witch of the West", cohort: :november},
  {name: "Terminator", cohort: :november},
  {name:"Freddy Krueger", cohort: :november},
  {name:"The Joker", cohort: :november},
  {name:"Joffery Baratheon", cohort: :november},
  {name:"Norman Bates", cohort: :november}
]

def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end

def print(names)
  names.each do |student|
    puts "#{student[:name]} (#{student[:cohort]} cohort)"
  end
end

def print_footer(names)
  puts "Overall we have #{names.count} great students"
end

def input_students
  puts "Please enter the name of the students"
  puts "To finish, just hit return twice"
  students = []
  name = gets.chomp
  while !name.empty? do
    students << {name: name, cohort: :november}
    puts "Now we have #{students.count} students"
    name = gets.chomp
  end
  students
end

def students_index(list)
  list.each.with_index(1) do |value, index|
    puts "#{index}. #{value[:name]} (#{value[:cohort]} cohort)" 
  end
end

# call methods
students_index(students)
print_header()
print(students)
print_footer(students)