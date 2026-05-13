# starting values
balance = 500
goal = 2000
weekly_savings = 150
treat_cost = 20

# loop until goal is met
while balance < goal:
    balance = balance + weekly_savings

    # check if balance is at least 75% of goal
    if balance >= goal * 0.75:
        balance = balance - treat_cost
        print("So close! After treating myself, my balance is up to $" + str(balance))

    # check if balance is more than halfway to goal
    elif balance >= goal * 0.50:
        print("Almost there! This week my balance is up to $" + str(balance))

    # regular update
    else:
        print("This week my balance increased to $" + str(balance))


print("Goal met! My current balance is $" + str(balance))