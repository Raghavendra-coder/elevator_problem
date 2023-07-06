from django.test import TestCase

all_destination_floors = [1,3,6,7]
current_floor = 7
try:
    num = sorted(all_destination_floors)[all_destination_floors.index(current_floor)+1:][0]
except Exception as e:
    num = None
print(num)
try:
    num = sorted(all_destination_floors)[:all_destination_floors.index(current_floor)][-1]
except Exception as e:
    print(e)
    if "list index out of range" in str(e):
        pass

print(num)