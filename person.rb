class Person
  attr_accessor :name, :age
  attr_reader :id

  def initilize(age, name = 'Unknown', parent_permission: true)
    @id = nil
    @name = name
    @age = age
    @parent_permission = parent_permission
  end

  private def is_of_age?
    return @age > 18
  end

  private def can_use_services?
    if is_of_age? || @parent_permission
      return true 
    else
      return false
    end
  end

end
