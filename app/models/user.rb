class User < ApplicationRecord

  has_many :blogpages
  has_many :comments

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  validates :username, presence:true, uniqueness: true

  validates :password, presence: true,
                       length: {minimum: 8 },
                       format: {
                         with: /\A(?=.*[a-z])(?=.*[A-Z])(?=.*[\W_]).{8,}\z/,
                         message: "must include at least one lowercase letter, one uppercase letter, and one special character"
                        }

  validates :email, presence: true,
                          format: {
                            with: /\A(?=.*[a-zA-Z])(?=.*[0-9]).{8,}\z/,
                            message: "address in not valid"
                          }

                      



end
