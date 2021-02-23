# students listed in an array of key value pairs 
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

# prints header txt
def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end

# prints the key value pairs of the hash given as the arguement 
def print(names)
  names.each do |student|
    puts "#{student[:name]} (#{student[:cohort]} cohort)"
  end
end

# prints footer text showing the total number of students in the given arguement 
def print_footer(names)
  puts "Overall we have #{names.count} great students"
end

# allows user to enter a list of students names which are added to the november cohort
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

# adds index starting at 1. for each entry
def students_index(list)
  list.each.with_index(1) do |value, index|
    puts "#{index}. #{value[:name]} (#{value[:cohort]} cohort)" 
  end
end

# prints a list of students with names that begin with a 
# specifc letter with a number of work arounds for incorrect entries

# just thought I could have made the method create modified hash for 
# each time it recieved a letter, deleting all entries which don't conform.
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

# prints only the names from the given arguement that are 11 characters long or fewer
def short_names(list)
  list_new = []
  list.each do |student|
    if student[:name].length < 12
      list_new << student
    end
  end
  puts "These names are shorter than 12 characters in length."
  print(list_new)
end

# call methods
# students_index(students)
# print_header()
# print(students)
# print_footer(students)
# begins_with(students)
short_names(students)