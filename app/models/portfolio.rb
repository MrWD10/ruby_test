class Portfolio < ApplicationRecord
    has_many :technalogies
    resourcify
    has_many :users, through: :roles, class_name: 'User', source: :users
    accepts_nested_attributes_for :technalogies, 
                     reject_if: lambda {|attrs| attrs ['name'].blank?}

    include Placeholder
    validates_presence_of :title, :body, :main_image, :thumb_image_

    def self.angular
        where(subtitle: "Angular")
    end
       
    scope :ruby_on_rails, -> {where(subtitle: "Ruby on Rails")}

    after_initialize :set_defaults

    def set_defaults
        self.main_image ||= Placeholder.image_generator(height:'600',width:'400')
        self.thumb_image_ ||= Placeholder.image_generator(height:'350',width:'200')

    end
end
