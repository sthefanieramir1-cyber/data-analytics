import math

def distance(x1, y1, x2, y2):
    return math.dist((x1, y1), (x2, y2))

print(format(distance(2, 9, 3, 4), ".2f"))