# Generated with RailsBricks
# Initial seed file to use with Devise User Model

# Temporary admin account
u = User.new(
    username: "admin",
    email: "admin@example.com",
    password: "1234",
    password_confirmation: "1234",
    admin: true
)
u.skip_confirmation!
u.save!


u2 = User.new(
    username: "hanna",
    email: "hanna@example.com",
    password: "1234",
    password_confirmation: "1234",
    admin: false

)
u2.skip_confirmation!
u2.save!
u2.add_role :gold

# a = Account.new(
#     account_name: "hanna",
#     account_phone: "04447444255",
# )
# a.save!


