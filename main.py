import psycopg2
import matplotlib.pyplot as plt

username = 'Inna'
password = '111'
database = 'Inna_DB_4'
host = 'localhost'
port = '5432'

# Запити для візуалізації
query_1 = '''
create view Track_Genre as select Genre.genre_name, COUNT(Genre.genre_name) AS track_count
FROM SongsGenre
JOIN Genre ON SongsGenre.GenreID = Genre.GenreID
GROUP BY Genre.genre_name;
'''

query_2 = '''create view Position_energy as select Chart.position, Songs.energy
FROM Chart
JOIN Songs ON Chart.Song_ID = Songs.Song_ID;
'''

conn = psycopg2.connect(user=username, password=password, dbname=database, host=host, port=port)

with conn:

    cur = conn.cursor()
    cur.execute('DROP VIEW IF EXISTS Track_Genre')
    cur.execute(query_1)
    cur.execute('SELECT * FROM Track_Genre')
    SongsGenre = []
    total = []

    for row in cur:
        SongsGenre.append(row[0])
        total.append(row[1])

    x_range = range(len(SongsGenre))

    # 1 - Стовпчикова діаграма: вивести кількість треків у кожному жанрі

    figure, (bar_ax, pie_ax, graph_ax) = plt.subplots(1, 3)

    bar = bar_ax.bar(x_range, total, color='forestgreen', label='Total', width=0.9)
    bar_ax.bar_label(bar, label_type='center', fontsize=7)
    bar_ax.set_xticks(x_range)

    bar_ax.set_xticklabels(SongsGenre, fontsize='small', rotation=40, ha='right')
    bar_ax.set_xlabel('Жанри')
    bar_ax.set_ylabel('Кількість')
    bar_ax.set_title('Кількість треків у кожному жанрі')


    # 2. - Кругова діаграма: відобразити частку Кількість треків у кожному жанрі

    # Вибірка перших 11 жанрів та об'єднання інших
    sorted_data = sorted(zip(SongsGenre, total), key=lambda x: x[1], reverse=True)
    SongsGenre_sorted, total_sorted = zip(*sorted_data)

    colors = [
        'gold', 'lightcoral', 'lightskyblue', 'lightgreen', 'lightpink', 'orange', 'lightblue', 'lightyellow', 'lightgreen',
        'lightcyan', 'lightcoral', 'lightgoldenrodyellow']

    top_genres = list(SongsGenre_sorted[:11])
    top_percentages = list(total_sorted[:11])

    # Сума відсотків для всіх інших жанрів
    others_percentage = sum(total_sorted[11:])

    # Додаємо "Others" до списку та відповідний відсоток
    top_genres.append('Others')
    top_percentages.append(others_percentage)

    # Кругова діаграма
    pie_ax.pie(
        top_percentages,
        labels=top_genres,
        autopct='%1.1f%%',
        startangle=70,
        colors=colors[:11] + ['lightgray'],
        labeldistance=1.05,  # Відстань для назв
        pctdistance=0.8,
        counterclock=False,
        textprops={'fontsize': 7},
    )
    pie_ax.axis('equal')
    # Додавання заголовку
    pie_ax.set_title('Частка кількості треків у кожному жанрі')


    # 3 ( зробимо для перших 25 значень в чарті )
    cur.execute('DROP VIEW IF EXISTS Position_energy')
    cur.execute(query_2)
    cur.execute('SELECT * FROM Position_energy')
    position = []
    energy = []

    for row in cur:
        position.append(row[0])
        energy.append(row[1])

    mark_color = 'darkgreen'
    graph_ax.plot(position[:25], energy[:25], color=mark_color, marker='o')  # Вибераємо лише перші 25 значень

    for qnt, price in zip(position[:25], energy[:25]):
        graph_ax.annotate(price, xy=(qnt, price), color=mark_color,
                        xytext=(6, 2), textcoords='offset points', fontsize=8)

    graph_ax.set_xlabel('Позиція в чарті')
    graph_ax.set_ylabel('Енергійність')
    graph_ax.set_title('Графік залежності енергійності треку \n від його позиції в чарті')
    graph_ax.set_xticks(range(1, 26,2))  # Встановлюємо позначки від 1 до 25





mng = plt.get_current_fig_manager()
mng.resize(1300, 700)
mng = plt.subplots_adjust(wspace=0.2, left = 0.044, right = 0.964)

plt.show()


# Закрити з'єднання з базою даних
conn.close()