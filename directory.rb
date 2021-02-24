# students listed in an array of key value pairs 
@students = [
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

@months = [ "january", "february", "march", "april", "may", "june", "july", "august", "september", "october", "november", "december" ]
# @students = []

# prints header txt
def print_header
  puts "The students of Villains Academy".center(70)
  puts "-------------".center(70)
end

# prints the key value pairs of the hash given as the arguement 
# def print(names)
#   names.each do |student|
#     puts "#{student[:name]} (#{student[:cohort]} cohort)"
#   end
# end

# print rewritten to demonstrate while loop control flow
def print_student_list
  count = 0
  while count < @students.count
    puts "#{@students[count].fetch(:name)} (#{@students[count].fetch(:cohort)} cohort)".center(70)
    count += 1
  end
end

# prints footer text showing the total number of students in the given arguement 
def print_footer
  puts "Overall we have #{@students.count} great students".center(70)
  puts "-------------".center(70)
end

# allows user to enter a list of students names which are added to the november cohort
def input_students
  puts "To add students to the database you will require".center(70)
  puts "their name and specific cohort start month.".center(70)
  puts "To return to the menu, type \"back\" at the name entry stage.".center(70)
  loop do
    @students << { name: enter_name, cohort: enter_cohort.to_sym }
    if @students.count == 1
      puts "Now we have 1 student!".center(70)
      print_student_list
    else
      puts "Now we have #{@students.count} students!".center(70)
      print_student_list
    end
    break if continue == false
  end
end

# adds index starting at 1. for each entry
def students_index
  @students.each.with_index(1) do |value, index|
    puts "#{index}. #{value[:name]} (#{value[:cohort]} cohort)".center(70)
  end
end

# prints a list of students with names that begin with a 
# specifc letter with a number of work arounds for incorrect entries.
# just thought I could have made the method create modified hash for 
# each time it recieved a letter, deleting all entries which don't conform.
def begins_with
  puts "Specify a letter to search names with:".center(70)
  letter = STDIN.gets.chomp
  while !letter.empty? do
    counter = 0
    while letter.length > 1
      puts "Please enter only one character.".center(70)
      letter = STDIN.gets.chomp
    end
    @students.each do |student|
      name = student[:name]
      if name[0] == letter.upcase
        counter = counter + 1
        puts "#{student[:name]} (#{student[:cohort]} cohort)".center(70)
      end
      if student == @students[@students.length - 1] && counter == 0
        puts "There are no students who's name begins with #{letter.upcase}.".center(70)
      end
    end
    letter = STDIN.gets.chomp
  end
end

# prints only the names from the given arguement that are 11 characters long or fewer
def short_names
  list_new = []
  @students.each do |student|
    if student[:name].length < 12
      list_new << student
    end
  end
  puts "These names are shorter than 12 characters in length.".center(70)
  print(list_new)
end

# prints only the entered cohort's list of students
# uses strip instead of chomp with the gets method, this cleans whitespace and LR at both ends of the string
def print_cohort
  puts "These are the current active cohorts:".center(70)
  active_cohorts = @students.uniq { |student| student[:cohort] }
  active_cohorts.each do |entry|
    puts "#{entry[:cohort]}".center(70)
  end
  puts "Enter a cohort start month to print students in that cohort".center(70)
  cohort_to_print = STDIN.gets.strip.downcase.to_sym
  single_cohort = @students.select { |student| student[:cohort] == cohort_to_print }
  single_cohort.each do |student| 
    puts "#{student[:name]} (#{student[:cohort]} cohort)".center(70)
  end
end

# runs the interactive menu in the loop
def interactive_menu
  loop do
    print_menu
    selection
  end
end

# outputs the options for the interactive menu
def print_menu
  puts "Welcome to the Student Directory".center(70)
  puts "Please make a selection from the menu".center(70)
  puts "-------------".center(70)
  puts "1. Input students".center(70)
  puts "2. Show students".center(70)
  puts "3. Save the student data to students.csv".center(70)
  puts "4. Load the student data from students.csv".center(70)
  puts "9. Exit".center(70)
end

# shows the menu
def selection
  selection = STDIN.gets.chomp
  case selection
  when "1"
    @students = input_students()
  when "2"
    print_header
    print_student_list
    print_footer
  when "3"
    save_students
  when "4"
    load_students
  when "9"
    exit
  else
    puts "That selection is incorrect, try again.".center(70)
  end
end

# refactored from the input_students method for all name entries
def enter_name
  loop do
    puts "Please enter the name of the student:".center(70) 
    name = STDIN.gets.chomp
    puts "You entered \"#{name}\" is this correct? Y/N".center(70)
    result = gets.chomp.downcase
    if result == "y"
      return name
      break
    end
  end
end

# refactored from the input_students for cohort month entry and verification
def enter_cohort
  time = Time.new 
  loop do
    puts "Enter the month the cohort starts:".center(70)
    cohort = STDIN.gets.chomp.downcase
    if cohort == ""
      month_number = time.month + 1  # this date make the default cohort start-date 2 months after the current month
      if month_number > 11
        month_number -= 12  # wrap month around after december (months_number representing the index of the array months)
      end
      cohort = @months[month_number]
      puts "Defaulted to the next cohort start date: #{cohort}.".center(70)
      return cohort
      break
    end
    if @months.include? cohort
      return cohort
      break
    else
      puts "You've entered the month incorrectly, you typed \"#{cohort}\",  try again.".center(70)
    end
  end
end

# a breaker for exiting entry methods
def continue
  puts "Do you wish to add more? Y/N".center(70)
  result = STDIN.gets.chomp.downcase
  if result == "n"
    return false
  end
end

# saves the @students array to a CSV file
def save_students
  file = File.open("students.csv", "w")
  @students.each do |student|
    student_data = [student[:name], student[:cohort]]
    csv_line = student_data.join(",")
    file.puts csv_line
  end
  file.close
end

# load @students from the CSV file
def load_students(filename = "students.csv")
  file = File.open(filename, "r")
  file.readlines.each do |line|
  name, cohort = line.chomp.split(',')
    @students << {name: name, cohort: cohort.to_sym}
  end
  file.close
end

# checks if filename exists and then pushes to load_students else quits
def try_load_students
  filename = ARGV.first 
  return if filename.nil? 
  if File.exists?(filename) 
    load_students(filename)
     puts "Loaded #{@students.count} from #{filename}"
  else
    puts "Sorry, #{filename} doesn't exist."
    exit
  end
end

try_load_students
interactive_menu