@students = []

def print_menu
  puts "Press '1' to type in the students"
  puts "Press '2' to show the students"
  puts "Press '3' to save the list to file"
  puts "Press '4' to load the list from file"
  puts "Press '5' when you want to leave the program"
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
  when "4" then puts "You have chosen to load from the file"; load_students
  when "5" then puts "You have chosen to leave the program"; exit
  else
    puts "I don't know what you meant, try again"
  end
end

def input_students
  puts "Please enter the names of the students\nTo finish, just hit return twice"
  name = STDIN.gets.chomp
  while !name.empty? do
    # add the student hash to the array
    @students << {name: name, cohort: :november}
    puts "Now we have #{@students.count} students"
    # get another name from the user
    name = STDIN.gets.chomp
  end
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
  @students.each {|student| puts "#{student[:name]} (#{student[:cohort]} cohort)"}
end

def print_footer
  puts "Overall, we have #{@students.count} great students"
end

def save_students
  puts "which file do you want to write to\n 'students.csv' or 'senior_students.csv'"
  filename = gets.chomp
  if filename == "students.csv"
  file = File.open("students.csv", "w") do |file|
  @students.each {|student| file.puts ([student[:name], student[:cohort]].join(","))}
end
  elsif filename == "senior_students.csv"
    file = File.open("senior_students.csv", "w") do |file|
    @students.each {|student| file.puts ([student[:name], student[:cohort]].join(","))}
  end
  end
end



def load_students(filename = "students.csv")
  puts "which file do you want to load to\n 'students.csv' or 'senior_students.csv'"
  filename = gets.chomp
  if filename == "students.csv"
  file = File.open("students.csv", "r") do |file|
  file.readlines.each do |line| name, cohort = line.chomp.split(',')
    @students << {name: name, cohort: cohort.to_sym}
  end
  end
  elsif filename == "senior_students.csv"
  file = File.open("senior_students.csv", "r") do |file|
  file.readlines.each do |line| name, cohort = line.chomp.split(',')
    @students << {name: name, cohort: cohort.to_sym}
  end
  end
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

try_load_students
interactive_menu
