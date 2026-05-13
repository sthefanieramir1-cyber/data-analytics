
# Pay Calculation 
pay_rate = float(input("What is your pay rate?: $"))
hours_worked = float(input("How many hours did you work this week?: "))

if hours_worked <= 40:
    gross_pay = pay_rate * hours_worked
else:
    regular_pay = pay_rate * 40
    overtime_hours = hours_worked - 40
    overtime_pay = pay_rate * 1.5 * overtime_hours
    gross_pay = regular_pay + overtime_pay

annual_gross = gross_pay * 52

# Filing Status
filing_status = input("What is your filing status? (single/joint): ").strip().lower()

# Single 
if filing_status == "single":
    if annual_gross <= 11000:
        tax_rate = 0.10
    elif annual_gross <= 44725:
        tax_rate = 0.12
    elif annual_gross <= 95375:
        tax_rate = 0.22
    elif annual_gross <= 201050:
        tax_rate = 0.24
    elif annual_gross <= 383900:
        tax_rate = 0.32
    elif annual_gross <= 578125:
        tax_rate = 0.35
    else:
        tax_rate = 0.37

# Joint 
elif filing_status == "joint":
    if annual_gross <= 22000:
        tax_rate = 0.10
    elif annual_gross <= 89450:
        tax_rate = 0.12
    elif annual_gross <= 190750:
        tax_rate = 0.22
    elif annual_gross <= 364200:
        tax_rate = 0.24
    elif annual_gross <= 462500:
        tax_rate = 0.32
    elif annual_gross <= 693750:
        tax_rate = 0.35
    else:
        tax_rate = 0.37

else:
    print("Invalid filing status. Please enter 'single' or 'joint'.")
    exit()

# Tax & Net Pay Calculation
weekly_tax = round(gross_pay * tax_rate, 2)
net_pay = round(gross_pay - weekly_tax, 2)
gross_pay = round(gross_pay, 2)
annual_gross = round(annual_gross, 2)


print("\nYou worked", hours_worked, "hours this period.")
print("Because you earn $" + str(pay_rate) + " per hour, your gross weekly pay is $" + str(gross_pay))
print("Your annual gross pay is $" + str(annual_gross))
print("Your filing status is", filing_status)
print("Your tax rate is", int(tax_rate * 100), "%")
print("Your tax withholding for the week is $" + str(weekly_tax))
print("Your net pay is $" + str(net_pay))