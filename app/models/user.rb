class User < ApplicationRecord
	validates :name,presence: true
	validates :email,presence: true,format: {with: /\A\w+@\w+\z/}
end
