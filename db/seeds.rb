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
    username: "benhanna",
    email: "ben@example.com",
    password: "1234",
    password_confirmation: "1234",
    admin: false
)
u2.skip_confirmation!
u2.save!
u2.add_role :gold

# for crm_account in 1..100 do
#  b = Account.new(
#     account_name: "Account + #{crm_account}",
#     account_phone: "12345678",
#     user_id: "1",
#     account_id: "2",
# )
#  b.save!
# end

a = Account.new(
    account_name: "API Pharma",
    account_phone: "04447444255",
    user_id: "1",
)

a.save!

b = Opportunity.new(
    opportunity_name: "CRM Sale",
    opportunity_account_name: "API Pharma",
    opportunity_owner: "Ben Hanna",
    user_id: "1",
    account_id: "1",
)
b.save!


  
