require 'csv'

@students = []

def print_menu
  puts "Press '1' to type in the students"
  puts "Press '2' to show the students"
  puts "Press '3' to save the list to file"
  puts "Press '4' to load the list from file"
  puts "Press '9' when you want to leave the program"
end

def interactive_menu
  loop do
    print_menu
    process(STDIN.gets.chomp)
  end
end

def process(selection)
  case selection
  when "1" then puts "You have chosen to type in students"; input_students
  when "2" then puts "You have chosen to show the students"; show_students
  when "3" then puts "You have chosen to save to the file"; save_students
  when "4" then puts "You have chosen to load from the file";load_students
  when "9" then puts "You have chosen to leave the program"; exit
  else
    puts "I don't know what you meant, try again"
  end
end

def input_students
  puts "Please enter the names of the students\nTo finish, just hit return twice"
  name = STDIN.gets.chomp

  while !name.empty? do
    puts "Please enter a cohort"
    cohort = STDIN.gets.chomp

    if !cohort.empty?
    @students << {name: name, cohort: cohort}
    puts @students.count > 1 ? "Now we have #{@students.count} students" : "Now we have #{@students.count} student"
    # get another name from the user
    name = STDIN.gets.chomp

    else
      @students << {name: name, cohort: :november}
      puts @students.count > 1 ? "Now we have #{@students.count} students" : "Now we have #{@students.count} student"
      # get another name from the user
     name = STDIN.gets.chomp

    end
  end
  # return the array of students
  @students

  end


def show_students
  print_header
  print_student_list
  print_footer
end

def print_header
  puts "The students of Villains Academy\n-------------"
end

def print_student_list
  # stu = @students.sort_by {|a| a[:cohort].to_sym  }
  @students.each_with_index {|student, index| puts "#{index+1}. #{student[:name]} #{student[:cohort]}"}
  # @students.each {|student| puts "#{student[:name]} (#{student[:cohort]} cohort)"}
end

def print_footer
  puts "Overall, we have #{@students.count} great students".center(50)
end



def save_students
  puts "which file do you want to write to\n 'students.csv' or 'senior_students.csv'"
  filename = gets.chomp
  if filename == "students.csv"
  CSV.open("students.csv", "w") do |file|
  @students.each do |student|
    student_data = [student[:name], student[:cohort]]
  file << student_data
end
end
  elsif filename == "senior_students.csv"
    CSV.open("senior_students.csv", "w") do |file|
    @students.each do |student|
      student_data = [student[:name], student[:cohort]]
    file << student_data
  end
end
else
  CSV.open("students.csv", "w") do |file|
  @students.each do |student|
    student_data = [student[:name], student[:cohort]]
  file << student_data
end
end
end
end



def load_students(filename = "students.csv")
  puts "which file do you want to load from\n 'students.csv' or 'senior_students.csv'"
  filename = gets.chomp
  if filename == "students.csv"
    CSV.foreach("students.csv", "r") do |file|
      name, cohort = file
      @students << {name: name, cohort: cohort.to_sym}
    end
=begin
  file = File.open("students.csv", "r") do |file|
  file.readlines.each do |line| name, cohort = line.chomp.split(',')
    # @students << {name: name, cohort: cohort.to_sym}
    stu = @students.sort_by {|a| a[:cohort].to_sym  }
    stu.each_with_index {|student, index| "#{index+1}. #{student[:name]} #{student[:cohort]}"}
  end
  end
=end
elsif filename == "senior_students.csv"
  CSV.foreach("senior_students.csv", "r") do |file|
    name, cohort = file
    @students << {name: name, cohort: cohort.to_sym}
  end

=begin
  elsif filename == "senior_students.csv"
  file = File.open("senior_students.csv", "r") do |file|
  file.readlines.each do |line| name, cohort = line.chomp.split(',')
    @students << {name: name, cohort: cohort.to_sym}
  end
  end
=end

  end
end


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
=begin
def add_students_to_list(name, cohort = :november)
#   @students << { name: name, cohort: cohort}
  stu = @students.sort_by {|a| a[:cohort].to_sym  }
  stu.each_with_index {|student, index| puts "#{index+1}. #{student[:name]} #{student[:cohort]}"}

  # @students.each {|name, cohort| puts "#{name}, #{cohort}"}
end
=end

try_load_students
interactive_menu
