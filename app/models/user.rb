class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  validates_presence_of :name

  has_many :posts #, dependent: :destroy || comment this in if we want to delete a user's posts if the user cancels their account (but some websites just keep them around and replace the username with "deleted")
  has_many :comments #, dependent: :destroy || nearly identical logic as the comment in line 7
end
