import random
import cx_Oracle

def hours_to_hh_mm(hours):
    hh = hours // 60
    mm = hours % 60
    return "{:02d}:{:02d}".format(hh, mm)

def read_file_content(file_path):
    try:
        with open(file_path, 'r') as file:
            content = file.readlines()
            return [line.strip() for line in content]
    except FileNotFoundError:
        print(f"File {file_path} not found.")
        return []

# פרטי החיבור למסד הנתונים
username = 'your_username'
password = 'your_password'
dsn = 'your_dsn'  # Data Source Name

# יצירת חיבור למסד הנתונים
connection = cx_Oracle.connect(username, password, dsn)
cursor = connection.cursor()

# קריאת תוכן הקבצים
idtickets = read_file_content("idticket.txt")
licenses = read_file_content("license.txt")

if len(idtickets) == 0 or len(licenses) == 0:
    print("Failed to read tickets or licenses.")
else:
    # שאילתת ה-INSERT לטבלה
    insert_query = """
    INSERT INTO TravelPayment (TravelTime, TravelCost, IDTicket, licenseNumber)
    VALUES (TO_DATE(:1, 'HH24:MI'), :2, :3, :4)
    """

    for _ in range(400):
        # הגרלת שעות ועלות
        travel_hours = random.randint(5 * 60, 12 * 60)
        travel_cost = random.randint(5, 12)
        travel_time = hours_to_hh_mm(travel_hours)

        # הגרלת כרטיס ורישיון אקראיים
        id_ticket = random.choice(idtickets)
        license_number = random.choice(licenses)

        # הכנסת הנתונים לטבלה
        cursor.execute(insert_query, (travel_time, travel_cost, id_ticket, license_number))

    # שמירת השינויים במסד הנתונים
    connection.commit()

    # סגירת ה-cursor והחיבור
    cursor.close()
    connection.close()

    print("Data inserted successfully.")
