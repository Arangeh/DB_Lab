import psycopg2

try:
    connection = psycopg2.connect(user = "postgres",
                                  password = "postgres",
                                  host = "127.0.0.1",
                                  port = "5432",
                                  database = "mydatabase")

    cursor = connection.cursor()
    
    create_table_query = '''
    CREATE TABLE mylargetable
(
    sid INTEGER,
    age INTEGER,
    height INTEGER,
    code INTEGER,
    password INTEGER
);

insert into mylargetable (
    sid, age, height, code, password
)
select
    (random()*1000000::integer),
    (random()*1000000::integer),
    (random()*200::integer),
    (random()*200::integer),
    (random()*200::integer)
from generate_series(1, 50000000) s(i);'''
#be jaye 50 hezar 50 million ta dade dorost kardim.
    cursor.execute(create_table_query)
    connection.commit()
    print("Table created successfully in PostgreSQL ")

except (Exception, psycopg2.DatabaseError) as error :
    print ("Error while creating PostgreSQL table", error)
finally:
    #closing database connection.
        if(connection):
            cursor.close()
            connection.close()
            print("PostgreSQL connection is closed")
