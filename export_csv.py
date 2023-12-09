import csv
import psycopg2

username = 'Inna'
password = '111'
database = 'Inna_DB_5'
host = 'localhost'
port = '5432'
output_file = 'Inna_DB_{}.csv'

tables = [
    'Artists',
    'Genre',
    'Songs',
    'Chart',
    'SongsGenre',
]

conn = psycopg2.connect(user=username, password=password, dbname=database, host=host, port=port)

with conn:
    cur = conn.cursor()

    for table_name in tables:
        cur.execute('SELECT * FROM ' + table_name)
        fieldnames = [x[0] for x in cur.description]
        with open(output_file.format(table_name), 'w', newline='', encoding='utf-8') as csvfile:
            writer = csv.writer(csvfile)
            writer.writerow(fieldnames)
            for row in cur:
                writer.writerow(row)
