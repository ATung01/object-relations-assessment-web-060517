class Restaurant
  attr_accessor :name, :customer, :reviews
  # attr_reader :reviews

  @@all = []

  def self.all
    @@all
  end

  def initialize(name)
    @name = name
    @@all << self
  end

  def self.find_by_name(name)
    @@all.find do |rest_object|
      rest_object.name == name
    end
  end

  def add_review(content, first_name, last_name)

    new_review = Review.new(content, self, self.customer)
    self.reviews = new_review
    new_review.customer = Customer.new(first_name, last_name)
    # new_review.restaurant = self
    # @reviews << rev
    # rev.customer = self
  end


end
