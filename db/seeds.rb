# Seeding database

User.create(
  email: 'admin@donation.com',
  fullname: 'Demo Admin',
  role: 'admin',
  password: 123123,
  confirmed_at: Time.now) 

CharityLocation.create(
  location_name: "INTL. HUMANITARIAN CRISIS",
  status: 1
  )

CharityLocation.create(
  location_name: "LOCAL CHARITIES",
  status: 1
  )

CharityLocation.create(
  location_name: "OTHER",
  status: 1
  )


