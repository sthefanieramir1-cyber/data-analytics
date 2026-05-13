hour = (float(input("What time it's right now?:")))

if hour >= 23 or hour < 4:
    print("Good evening!")
    print("What are you doing up so late??")
elif hour < 10:
    print("Good morning!")
elif hour < 17:
    print("Good day!")
else:
    print("Good evening!")
