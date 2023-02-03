require_relative 'app'
require_relative 'student'
require_relative 'teacher'

class Register
  def initialize
    @app = App.new
  end
  
  def register_people
    print 'Do you want to create a student (1) or a Teacher (2)? [Input the number]:'
    selection = gets.chomp
    num = selection.to_i
    case num
    when 1
      print 'Age: '
      age = gets.chomp.to_i
      print 'Name: '
      name = gets.chomp
      print 'Has parent permission? [Y/N]: '
      parent_permission = gets.chomp.downcase == 'y'
      print 'Classroom: '
      classroom = gets.chomp
      @app.create_student(classroom, age, name, parent_permission)
    when 2
      print 'Age: '
      age = gets.chomp.to_i
      print 'Name: '
      name = gets.chomp
      print 'Specialization: '
      specialization = gets.chomp
      @app.create_teacher(age, name, specialization)
    else
      puts 'Wrong Input.'
    end
  end
end