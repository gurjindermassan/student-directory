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

def print_header
    puts "The students of Villains Academy"
    puts "-------------"
end

def print(students)
    students.each_with_index {|student, index|
       puts "#{index +1}. #{student[:name]} (#{student[:cohort]} cohort, #{student[:country]})" }
    # i = 0
    # while i < students.length
    #   puts "#{students[i][:name]} (#{students[i][:cohort]} cohort)"
    #   i +=1
    # end
end

def print_footer(students)
    puts "Overall, we have #{students.count} great students."
end

def input_students
    puts "Please enter the names of the students"
    puts "To finish, just hit return twice"
        #create empty array
    students = []
        #get the first name
    name = gets.chomp
        #while the name is not empty, repeat this code
    while !name.empty? do
      #if name[0] == "d" || name[0] == "D"
      if name.length < 12
        students << {name: name, cohort: :november, country: :UK}
        puts "Now we have #{students.count} students"
      end
      #get another name from the user
        name = gets.chomp
    end
    #return the array of students
    students
end
#now we write the main body of the program, which calls the methods

students = input_students
print_header
print(students)
print_footer(students)
