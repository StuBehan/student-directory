# students listed in an array of key value pairs 
students = [
  {name: "Dr. Hannibal Lecter", cohort: :november, hobbies: "Music", weight: 76, height: 173},
  {name: "Darth Vader", cohort: :november, hobbies: "Archeology", weight: 120, height: 203},
  {name: "Nurse Ratched", cohort: :november, hobbies: "Religion", weight: 55, height: 168},
  {name: "Michael Corleone", cohort: :november, hobbies: "Volunteer Work", weight: 57, height: 168},
  {name: "Alex Delarge", cohort: :november, hobbies: "Community Service", weight: 56, height: 152},
  {name: "The Wicked Witch of the West", cohort: :november, hobbies: "Flying", weight: 64, height: 168},
  {name: "Terminator", cohort: :december, hobbies: "Travel", weight: 110, height: 183},
  {name: "Freddy Krueger", cohort: :december, hobbies: "Gardening", weight: 73, height: 177},
  {name: "The Joker", cohort: :december, hobbies: "Chiropterology", weight: 80, height: 182},
  {name: "Joffery Baratheon", cohort: :december, hobbies: "Hunting", weight: 60, height: 172},
  {name: "Norman Bates", cohort: :december, hobbies: "Taxidermy", weight: 82, height: 185}
]

# prints header txt
def print_header
  puts "The students of Villains Academy".center(50)
  puts "-------------".center(50)
end

# prints the key value pairs of the hash given as the arguement 
# def print(names)
#   names.each do |student|
#     puts "#{student[:name]} (#{student[:cohort]} cohort)"
#   end
# end

# print rewritten to demonstrate loop control flow
def print(list)
  count = 0
  while count < list.length
    puts "#{list[count].fetch(:name)} (#{list[count].fetch(:cohort)} cohort)".center(50)
    count += 1
  end
end

# prints footer text showing the total number of students in the given arguement 
def print_footer(names)
  puts "Overall we have #{names.count} great students".center(50)
end

# allows user to enter a list of students names which are added to the november cohort
def input_students
  puts "To add students to the database you will require".center(50)
  puts "their name and specific cohort start month.".center(50)
  puts "To finish, type \"exit\" at the name entry stage.".center(50)
  months = [ "january", "february", "march", "april", "may", "june", "july", "august", "september", "october", "november", "december" ] 
  time = Time.new
  name = ""
  cohort = ""
  students = []
  cohort_correct = false
  name_correct = false

  loop do

    while name_correct == false
      puts "Please enter the name of the student:".center(50) 
      name = gets.chomp
      case name
      when "exit"
        break
      when ""
        puts "You can't leave the name field blank, try again".center(50)
      else
        puts "You entered \"#{name}\" is this correct? Y/N".center(50)
        result = gets.chomp
        if result.downcase == "y"
          name_correct = true
        else
          name_correct = false
        end
      end
    end
    # breaking out of the nested loops
    break if name == "exit"

    while cohort_correct == false
      puts "Enter the month that #{name}'s cohort starts:".center(50)
      cohort = gets.chomp
      case cohort.downcase 
      when ""
        # this date make the default cohort start-date 2 months after the current month
        month_number = time.month + 1
        # wrap month around after december (months_number representing the index of the array months)
        if month_number > 11
          month_number -= 12
        end
        cohort = months[month_number]
        cohort_correct = true
      when "january", "february", "march", "april", "may", "june", "july", "august", "september", "october", "november", "december"
        cohort_correct = true
      else
        puts "You've entered the month incorrectly, you typed \"#{cohort}\",  try again.".center(50)
      end
    end

    while !name.empty? && !cohort.empty? do
      students << {name: name, cohort: cohort.to_sym}
      if students.count == 1
        puts "Now we have 1 student!".center(50)
        print(students)
      else
        puts "Now we have #{students.count} students!".center(50)
        print(students)
      end
      name = ""
      cohort = ""
      name_correct = false
      cohort_correct = false
    end
  end
  
end

# adds index starting at 1. for each entry
def students_index(list)
  list.each.with_index(1) do |value, index|
    puts "#{index}. #{value[:name]} (#{value[:cohort]} cohort)".center(50)
  end
end

# prints a list of students with names that begin with a 
# specifc letter with a number of work arounds for incorrect entries

# just thought I could have made the method create modified hash for 
# each time it recieved a letter, deleting all entries which don't conform.
def begins_with(list)
  puts "Specify a letter to search names with:".center(50)
  letter = gets.chomp
  while !letter.empty? do
    counter = 0
    while letter.length > 1
      puts "Please enter only one character.".center(50)
      letter = gets.chomp
    end
    list.each do |student|
      name = student[:name]
      if name[0] == letter.upcase
        counter = counter + 1
        puts "#{student[:name]} (#{student[:cohort]} cohort)".center(50)
      end
      if student == list[list.length - 1] && counter == 0
        puts "There are no students who's name begins with #{letter.upcase}.".center(50)
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
  puts "These names are shorter than 12 characters in length.".center(50)
  print(list_new)
end

# prints only the entered cohort's list of students
# uses strip instead of chomp with the gets method, this cleans whitespace and LR at both ends of the string
def print_cohort(list)
  puts "These are the current active cohorts:".center(50)
  active_cohorts = list.uniq { |student| student[:cohort] }
  active_cohorts.each do |entry|
    puts "#{entry[:cohort]}".center(50)
  end
  puts "Enter a cohort start month to print students in that cohort".center(50)
  cohort_to_print = gets.strip.downcase.to_sym
  single_cohort = list.select { |student| student[:cohort] == cohort_to_print }
  single_cohort.each do |student| 
    puts "#{student[:name]} (#{student[:cohort]} cohort)".center(50)
  end
  
end

# call methods
# input_students()
# print_header()
# print(students)
# print_footer(students)
# students_index(students)
# begins_with(students)
# short_names(students)
print_cohort(students)