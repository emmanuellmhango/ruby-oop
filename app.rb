require_relative 'student'
require_relative 'teacher'
require_relative 'book'
require_relative 'rental'

class App
  def initialize
    @books = []
    @people = []
    @rentals = []
  end

  def create_book(title, author)
    puts
    book = Book.new(title, author)
    @books.push(book)
    puts "Book created successfully"
    puts
  end

  def list_books
    puts
    if @books.length < 1
      puts "No books added yet"
    else
      @books.each {|book| puts "Title: \"#{book.title}\", Author: #{book.author}"}
    end
    puts
  end

  def list_people
    puts
    if @people.length < 1
      puts "No people added yet"
    else
      @people.each {|person| puts "[#{person.class}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"}
    end
    puts
  end

  def create_student(classroom, age, name, parent_permission)
    student = Student.new(classroom, age, name: name, parent_permission: parent_permission)
    puts
    @people.push(student)
    puts "Person created successfully"
    puts
  end
  
  def create_teacher(age, name, specialization)
    teacher = Teacher.new(age, specialization, name: name)
    @people.push(teacher)
    puts
    puts "Person created successfully"
    puts
  end

  def list_books_for_rental
    puts
    if @books.length < 1
      puts "No books added"
    else
      @books.each_with_index {|book, index| puts "#{index}) Title: \"#{book.title}\", Author: #{book.author}"}
    end
    puts
  end

  def list_people_to_rent_a_book
    puts
    if @people.length < 1
      puts "No people added"
    else
      @people.each_with_index {|person, index| puts "#{index}) [#{person.class}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"}
    end
    puts
  end

  def rent_a_book(date, person, book)
    puts
    rental = Rental.new(date, @people[person], @books[book])
    @rentals.push(rental)
    puts "Rental created successfully"
    puts
  end

  def list_rentals(id)
    puts
    @rentals.each {|rental| puts "Date: #{rental.date}, Book \"#{rental.book.title}\" by #{rental.book.author}" if rental.person.id == id}
    puts
  end
end

