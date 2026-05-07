#Script:
# Define known values
food_cost = 79.25
tax = 6.54
tip = 12.00
# Calculate the unknown
total_due = food_cost + tax + tip
# Display the results

# print("The total due is " + str(total_due))

# str()  It's a casting function that converts the values to a string 
# This help us in this case by converting the total_due value to a
# string and joining it with the rest of the message.


print("Food cost is " + str(food_cost) + " and tax is " + str(tax))

#print("Tip is " + str(tip))

print("Tip is " + format(tip, ".2f"))


print("Total due is " + str(total_due))