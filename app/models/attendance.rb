class Attendance < ApplicationRecord
    t.belongs_to :user, index: true
    t.belongs_to :event, index: true
end
