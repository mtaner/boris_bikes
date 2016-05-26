class Bike

  def initialize
    @working = true
  end

  def broken
    @working = false
  end

  def fixed
    @working = true
  end

  def working?
    @working
  end
end
