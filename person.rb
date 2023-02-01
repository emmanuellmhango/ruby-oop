require './nameable.rb'
require './capitalizedecorator.rb'
require './trimmerdecorator.rb'

class Person < Nameable
  attr_accessor :name, :age
  attr_reader :id

  def initialize(age, name = 'Unknown', parent_permission = true)
    @id = rand(1_000_000)
    @name = name
    @age = age
    @parent_permission = parent_permission
  end

  def can_use_services?
    of_age? || @parent_permission
  end

  private

  def of_age?
    @age > 18
  end

  public

  def correct_name
    @name
  end
end
