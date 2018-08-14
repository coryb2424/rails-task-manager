class Task < ApplicationRecord
  validates :title, :details, :author, presence: true
  validates :title, uniqueness: true
end
