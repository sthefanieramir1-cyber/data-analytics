import math 

# ctile information
tiles_per_box = 12
extra_tiles = 1.10  # 10% extra

# room dimensions
room_length = 12
room_width = 18

area = room_length * room_width
boxes_exact = math.ceil(area / tiles_per_box)
boxes_total = math.ceil(area * extra_tiles / tiles_per_box)

print(f"room area:         {area} sq ft")
print(f"boxes needed:      {boxes_exact}")
print(f"boxes with extra tiles: {boxes_total}")