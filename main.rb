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

  def register_book
    print 'Title: '
    title = gets.chomp
    print 'Author: '
    author = gets.chomp
    @app.create_book(title, author)
  end

  def menu
    exit_code = true
    while exit_code
      options
      input = gets.chomp
      choice = input.to_i
      case choice
      when 1
        @app.list_books
      when 2
        @app.list_people
      when 3
        register_people
      when 4
        register_book
      when 5
        rent_book
      when 6
        print 'ID of person: '
        id = gets.chomp.to_i
        @app.list_rentals(id)
      when 7
        exit_code = false
        puts
        puts 'See you next time!!'
        puts
      else
        puts 'You chose a wrong option, use options 1 to 7'
      end
    end
  end
end

def main
  main_class = Main.new
  main_class.menu
end

main
