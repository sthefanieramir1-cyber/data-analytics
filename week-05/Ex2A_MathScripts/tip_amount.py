# tip amount calculation

# structure of a receipt = subtotal, taxes, tip percentage, total amount

subtotal = 100
taxes = 0.07

# tip percentage is 15%
tip_percentage = 0.15

# calculate the tip amount

tip_amount = subtotal * tip_percentage

# calculate the total amount with taxes and tip
total_amount = subtotal + (subtotal * taxes) + tip_amount

print ("The tip on a $", subtotal, "bill is $", tip_amount, "and the total amount is $", total_amount)