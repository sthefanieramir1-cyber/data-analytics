contact_infodict = { 
    "name": "John Doe",
    "address": "123 Main St",
    "city": "Anytown",
    "state": "CA",
    "zip": "12345",
    "country":"USA"
}

print(f'{contact_infodict["name"]},\n{contact_infodict["address"]}, {contact_infodict["city"]}, \n{contact_infodict["state"]}, {contact_infodict["zip"]}, {contact_infodict["country"]}') 

contact_infodict.pop("name")

