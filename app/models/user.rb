  class User < ApplicationRecord
  rolify
after_create :assign_default_role

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable,  and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

         has_many :portfolio_items, through: :roles, source: :resource, source_type: :Portfolio

validates_presence_of :name

def first_name
   self.name.split.first
end

def last_name
  self.name.split.last

end

def assign_default_role
  self.add_role(:newuser) if self.roles.blank?
end

  end
