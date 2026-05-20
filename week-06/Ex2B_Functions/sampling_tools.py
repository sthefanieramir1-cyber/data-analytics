import random

products = [
    'Laptop', 'Monitor', 'Keyboard', 'Mouse', 'Webcam',
    'Headset', 'Docking Station', 'USB Hub', 'Desk Lamp', 'Surge Protector'
]

# Pick one random item
product_of_the_day = random.choice(products)
print(f"Product of the Day: {product_of_the_day}")

# Pick 3 items, no duplicates
survey_picks = random.sample(products, 3)
print(f"\nUsability survey products: {survey_picks}")

# Shuffle list in place, then print
random.shuffle(products)
print(f"\nRandomized product order: {products}")

# Random integer between 50 and 300
daily_transactions = random.randint(50, 300)
print(f"\nDaily transaction count: {daily_transactions}") 