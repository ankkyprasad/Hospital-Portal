class Receptionist < ApplicationRecord
  has_one :user, as: :userable
end
