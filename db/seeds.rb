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
    email: "ben@hooha.com.au",
    password: "1234",
    password_confirmation: "1234",
    admin: false
)
u2.skip_confirmation!
u2.save!
u2.add_role :gold


# a1 =Account.new(
#     account_name: "The Joinery"
#     account_phone: "047870870"
#     account_address: "27 Hood St, Elsooe"
#     account_postcode:
#     account_city:
#     account_state:
#     account_country:
#     )
# a1.skip_confirmation!
# a1.save!

# c1 = Customer.new(
#     customer_first_name: "Sam"
#     customer_last_name: "Stevens"
#     customer_email: "steve@joinery.com"
#     customer_phone:  "048887772"
#     customer_address:   "27 Hood St, Elsooe"
#     customer_city:  "Melbourne"
#     account_id: "1"
#     )
# c1.skip_confirmation!
# c1.save!

# o1 = Opportunity.new(

#     opportunity_name: "Hooha CRM"
#     opportunity_amount: "500"
#     opportunity_stage: "lead"
#     opportunity_probability: "medium"
#     opportunity_contact_name: "Sam Stevens"
#     opportunity_comments: "CRM for managing incrementsl new business"
# )

# o1.skip_confirmation!
# o1.save!
