require_relative 'app'

class Main
  def initialize
    @app = App.new
  end

  def options
    puts 'Please choose an option by entering a number'
    puts '1 - List all books'
    puts '2 - List all people'
    puts '3 - Create a person'
    puts '4 - Create a book'
    puts '5 - Create a rental'
    puts '6 - List all rentals for a given person id'
    puts '7 - Exit'
    print 'Option: '
  end

  def rent_book
    puts 'Select a book from the following list by number'
    @app.list_books_for_rental
    print 'Book number: '
    book_number = gets.chomp.to_i
    puts
    puts 'Select a person from the following list by number (not ID)'
    @app.list_people_to_rent_a_book
    print 'Person number: '
    person_number = gets.chomp.to_i
    puts
    print 'Date: '
    date = gets.chomp
    @app.rent_a_book(date, person_number, book_number)
  end

  def regstudent
    print 'Age: '
    age = gets.chomp.to_i
    print 'Name: '
    name = gets.chomp
    print 'Has parent permission? [Y/N]: '
    parent_permission = gets.chomp.downcase == 'y'
    print 'Classroom: '
    classroom = gets.chomp
    @app.create_student(classroom, age, name, parent_permission)
  end

  def regteacher
    print 'Age: '
    age = gets.chomp.to_i
    print 'Name: '
    name = gets.chomp
    print 'Specialization: '
    specialization = gets.chomp
    @app.create_teacher(age, name, specialization)
  end

  def reg_people
    print 'Do you want to create a student (1) or a Teacher (2)? [Input the number]:'
    selection = gets.chomp
    num = selection.to_i
    case num
    when 1
      regstudent
    when 2
      regteacher
    else
      puts 'Wrong Input.'
    end
  end

  def reg_book
    print 'Title: '
    title = gets.chomp
    print 'Author: '
    author = gets.chomp
    @app.create_book(title, author)
  end

  def getrentals
    print 'ID of person: '
    id = gets.chomp.to_i
    @app.list_rentals(id)
  end

  def choiceoptions(choice)
    case choice
    when 1
      @app.list_books
    when 2
      @app.list_people
    when 3
      reg_people
    when 4
      reg_book
    when 5
      rent_book
    when 6
      getrentals
    else
      puts 'You chose a wrong option, use options 1 to 7'
    end
  end

  def menu
    loop do
      options
      choice = gets.chomp.to_i
      if choice == 7
        puts 'Thank you for using the app!'
        puts
        break
      else
        choiceoptions(choice)
      end
    end
  end
end

def main
  main_class = Main.new
  main_class.menu
end

main
