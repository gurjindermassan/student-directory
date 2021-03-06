@students = [] #an empty array accessible to all methods
DEFAULT_MONTH = "January"
DEFAULT_COUNTRY = :UK


def print_header
    puts "The students of Villains Academy"
    puts "-------------"
end

def print_students_list
  if !@students.empty?
    @students.each_with_index {|student, index|
       puts "#{index +1}. #{student[:name]} (#{student[:cohort]} cohort)"}
  end

end

def print_footer
  if @students.count == 1
      puts "Overall, we have #{@students.count} great student."
  else
      puts "Overall, we have #{@students.count} great students."
  end
end

def input_students
    puts "To finish, just hit return twice"
    name = "initialise"
    while !name.empty? do
        puts "Please enter the names of the students"
        name = STDIN.gets.chomp.to_sym
        if name.empty?
            break
        end
        puts "Please enter cohort month"
        cohort = STDIN.gets.chomp.to_sym
        if cohort.empty?
            cohort = DEFAULT_MONTH
        end
        add_student(name, cohort)
        if @students.count == 1
            puts "Now we have #{@students.count} student"
        else
            puts "Now we have #{@students.count} students"
        end
    end
end

def interactive_menu
    loop do
        print_menu
        process(STDIN.gets.chomp)
    end
end

 def print_menu
    puts "1. Input the students"
    puts "2. Show the students"
    puts "3. Save the list to students.csv"
    puts "4. Load the list from students.csv"
    puts "9. Exit"
 end

 def show_students
    print_header
    print_students_list
    print_footer
 end

def process(selection)
    case selection
      when "1"
        input_students
      when "2"
        show_students
      when "3"
        save_students
      when "4"
        load_students
      when "9"
        exit #this will cause the program to terminate
      else
        puts "I don't know what you meant, try again"
    end
end

def save_students
    #open file for writing
    file = File.open("students.csv", "w")
    #iterate over the array of students
    @students.each do |student|
      student_data = [student[:name], student[:cohort]]
      csv_line = student_data.join(",")
      file.puts csv_line
    end
    file.close
end

def load_students(filename = "students.csv")
    file = File.open(filename, "r")
    file.readlines.each do |line|
      name, cohort = line.chomp.split(',')
      add_student(name, cohort)
    end
    file.close
end

def try_load_students
  filename = ARGV.first #first argument from the command line
  return if filename.nil? #exit the method if it isn't given
  if File.exists?(filename)
    load_students(filename)
    puts "Loaded #{@students.count} from #{filename}"
  else
    puts "Sorry, #{filename} doesn't exist"
    exit #quit the program
  end
end

def add_student(name, cohort)
  @students << {name: name, cohort: cohort.to_sym}
end

try_load_students
interactive_menu
