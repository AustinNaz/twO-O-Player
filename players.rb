class Players
  attr_accessor :name, :lives

  def initialize name, lives
    self.name = name
    self.lives = lives
  end

  def is_still_alive? 
    if self.lives == 0
      return false
    end
  end
end