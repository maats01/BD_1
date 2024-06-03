from faker import Faker
import mysql.connector

fake = Faker('pt_BR')
conn = mysql.connector.connect(
    host="localhost",
    user="root",
    password="root",
    database="transporte_aereo"
)
# A -> 65
cursor = conn.cursor()
fake.name

# inserting data in AEROPORTOS/ESCALAS
for _ in range(10):
    city = fake.city()
    state = fake.state()
    country = fake.country()
    cursor.execute(f"INSERT INTO aeroportos(CIDADE, ESTADO, PAIS) VALUES ('{city}', '{state}', '{country}')")
    cursor.execute(f"INSERT INTO escalas(ID_AEROPORTO) VALUES ({cursor.lastrowid})")

# inserting data in PESSOAS/PILOTOS/PASSAGEIROS
for i in range(600):
    name = fake.name()
    cursor.execute(f"INSERT INTO pessoas (NOME_COMPLETO) VALUES ('{name}')")
    lastPersonId = cursor.lastrowid
    if i % 15 == 0:
        cursor.execute(f"INSERT INTO pilotos (ID_PESSOA) VALUES ({lastPersonId})")
    else:
        cursor.execute(f"INSERT INTO passageiros (ID_PESSOA) VALUES ({lastPersonId})")

# inserting data in ASSENTOS
for i in range(80):
    for j in range(3):
        pos = ["JANELA", "MEIO", "CORREDOR"]
        actualPos = pos[j]
        cursor.execute(f"INSERT INTO assentos (LADO, POSICAO, LINHA) VALUES ('ESQUERDA', '{actualPos}', {i+1})")
        cursor.execute(f"INSERT INTO assentos (LADO, POSICAO, LINHA) VALUES ('DIREITA', '{actualPos}', {i+1})")

conn.commit()

cursor.close()
conn.close()