require_relative 'decorator'

class CapitalizeDecorator < BaseDecorator
  def correct_name
    @person.correct_name.capitalize
  end
end
