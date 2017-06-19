class Customer
  attr_accessor :first_name, :last_name, :restaurant, :review
  # attr_reader :restaurant, :review

  @@all = []

  def self.all
    @@all
  end

  def initialize(first_name, last_name)
    @first_name = first_name
    @last_name  = last_name
    @@all << self
  end

  # def add_restaurant(rest)
  #
  # end
  #
  # def add_review(rev)
  #
  # end

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
