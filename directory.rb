# students listed in an array variable
students = [
  "Dr. Hannibal Lecter",
  "Darth Vader",
  "Nurse Ratched",
  "Michael Corleone",
  "Alex Delarge",
  "The Wicked Witch of the West",
  "Terminator",
  "Freddy Krueger",
  "The Joker",
  "Joffery Baratheon",
  "Norman Bates"
]
# print list of students
puts "The students of Villains Academy"
puts "-------------"
students.each do |student|
  puts student
end
# print the number of students
puts "Overall we have #{students.count} great students"