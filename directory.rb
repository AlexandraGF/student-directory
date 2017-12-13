def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  # create an empty array
  students = []
  # get the first name
  name = gets.chomp
  # get the cohort
  cohort = gets.chomp
  # while the name is not empty, repeat this code

  while !name.empty? do
    # add the student hash to the array
    if !cohort.empty?
    students << {name: name, cohort: cohort, hobbies: :hobbies, height: :height, country_of_birth: :country_of_birth }
    puts students.count > 1 ? "Now we have #{students.count} students" : "Now we have #{students.count} student"
    # get another name from the user
    name = gets.chomp
    cohort = gets.chomp
    else
      students << {name: name, cohort: :november, hobbies: :hobbies, height: :height, country_of_birth: :country_of_birth }
      puts students.count > 1 ? "Now we have #{students.count} students" : "Now we have #{students.count} student"
      # get another name from the user
      name = gets.chomp
      cohort = gets.chomp
    end
  end
  # return the array of students
  students
end

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
def print_header
puts "The students of Villains Academy"
puts "-------------"
end
def print(students)
# students.each_with_index {|student, index| "#{index+1}. #{student[:name]} #{student[:cohort]}"}
stu = students.sort_by {|a| a[:cohort].to_sym  }
stu.each_with_index {|student, index| puts "#{index+1}. #{student[:name]} #{student[:cohort]}"}
end

def print_footer(names)
  lineWidth = 75
puts names.count > 1 ? "Overall, we have #{names.count} great students".center(lineWidth) : "Overall, we have #{names.count} great student".center(lineWidth)
end

students = input_students
print_header
print(students)
print_footer(students)
