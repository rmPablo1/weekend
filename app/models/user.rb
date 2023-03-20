class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :contacts_as_sender, class_name: "Contact", foreign_key: :sender_id
  has_many :contacts_as_receiver, class_name: "Contact", foreign_key: :receiver_id
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
