class Employee
  attr_reader :name, :title, :salary, :boss

  def initialize(name, title, salary, boss)
    @name, @title, @salary, @boss = name, title, salary, boss
    boss.employees << self unless boss.nil?
  end

  def bonus(multiplier)
    multiplier * @salary
  end
end

class Manager < Employee

  attr_accessor :employees

  def initialize(name, title, salary, boss)
    super(name, title, salary, boss)
    @employees = []
  end

  def bonus(multiplier)
    total = 0
    @employees.each do |el|
      if el.class == Employee
        total += el.salary
      else  #if it is Manager
        total += el.salary + el.bonus(1)
      end
    end
    total * multiplier
  end
end
