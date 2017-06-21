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
       puts "#{index +1}. #{student[:name]} (#{student[:cohort]} cohort, #{student[:country]})"}
  end

end

def print_footer
  if @students.count == 1
        puts "Overall, we have #{@students.count} great students."
  else  puts "Overall, we have #{@students.count} great student."
  end
end

def input_students
    puts "To finish, just hit return twice"
    name = "initialise"
    while !name.empty? do
        puts "Please enter the names of the students"
        name = gets.delete!("\n").to_sym
        if name.empty?
            break
        end
        puts "Please enter cohort month"
        cohort = gets.chomp.to_sym
        if cohort.empty?
            cohort = DEFAULT_MONTH
        end
        @students << {name: name, cohort: cohort, country: DEFAULT_COUNTRY}
        if @students.count == 1
              puts "Now we have #{@students.count} students"
        else  puts "Now we have #{@students.count} student"
        end
    end
end

def interactive_menu
  loop do
    print_menu
    process(gets.chomp)
    end
  end

  def print_menu
    puts "1. Input the students"
    puts "2. Show the students"
    puts "3. Save the list to students.csv"
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


interactive_menu
