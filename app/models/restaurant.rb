class Restaurant
  attr_reader :name, :address, :locality
  def initialize(name, address, locality)
    @name = name
    @address = address
    @locality = locality
  end
end
