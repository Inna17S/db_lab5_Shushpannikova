import csv
import decimal
import psycopg2


username = 'Inna'
password = '111'
database = 'Inna_DB_5'
host = 'localhost'
port = '5432'
INPUT_CSV_FILE = 'spotifytoptracks0.csv'


query_1 = '''
INSERT INTO  Artists (Artist_ID, artist_name) VALUES (%s, %s)
'''

query_2 = '''
INSERT INTO Genre(GenreID, genre_name) VALUES (%s, %s)
'''

query_3 = '''
INSERT INTO Songs(Song_ID, Artist_ID ,song_name, album, energy, duration_ms) VALUES (%s, %s, %s, %s, %s, %s) RETURNING Artist_ID
'''

query_4 = '''
INSERT INTO Chart(Chart_song_ID, Song_ID, position) VALUES (%s, %s, %s)
'''

query_5 = '''
INSERT INTO SongsGenre(Song_ID, GenreID) VALUES (%s, %s)
'''

query_6 = '''
DELETE FROM  Artists
'''
query_7 = '''
DELETE FROM Genre
'''
query_8 = '''
DELETE FROM Songs
'''
query_9 = '''
DELETE FROM Chart
'''
query_10 = '''
DELETE FROM SongsGenre
'''


with open(INPUT_CSV_FILE, newline='', encoding='utf-8') as csvfile:
    csvreader = csv.reader(csvfile)
    next(csvreader)
    conn = psycopg2.connect(user=username, password=password, database=database, host=host, port=port)
    cursor = conn.cursor()
    cursor.execute(query_10)
    cursor.execute(query_9)
    cursor.execute(query_8)
    cursor.execute(query_7)
    cursor.execute(query_6)


    for row in csvreader:
        Song_ID = row[0]
        print(row)
        album = row[3]
        song_name = row[4]
        energy = row[6]
        duration_ms = row[16]

        cursor.execute(query_3, (Song_ID, None, song_name, album, energy, duration_ms))
        artist_id = cursor.fetchone()[0]


    csvfile.seek(0)
    next(csvreader)

    for row in csvreader:
        Song_ID = row[0]
        chart_song_id = row[5]
        position = row[1]
        cursor.execute(query_4, (chart_song_id, Song_ID, position))

    conn.commit()
    cursor.close()
    conn.close()

