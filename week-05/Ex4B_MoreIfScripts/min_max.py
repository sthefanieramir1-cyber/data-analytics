

a = 15
b = 42
c = 7

# 0Find the smallest 
if a <= b and a <= c:
    smallest = a
elif b <= a and b <= c:
    smallest = b
else:
    smallest = c

# Find the largest 
if a >= b and a >= c:
    largest = a
elif b >= a and b >= c:
    largest = b
else:
    largest = c

print("The three numbers are:", a, b, c)
print("The smallest number is:", smallest)
print("The largest number is:", largest)