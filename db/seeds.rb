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

a = Account.new(
    account_name: "API Pharma",
    account_phone: "04447444255",
)

a.save!

b = Opportunity.new(
    opportunity_name: "CRM Sale",
    opportunity_account_name: "API Pharma",
    opportunity_owner: "Ben Hanna",
)
b.save!

c = Customer.new(
    customer_first_name: "Tiffany",
    customer_last_name: "Hanna",
    customer_email:  "tiff@hooha.com.au",
    customer_phone: "0447444255",
    customer_address: "1/49 Foam St",
    customer_city: "Melbourne",
    customer_state: "Victoria",
    customer_country: "Australia",
    customer_postcode: "3184",
)
c.save!


for crm_account in 1..100 do
 b = Account.new(
    account_name: "CRM Sale + #{crm_account}",
    account_phone: "12345678",
    user: "2"
)
 b.save!
end
  
