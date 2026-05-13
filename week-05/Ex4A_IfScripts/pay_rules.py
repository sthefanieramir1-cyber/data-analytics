# Gross pay calculation

# Set your variables here - change these to test different values
pay_rate = float(input("What it's your pay rate? :"))
hours_worked = float(input("How many hours do you work? :"))

if hours_worked <= 40:
    gross_pay = pay_rate * hours_worked
else:
    regular_pay = pay_rate * 40
    overtime_hours = hours_worked - 40
    overtime_pay = pay_rate * 1.5 * overtime_hours
    gross_pay = regular_pay + overtime_pay

print(f"Pay rate: ${pay_rate:.2f}")
print(f"Hours worked: {hours_worked}")
print(f"Gross pay: ${gross_pay:.2f}")