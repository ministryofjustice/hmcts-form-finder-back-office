module SeedHelper
  def self.find_or_create_user!(attrs)
    user = User.find_by(first_name: attrs[:first_name], last_name: attrs[:last_name], email: attrs[:email].downcase)
    if user.blank?
      User.create!(
        first_name: attrs[:first_name],
        last_name:  attrs[:last_name],
        email:      attrs[:email].downcase,
        password:   ENV.fetch(attrs[:password_env_var]),
        password_confirmation: ENV[attrs[:password_env_var]]
      )
    end
  end
end
