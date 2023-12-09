import psycopg2
import matplotlib.pyplot as plt

username = 'Inna'
password = '111'
database = 'Inna_DB_4'
host = 'localhost'
port = '5432'

query_3 = '''create view Position_duration as SELECT Chart.position, Songs.duration_ms
FROM Chart
JOIN Songs ON Chart.Song_ID = Songs.Song_ID
LIMIT 25;
'''

conn = psycopg2.connect(user=username, password=password, dbname=database, host=host, port=port)

# 4 зробимо графік залежності тривалості треку від його позиції в чарті (для 25 перших пісень в топі)
with conn:
    cur = conn.cursor()

    cur.execute('DROP VIEW IF EXISTS Position_duration')
    cur.execute(query_3)
    cur.execute('SELECT * FROM Position_duration')


    positions = []
    durations = []

    for row in cur:
        positions.append(row[0])
        durations.append(row[1])


    plt.plot(positions, durations, marker='o', linestyle='-', color='b', markersize=4)


    for position, duration in zip(positions, durations):
        plt.annotate(f'{duration}', (position, duration), textcoords="offset points", xytext=(0, 4), ha='center', fontsize=8)

    plt.xlabel('Позиція в чарті')
    plt.ylabel('Тривалість треку (ms)')
    plt.title('Графік залежності тривалості треку від його позиції в чарті')


    plt.xticks(positions, range(1, len(positions) + 1))

    plt.show()
