class User < ActiveRecord::Base
  validates :first_name, :presence => {:message => 'Vnesi svoje ime.'}
  validates :last_name, :presence => {:message => 'Vnesi svoj priimek.'}
  validates :email, format: { with: /\A[^@\s]+@([^@.\s]+\.)+[^@.\s]+\z/ , message: 'E-mali ni pravilen.'}

  def self.user_exists(email)
    if email != ''
      return false
    elsif User.where(:email => email).count == 0
      return false
    else
      return true
    end
  end

end
