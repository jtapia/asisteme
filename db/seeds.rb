# Crate user
nurse = Nurse.create(email: 'nurse@test.com', first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, password: 'nursetest123', password_confirmation: 'nursetest123', phone: Faker::PhoneNumber.cell_phone, form: '123', bio: Faker::Lorem.sentence)

customer = Customer.create(email: 'client@test.com', first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, password: 'clienttest123', password_confirmation: 'clienttest123', phone: Faker::PhoneNumber.cell_phone)

# Create Address
address_client = Address.create(user_id: customer.id, line_1: Faker::Address.street_address, state: 'COL', city: 'Colima', country: 'MX', zip_code: Faker::Address.zip_code, additional_info: 'Between line_1 and line_2')

address_nurse = Address.create(user_id: nurse.id, line_1: Faker::Address.street_address, state: 'COL', city: 'Colima', country: 'MX', zip_code: Faker::Address.zip_code, additional_info: 'Between line_1 and line_2')

# Create Service
Service.create(customer_id: customer.id, nurse_id: nurse.id, description: Faker::Lorem.sentence, price: Faker::Commerce.price, rating: 3)