# to add more information about each student we are storing the data in hashes
#students = [
# {name:"Dr. Hannibal Lecter", cohort: :november},
# {name:"Darth Vader", cohort: :november},
# {name:"Nurse Ratched", cohort: :november},
# {name:"Michael Corleone", cohort: :november},
# {name:"Alex DeLarge", cohort: :november},
# {name:"The Wicked Witch of the West", cohort: :november},
# {name:"Terminator", cohort: :november},
# {name:"Freddy Krueger", cohort: :november},
# {name:"The Joker", cohort: :november},
# {name:"Joffrey Baratheon", cohort: :november},
# {name:"Norman Bates", cohort: :november}
#]

DEFAULT_MONTH = "January"
DEFAULT_COUNTRY = :UK


def print_header
    puts "The students of Villains Academy"
    puts "-------------"
end

def print(students)
  if !students.empty?
    students.each_with_index {|student, index|
       puts "#{index +1}. #{student[:name]} (#{student[:cohort]} cohort, #{student[:country]})"}
  end
    # i = 0
    # while i < students.length
    #   puts "#{students[i][:name]} (#{students[i][:cohort]} cohort)"
    #   i +=1
    # end
end

def print_footer(students)
  if students.count = 1
        puts "Overall, we have #{students.count} great students."
  else  puts "Overall, we have #{students.count} great student."
  end
end

def input_students
    puts "To finish, just hit return twice"

        #create empty array
    students = []
        #get the first name
    name = "initialise"
        #while the name is not empty, repeat this code
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
        students << {name: name, cohort: cohort, country: DEFAULT_COUNTRY}
        if students.count = 1
              puts "Now we have #{students.count} students"
        else  puts "Now we have #{students.count} student"
        end
    end
    #return the array of students
    return students.sort_by {|month| month[:cohort] }
end
#now we write the main body of the program, which calls the methods

students = input_students
print_header
print(students)
print_footer(students)
