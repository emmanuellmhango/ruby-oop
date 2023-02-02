require_relative 'decorator'

class TrimmerDecorator < BaseDecorator
  def correct_name
    @person.correct_name[0..9]
  end
end
