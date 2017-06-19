class Review
  attr_accessor :restaurant, :customer
  attr_reader :review

  @@all = []

  def self.all
    @@all
  end

  def initialize(rev, rest, cust)
    @@all << self
    @review = rev
    @restaurant = rest
    @customer = cust
  end


end
