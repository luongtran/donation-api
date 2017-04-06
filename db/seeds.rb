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
CharityLocation.all.each do |location|
  1..6.each do |i|
    location.charities.create(
        name: "Test #{location.id} - #{i}",
        status: true
      )
  end
end


DonationCategory.create(
  cat_name: 'Clothes',
  status: true
)

DonationCategory.create(
  cat_name: 'Toys',
  status: true
)

DonationCategory.create(
  cat_name: 'Furnitures',
  status: true
)

DonationCategory.create(
  cat_name: 'Books',
  status: true
)

DonationCategory.create(
  cat_name: 'Accessories',
  status: true
)

DonationCategory.create(
  cat_name: 'Others',
  status: true
)

PackageCost.create(
  package_size: 'Small',
  cost_per_carton: 5.95
)
PackageCost.create(
  package_size: 'Medium',
  cost_per_carton: 9.56
)

PackageCost.create(
  package_size: 'Large',
  cost_per_carton: 12.78
)
PackageCost.create(
  package_size: 'Extra Large',
  cost_per_carton: 15.96
)


