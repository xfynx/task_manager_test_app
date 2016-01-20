class User < ActiveRecord::Base
  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :tasks

  def to_param
    "#{id} #{full_name}".parameterize
  end

  def can?(what, what_to_do)
    Ability.new(self).can?(what, what_to_do)
  end
end
