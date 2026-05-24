class Challenge < ApplicationRecord
  belongs_to :user

  validates :name, presence: true
  validates :module, presence: true
  validates :content, presence: true
  validates :system_prompt, presence: true
end
