 # How long will it take a savings account worth X to double in value based on an interest 
 # rate of IR?

    # Rule 72 will give an estimate on how long a investment will douible 
    # in a fixed annual interest rate 


# formula: T = 72 ÷ R, where T is the number of years and R
# is the annual interest rate.


savings_account = 1500
interest = 9 

# Number of years to double the investment
years_to_double = 72 / interest
doubled_balance = savings_account * 2

print("Your current saving account balance is: $", savings_account)
print("At a", interest, "% interest rate, your savings account will be worth $", 
      format(doubled_balance, ".2f"), "in", format(years_to_double, ".1f"), "years")