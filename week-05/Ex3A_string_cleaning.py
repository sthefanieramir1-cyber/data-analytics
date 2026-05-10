name_1 = "PRIYA SHARMA"
name_2 = "bob NGUYEN"
name_3 = "LaTonya Williams"
salary_1 = "$82,500"
salary_2 = "$74,000"

# Convert names to lowercase

name_1.lower()
name_2.lower()
name_3.lower()

#lowercase checking
print(name_1.lower())
print(name_2.lower())
print(name_3.lower())

# title case conversion

name_1.title()
name_2.title()
name_3.title()

# title checking
print(name_1.title())
print(name_2.title())
print(name_3.title())

# Replace $ 
salary_1.replace("$", "")
salary_2.replace("$", "")

print(salary_1.replace("$", ""))
print(salary_2.replace("$", ""))

# replace $ and check type 
print(type(salary_1.replace("$", "")))
print(type(salary_2.replace("$", "")))

int_salary_1 = int(salary_1.replace("$", "").replace(",", ""))
int_salary_2 = int(salary_2.replace("$", "").replace(",", ""))

# check new value 
print(int_salary_1)
print(int_salary_2)

# check type after conversion to integer
print(type(int_salary_1))
print(type(int_salary_2))
