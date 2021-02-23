# students listed in an array variable
students = [
  {name: "Dr. Hannibal Lecter", cohort: :november},
  {name: "Darth Vader", cohort: :november},
  {name: "Nurse Ratched", cohort: :november},
  {name: "Michael Corleone", cohort: :november},
  {name: "Alex Delarge", cohort: :november},
  {name: "The Wicked Witch of the West", cohort: :november},
  {name: "Terminator", cohort: :november},
  {name: "Freddy Krueger", cohort: :november},
  {name: "The Joker", cohort: :november},
  {name: "Joffery Baratheon", cohort: :november},
  {name: "Norman Bates", cohort: :november}
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

def begins_with(list)
  puts "Specify a letter to search names with:"
  letter = gets.chomp
  while !letter.empty? do
    counter = 0
    while letter.length > 1
      puts "Please enter only one character."
      letter = gets.chomp
    end
    list.each do |student|
      name = student[:name]
      if name[0] == letter.upcase
        counter = counter + 1
        puts "#{student[:name]} (#{student[:cohort]} cohort)"
      end
      if student == list[list.length - 1] && counter == 0
        puts "There are no students who's name begins with #{letter.upcase}."
      end
    end
    letter = gets.chomp
  end 
end

# call methods
# students_index(students)
# print_header()
# print(students)
# print_footer(students)
begins_with(students)