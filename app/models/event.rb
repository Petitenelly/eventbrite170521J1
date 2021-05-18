class Event < ApplicationRecord
    has_many :attendances
    has_many :users, through: :attendances
    #belongs_to :admin, class_name: 'User'
   
    validates :start_date,
    presence: true,
    numericality: { greater_than_or_equal_to: Time.now.to_i } 
    
    validates :duration,
    presence: true, if: :multiple_5_and_positive?
   
    validates :title,
    presence: true,
    length: { in: 5..140 }

    validates :description,
    presence: true,
    length: { in: 20..1000 }

    validates :price,
    presence: true,
    numericality: {only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 1000}

    validates :location,
    presence: true

    private

  def multiple_5_and_positive?
      return true if self.duration % 5 == 0 && self.duration > 0
        false
  end
end