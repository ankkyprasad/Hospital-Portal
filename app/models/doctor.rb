class Doctor < ApplicationRecord
  has_one :user, as: :userable
  has_many :appointments

  validates :experience, comparison: { greater_than: 0 }, allow_blank: true
  validates :phone_no, length: { is: 10 }, allow_blank: true
  validates :phone_no, format: { with: /\A\d+\z/, message: 'only allows digits' }, allow_blank: true
end
