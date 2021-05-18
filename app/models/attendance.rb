class Attendance < ApplicationRecord
    after_create :inscription_email
    
    belongs_to :user
    belongs_to :event
    #validates :user, presence: true
    #validates :event, presence: true
    #validates :stripe_customer_id, presence: true


  
    private
  
    def inscription_email
      UserMailer.event_inscription_email(self.user, self.event).deliver_now
    end

end