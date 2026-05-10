# Description: This script tests various numeric
# conversion techniques
# Author: Sam Q. Newprogrammer

a = " 101.1 " # with spaces around the number  
b = '55' #clean number as a string
c = "402 Stevens" # number with text after it
d = 'Number 5  ' # number with text before it and spaces after


stripped_a = a.strip() # removes spaces from the beginning and end of the string
stripped_b = b.strip()
stripped_c = c.strip() 
stripped_d = d.strip() # removes spaces from the and end of the string

int_a = int(float(stripped_a)) # converts the string to a float first, then to an integer
int_b = int(stripped_b) # converts the string to an integer
int_c = int(stripped_c.split()[0]) # splits the string into a list and

int_d = int(stripped_d.split()[1]) # splits the string into a list and takes the second element