def interactive_menu
  students = []
  loop do
    # 1. print the menu and ask the user what to do
    puts "1. Input the students"
    puts "2. Show the students"
    puts "9. Exit" # 9 because we'll be adding more items
    puts "Choose an option:"
    # 2. read the input and save it into a variable
    selection = gets.chomp
    # 3. do what the user has asked
    case selection
    when "1"
      students = input_students
    when "2"
      print_header
      print(students)
      print_footer(students)
    when "9"
      exit # this will cause the program to terminate
    else
      puts "I don't know what you meant, try again"
    end
  end
end


def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  # create an empty array
  students = []
  # get the first name
  name = gets.delete("\n")
  # get the cohort
  cohort = gets.delete("\n")
  # while the name is not empty, repeat this code

  while !name.empty? do
    # add the student hash to the array
    if !cohort.empty?
    students << {name: name, cohort: cohort, hobbies: :hobbies, height: :height, country_of_birth: :country_of_birth }
    puts students.count > 1 ? "Now we have #{students.count} students" : "Now we have #{students.count} student"
    # get another name from the user
    name = gets.delete("\n")
    cohort = gets.delete("\n")
    else
      students << {name: name, cohort: :november, hobbies: :hobbies, height: :height, country_of_birth: :country_of_birth }
      puts students.count > 1 ? "Now we have #{students.count} students" : "Now we have #{students.count} student"
      # get another name from the user
      name = gets.delete("\n")
      cohort = gets.delete("\n")
    end
  end
  # return the array of students
  students
end

=begin
students = [
  {name: "Dr. Hannibal Lecter", cohort: :november},
  {name: "Darth Vader", cohort: :november},
  {name: "Nurse Ratched", cohort: :november},
  {name: "Michael Corleone", cohort: :november},
  {name: "Alex DeLarge", cohort: :november},
  {name: "The Wicked Witch of the West", cohort: :november},
  {name: "Terminator", cohort: :november},
  {name: "Freddy Krueger", cohort: :november},
  {name: "The Joker", cohort: :november},
  {name: "Joffrey Baratheon", cohort: :november},
  {name: "Norman Bates", cohort: :november}
]
=end

def print_header
puts "The students of Villains Academy"
puts "-------------"
end
def print(students)
if students.to_a.length > 0
stu = students.sort_by {|a| a[:cohort].to_sym  }
stu.each_with_index {|student, index| puts "#{index+1}. #{student[:name]} #{student[:cohort]}"}
else
end
end

def print_footer(names)
if names.to_a.length > 0
  lineWidth = 75
puts names.count > 1 ? "Overall, we have #{names.count} great students".center(lineWidth) : "Overall, we have #{names.count} great student".center(lineWidth)
else
end
end

interactive_menu
students = input_students
print_header
print(students)
print_footer(students)
