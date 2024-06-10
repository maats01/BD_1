Obs.: Antes de rodar os scripts de seeding, deve ser garantido a existência do banco de dados e a conexão do python com o mySQL.

Ordem das execuções:
    1. TransporteAereo.sql;
    2. trigger01 e trigger02;
    3. Os quatro stored procedures;
    4. seedingScript.py;
    5. seed.sql;
    6. insertingPassengerRelations.py.

Após isso, as querys podem ser feitas para testar o banco de dados.