import json
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


data = {}
with conn:

    cur = conn.cursor()

    for table in tables:
        cur.execute('select * from ' + table)
        rows = []
        fields = [x[0] for x in cur.description]

        for row in cur:
            rows.append(dict(zip(fields, row)))

        data[table] = rows

with open('lab5.data.json', 'w') as outf:
    json.dump(data, outf, default = str)