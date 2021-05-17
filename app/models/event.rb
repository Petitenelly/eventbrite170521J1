class Event < ApplicationRecord
    has_many :attendances
    has_many :users, through: :attendances

    validates :start_date,
    presence: true,
    # rajouter start_date doit être après aujourd'hui
    
    validates :duration,
    presence: true,
    #rajouter multiple de 5 et positif
    
    
    validates :title,
    presence: true,
    #rajouter taille entre 5 et 140 caractères

    validates :description,
    presence: true,
    #rajouter taille entre 20 et 1000 caractères

    validates :price,
    presence: true,
    #rajouter taille entre 1 et 1000 euros

    validates :location,
    presence: true,
end
