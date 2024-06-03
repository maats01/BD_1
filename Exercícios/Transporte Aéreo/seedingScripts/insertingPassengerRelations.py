import mysql.connector
import random

conn = mysql.connector.connect(
    host="localhost",
    user="root",
    password="root",
    database="transporte_aereo"
)
cursor = conn.cursor()

def insertPassengerRelations(start, end, seats_start, seats_end, flight):
    # (ID_VOO, ID_ASSENTO, ID_PASSAGEIRO)
    seats = list(range(seats_start, seats_end))
    for p in range(start, end):
        chosenSeat = random.choice(seats)
        seats.remove(chosenSeat)
        cursor.execute("INSERT INTO assentos_passageiros_voos VALUES (%s, %s, %s)", (flight, chosenSeat, p))
    
    if len(seats) > 0:
        for i in seats:
            cursor.execute("INSERT INTO assentos_passageiros_voos(ID_VOO, ID_ASSENTO) VALUES (%s, %s)", (flight, i))

insertPassengerRelations(1, 280, 1, 351, 1)
insertPassengerRelations(180, 420, 1, 397, 2)
insertPassengerRelations(380, 540, 1, 181, 3)
insertPassengerRelations(400, 530, 1, 161, 4)
insertPassengerRelations(1, 121, 1, 121, 5)
insertPassengerRelations(1, 15, 1, 19, 6)

conn.commit()

cursor.close()
conn.close()