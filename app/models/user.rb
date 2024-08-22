class User < ApplicationRecord
  validate :passwords_match, if: -> { password.present? && password_confirmation.present? }

  def authenticate(password)
    if self.password == password
      self
    end
  end
  
  private

  def passwords_match
    if password != password_confirmation
      errors.add(:password_confirmation, "doesn't match Password")
    end
  end

end
