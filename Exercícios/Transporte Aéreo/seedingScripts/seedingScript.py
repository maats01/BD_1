from faker import Faker
import mysql.connector

fake = Faker('pt_BR')
conn = mysql.connector.connect(
    host="localhost",
    user="root",
    password="root",
    database="transporte_aereo"
)

cursor = conn.cursor()
fake.name

# inserindo tipos de aeronaves
cursor.execute("INSERT INTO tipos_aeronaves(TIPO, DESC_TIPO) VALUES('Jato Comercial', 'Aeronave de passageiros de grande porte')")
cursor.execute("INSERT INTO tipos_aeronaves(TIPO, DESC_TIPO) VALUES('Jato Executivo', 'Aeronave de passageiros de pequeno porte')")
cursor.execute("INSERT INTO tipos_aeronaves(TIPO, DESC_TIPO) VALUES('Jato regional', 'Aeronave de médio alcance')")
cursor.execute("INSERT INTO tipos_aeronaves(TIPO, DESC_TIPO) VALUES('Aeronave de Carga', 'Aeronave utilizada exclusivamente para carga')")
cursor.execute("INSERT INTO tipos_aeronaves(TIPO, DESC_TIPO) VALUES('Turboélice Comercial', 'Aeronave de passageiros com motores turboélice')")

# inserindo registros em fabricantes
cursor.execute("INSERT INTO fabricantes(FABRICANTE) VALUES('Airbus')")
cursor.execute("INSERT INTO fabricantes(FABRICANTE) VALUES('Boeing')")
cursor.execute("INSERT INTO fabricantes(FABRICANTE) VALUES('Gulfstream')")
cursor.execute("INSERT INTO fabricantes(FABRICANTE) VALUES('Cessna')")
cursor.execute("INSERT INTO fabricantes(FABRICANTE) VALUES('ATR')")
cursor.execute("INSERT INTO fabricantes(FABRICANTE) VALUES('Bombardier')")
cursor.execute("INSERT INTO fabricantes(FABRICANTE) VALUES('Antonov')")
cursor.execute("INSERT INTO fabricantes(FABRICANTE) VALUES('Embraer')")

# inserindo registros em aeronaves
cursor.execute("INSERT INTO aeronaves(MODELO, ID_FABRICANTE, ID_TIPO, NUM_ASSENTOS) VALUES('A320', 1, 1, 180)")
cursor.execute("INSERT INTO aeronaves(MODELO, ID_FABRICANTE, ID_TIPO, NUM_ASSENTOS) VALUES('A350', 1, 1, 350)")
cursor.execute("INSERT INTO aeronaves(MODELO, ID_FABRICANTE, ID_TIPO, NUM_ASSENTOS) VALUES('737', 2, 1, 160)")
cursor.execute("INSERT INTO aeronaves(MODELO, ID_FABRICANTE, ID_TIPO, NUM_ASSENTOS) VALUES('777', 2, 1, 396)")
cursor.execute("INSERT INTO aeronaves(MODELO, ID_FABRICANTE, ID_TIPO, NUM_ASSENTOS) VALUES('E195', 8, 3, 120)")
cursor.execute("INSERT INTO aeronaves(MODELO, ID_FABRICANTE, ID_TIPO, NUM_ASSENTOS) VALUES('G650', 3, 2, 18)")
cursor.execute("INSERT INTO aeronaves(MODELO, ID_FABRICANTE, ID_TIPO, NUM_ASSENTOS) VALUES('Citation X', 4, 2, 12)")
cursor.execute("INSERT INTO aeronaves(MODELO, ID_FABRICANTE, ID_TIPO, NUM_ASSENTOS) VALUES('72', 5, 5, 12)")
cursor.execute("INSERT INTO aeronaves(MODELO, ID_FABRICANTE, ID_TIPO, NUM_ASSENTOS) VALUES('Dash 8', 6, 5, 12)")
cursor.execute("INSERT INTO aeronaves(MODELO, ID_FABRICANTE, ID_TIPO, NUM_ASSENTOS) VALUES('747-8F', 2, 4, 0)")
cursor.execute("INSERT INTO aeronaves(MODELO, ID_FABRICANTE, ID_TIPO, NUM_ASSENTOS) VALUES('An-124', 7, 4, 0)")

# inserindo registros em pessoas/pilotos/passageiros
for i in range(600):
    name = fake.name()
    cursor.execute(f"INSERT INTO pessoas (NOME_COMPLETO) VALUES ('{name}')")
    lastPersonId = cursor.lastrowid
    if i % 15 == 0:
        cursor.execute(f"INSERT INTO pilotos (ID_PESSOA) VALUES ({lastPersonId})")
    else:
        cursor.execute(f"INSERT INTO passageiros (ID_PESSOA) VALUES ({lastPersonId})")

# inserindo registros em assentos
for i in range(80):
    for j in range(3):
        pos = ["JANELA", "MEIO", "CORREDOR"]
        actualPos = pos[j]
        cursor.execute(f"INSERT INTO assentos (LADO, POSICAO, LINHA) VALUES ('ESQUERDA', '{actualPos}', {i+1})")
        cursor.execute(f"INSERT INTO assentos (LADO, POSICAO, LINHA) VALUES ('DIREITA', '{actualPos}', {i+1})")

conn.commit()

cursor.close()
conn.close()