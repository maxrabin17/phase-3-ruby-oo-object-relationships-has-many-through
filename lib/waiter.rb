require 'pry'
class Waiter
    attr_accessor :name, :y_o_e

    @@all = []

    def initialize(name, y_o_e)
        @name = name
        @y_o_e = y_o_e
        @@all << self
    end

    def self.all
        @@all
    end

    def new_meal(customer, total, tip)
        Meal.new(self, customer, total, tip)
    end

    def meals
        Meal.all.select {|meal| meal.waiter == self}
    end

    def best_tipper
        tipped = meals.max {|a, b| a.tip <=> b.tip}
        tipped.customer
        # binding.pry
    end
end