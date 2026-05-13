
# student info
student_name = (input(" What it's your name? :").upper().lower())
student_major = (input("what it's your major? :"))

# check major code and assign name and office
if student_major == "BIOL":
    major_name = "Biology"
    office_location = "Science Bldg, Room 310"
elif student_major == "CSCI":
    major_name = "Computer Science"
    office_location = "Sheppard Hall, Room 314"
elif student_major == "ENG":
    major_name = "English"
    office_location = "Kerr Hall, Room 201"
elif student_major == "HIST":
    major_name = "History"
    office_location = "Kerr Hall, Room 114"
elif student_major == "MKT":
    major_name = "Marketing"
    office_location = "Westly Hall, Room 310"
else:
    # unknown major
    major_name = "Undeclared / Unknown Major"
    office_location = ""

# print student info
print("Student Name:", student_name)
print("Major:", major_name)

# only print office if major is known
if office_location != "":
    print("Department Office:", office_location)