contact_infodict = { 
    "name": "John Doe",
    "address": "123 Main St",
    "city": "Anytown",
    "state": "CA",
    "zip": "12345",
    "country":"USA"
}

 # print(f'{contact_infodict["name"]},\n{contact_infodict["address"]}, {contact_infodict["city"]}, \n{contact_infodict["state"]}, {contact_infodict["zip"]}, {contact_infodict["country"]}') 

contact_infodict.pop("name")

# Add first and last name to the dictionary
full_name = {
    "First_name": "John",
    "Last_name": "Doe"
}

# Merge the full name dictionary into the contact information dictionary
contact_infodict.update(full_name)

full_name.update({"honorific": "Dr."})

print(full_name)