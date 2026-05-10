import math

passengers = int(input("How many passengers do you need to transport? "))

van_capacity = 15
van_cost_perday = 250

amount_of_vans_needed = math.ceil(passengers / van_capacity)

cost_to_rent_vans = amount_of_vans_needed * van_cost_perday

cost_per_passenger = cost_to_rent_vans / passengers

print(f"You will need to rent {amount_of_vans_needed} vans to transport {passengers} passengers.")
print(f"The cost to rent the vans per day will be ${cost_to_rent_vans:.2f}.")
print(f"The cost per passenger will be ${cost_per_passenger:.2f} each.")

# We have an extra .12 dollars per passenger because we had to round up the number
# of vans cost divid by the number of passengers