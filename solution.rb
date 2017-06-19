# Please copy/paste all three classes into this file to submit your solution!
class Customer
  attr_accessor :first_name, :last_name, :restaurant, :review


  @@all = []

  def self.all
    @@all
  end

  def initialize(first_name, last_name)
    @first_name = first_name
    @last_name  = last_name
    @@all << self
  end

  def full_name
    "#{first_name} #{last_name}"
  end

  def self.find_by_name(name)
    @@all.find do |customer_object|
      customer_object.full_name == name
    end

  end

  def self.find_all_by_first_name(name)
    @@all.find do |customer_object|
      customer_object.first_name == name
    end

  end

  def self.all_names
    @@all.map do |name|
      name.full_name
    end
  end

  def add_review(restaurant, content)
    new_restaurant = Restaurant.new(restaurant)
    self.restaurant = new_restaurant
    new_restaurant.customer = self

    new_review = Review.new(content, new_restaurant, self)
    self.review = new_review
    new_review.customer = self
  end

end

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
