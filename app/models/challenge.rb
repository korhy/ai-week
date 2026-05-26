class Challenge < ApplicationRecord
  belongs_to :user

  validates :name, presence: true
  validates :module, presence: true
  validates :content, presence: true
  validates :system_prompt, presence: true

  DEFAULT_SYSTEM_PROMPT = <<~PROMPT
    You are a helpful coding assistant for Le Wagon students.
    Your role is to guide the student through the challenge without giving away the solution directly.
    Ask clarifying questions, suggest approaches, and explain concepts clearly.
    If the student is stuck, break the problem into smaller steps and help them think through each one.
    Always encourage the student and remind them that making mistakes is part of learning.
    Respond in the same language as the student.
  PROMPT

  # Destroy associated chats when a challenge is deleted
  has_many :chats, dependent: :destroy
end
