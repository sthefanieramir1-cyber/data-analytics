# list of favorite foods
favorites = ["tacos", "ramen", "jerk chicken", "injera", "pierogi"]

# print numbered list starting at 1
for index, item in enumerate(favorites, 1):
    if index == 1:
        print(str(index) + ". " + item + " <- top pick!")
    else:
        print(str(index) + ". " + item)

# list in reverse order still numbered 1 through 5
print("\nReversed list:")
for index, item in enumerate(reversed(favorites), 1):
    if index == 1:
        print(str(index) + ". " + item + " <- top pick!")
    else:
        print(str(index) + ". " + item)