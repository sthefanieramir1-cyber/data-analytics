# Description: This script tests various numeric
# conversion techniques
# Author: Sam Q. Newprogrammer

a = " 101.1 " # with spaces around the number  
b = '55' 
c = "402 Stevens" 
d = 'Number 5  ' # number with text before it and spaces after

print(a,type(a)) # prints the original string and its type

print((int(float(a))),type(int(float(a)))) # converts the string to a float first, then to an integer

print (b,type(b)) # prints the original string and its type
print(int(b),type(int(b))) # converts the string to an integer

print(c,type(c)) # prints the original string and its type
converted_c = (int(c[ :4 ])) # splits the string into a list and takes the first element
print(converted_c,type(converted_c)) 

stripped_a = a.strip() # removes spaces from the beginning and end of the string

stripped_d = d.strip() # removes spaces from the and end of the string

int_a = int(float(stripped_a)) # converts the string to a float first, then to an integer
print(int_a,type(int_a))

int_d = int(stripped_d.split()[1]) # splits the string into a list and takes the second element
print(int_d,type(int_d))
