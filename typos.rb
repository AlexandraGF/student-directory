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
  students << {name: name, cohort: cohort}
  puts "Now we have #{students.count} students"
  # get another name from the user
  name = gets.chomp
  # get another cohort from user
  cohort = gets.chomp
  end
  # return the array of students
  students
end

def print_header
  puts "The students of my cohort at Makers Academy"
  puts "-------------"

end

def print_students(students)
  if students.to_a.length > 0
  students.each do |student|
    puts "#{student[:name]} #{student[:cohort]} cohort"
  end
else
end
end

def print_footer(names)
  if names.to_a.length > 0
  puts "Overall, we have #{names.count} great students"
else
end
end


students = input_students
print_header
print_students(students)
print_footer(students)
