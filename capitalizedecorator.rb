require './decorator.rb'

class CapitalizeDecorator < BaseDecorator
  def initialize(person)
    @person = person
  end

  def correct_name
    @person.correct_name.capitalize()
  end
end