class User < ApplicationRecord
  def authenticate(password_attempt)
    if self.password == password_attempt
      return self
    else
      return false
    end
  end
end