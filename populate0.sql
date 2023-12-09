
INSERT INTO Artists (Artist_ID, artist_name) VALUES
(101, 'The Weeknd'),
(202, 'Tones And I'),
(303, 'Roddy Ricch'),
(404, 'SAINt JHN'),
(505, 'Dua Lipa'),
(606, 'DaBaby'),
(707, 'Harry Styles'),
(808, 'Powfu'),
(909, 'Trevor Daniel'),
(1010, 'Lewis Capaldi'),
(1111, 'KAROL G'),
(1212, 'Arizona Zervas'),
(1313, 'Post Malone'),
(1414, 'Lil Mosey'),
(1515, 'Justin Bieber'),
(1616, 'Drake'),
(1717, 'Lewis Capaldi'),
(1818, 'Doja Cat'),
(1919, 'Maroon 5'),
(2020, 'Future'),
(2121, 'Jawsh 685'),
(2222, 'Harry Styles'),
(2323, 'Topic'),
(2424, '24kGoldn'),
(2525, 'Billie Eilish'),
(2626, 'Shawn Mendes'),
(2828, 'Cardi B'),
(2929, 'Surfaces'),
(3030, 'Eminem'),
(3131, 'Justin Bieber'),
(3333, 'BTS'),
(3434, 'BENEE'),
(3535, 'Surf Mesa'),
(3636, 'Lady Gaga'),
(3737, 'Travis Scott'),
(3838, 'Post Malone'),
(3939, 'Maluma'),
(4040, 'Regard'),
(4141, 'Travis Scott'),
(4242, 'Black Eyed Peas'),
(4343, 'THE SCOTTS'),
(4444, 'Bad Bunny'),
(4646, 'Juice WRLD'),
(4747, 'Ariana Grande'),
(4848, 'JP Saxe'),
(5050, 'Travis Scott');


INSERT INTO Genre (GenreID, genre_name) VALUES
(102, 'Soul'),
(103, 'Alternative'),
(104, 'Indie'),
(105, 'Hip-Hop'),
(106, 'Rap'),
(107, 'Dance'),
(108, 'Electronic'),
(109, 'Nu-disco'),
(110, 'Pop'),
(111, 'Electro-pop'),
(112, 'Dance-pop'),
(113, 'Disco-pop'),
(114, 'Disco'),
(115, 'Trap'),
(116, 'Dreampop'),
(117, 'Reggaeton'),
(118, 'Chamber'),
(119, 'R&B');


UPDATE Songs
SET Artist_ID = (
    CASE
        WHEN Song_ID = 'R1B01' THEN 101
        WHEN Song_ID = 'R1B02' THEN 202
        WHEN Song_ID = 'R1B03' THEN 303
        WHEN Song_ID = 'R1B04' THEN 404
        WHEN Song_ID = 'R1B05' THEN 505
        WHEN Song_ID = 'R1B06' THEN 606
        WHEN Song_ID = 'R1B07' THEN 707
        WHEN Song_ID = 'R1B08' THEN 808
        WHEN Song_ID = 'R1B09' THEN 909
        WHEN Song_ID = 'R1B10' THEN 1010
        WHEN Song_ID = 'R1B11' THEN 1111
        WHEN Song_ID = 'R1B12' THEN 1212
        WHEN Song_ID = 'R1B13' THEN 1313
        WHEN Song_ID = 'R1B14' THEN 1414
        WHEN Song_ID = 'R1B15' THEN 1515
        WHEN Song_ID = 'R1B16' THEN 1616
        WHEN Song_ID = 'R1B17' THEN 1717
        WHEN Song_ID = 'R1B18' THEN 1818
        WHEN Song_ID = 'R1B19' THEN 1919
        WHEN Song_ID = 'R1B20' THEN 2020
        WHEN Song_ID = 'R1B21' THEN 2121
        WHEN Song_ID = 'R1B22' THEN 2222
        WHEN Song_ID = 'R1B23' THEN 2323
        WHEN Song_ID = 'R1B24' THEN 2424
        WHEN Song_ID = 'R1B25' THEN 2525
        WHEN Song_ID = 'R1B26' THEN 2626
        WHEN Song_ID = 'R1B27' THEN 2525
        WHEN Song_ID = 'R1B28' THEN 2828
        WHEN Song_ID = 'R1B29' THEN 2929
        WHEN Song_ID = 'R1B30' THEN 3030
        WHEN Song_ID = 'R1B31' THEN 3131
        WHEN Song_ID = 'R1B32' THEN 505
        WHEN Song_ID = 'R1B33' THEN 3333
        WHEN Song_ID = 'R1B34' THEN 3434
        WHEN Song_ID = 'R1B35' THEN 3535
        WHEN Song_ID = 'R1B36' THEN 3636
        WHEN Song_ID = 'R1B37' THEN 3737
        WHEN Song_ID = 'R1B38' THEN 3838
        WHEN Song_ID = 'R1B39' THEN 3939
        WHEN Song_ID = 'R1B40' THEN 4040
        WHEN Song_ID = 'R1B41' THEN 4141
        WHEN Song_ID = 'R1B42' THEN 4242
        WHEN Song_ID = 'R1B43' THEN 4343
        WHEN Song_ID = 'R1B44' THEN 4444
        WHEN Song_ID = 'R1B45' THEN 2525
        WHEN Song_ID = 'R1B46' THEN 4646
        WHEN Song_ID = 'R1B47' THEN 4747
        WHEN Song_ID = 'R1B48' THEN 4848
        WHEN Song_ID = 'R1B49' THEN 505
        WHEN Song_ID = 'R1B50' THEN 5050
    END
)
WHERE Song_ID IN (
    'R1B01', 'R1B02', 'R1B03', 'R1B04', 'R1B05',
    'R1B06', 'R1B07', 'R1B08', 'R1B09', 'R1B10',
    'R1B11', 'R1B12', 'R1B13', 'R1B14', 'R1B15',
    'R1B16', 'R1B17', 'R1B18', 'R1B19', 'R1B20',
    'R1B21', 'R1B22', 'R1B23', 'R1B24', 'R1B25',
    'R1B26', 'R1B27', 'R1B28', 'R1B29', 'R1B30',
    'R1B31', 'R1B32', 'R1B33', 'R1B34', 'R1B35',
    'R1B36', 'R1B37', 'R1B38', 'R1B39', 'R1B40',
    'R1B41', 'R1B42', 'R1B43', 'R1B44', 'R1B45',
    'R1B46', 'R1B47', 'R1B48', 'R1B49', 'R1B50'
);


INSERT INTO SongsGenre (Song_ID, GenreID) VALUES
('R1B01', 119),
('R1B01', 102),
('R1B02', 103),
('R1B03', 105),
('R1B03', 106),
('R1B04', 107),
('R1B05', 109),
('R1B06', 105),
('R1B07', 110),
('R1B02', 104),
('R1B05', 106),
('R1B04', 108),
('R1B08', 105),
('R1B08', 106),
('R1B09', 119),
('R1B09', 105),
('R1B09', 103),
('R1B10', 103),
('R1B10', 104),
('R1B11', 110),
('R1B12', 106),
('R1B12', 105),
('R1B13', 110),
('R1B13', 116),
('R1B14', 105),
('R1B14', 106),
('R1B15', 110),
('R1B16', 105),
('R1B16', 106),
('R1B17', 103),
('R1B17', 104),
('R1B18', 119),
('R1B18', 102),
('R1B19', 110),
('R1B20', 105),
('R1B20', 106),
('R1B21', 105),
('R1B21', 106),
('R1B22', 110),
('R1B23', 107),
('R1B23', 108),
('R1B24', 110),
('R1B24', 106),
('R1B25', 110),
('R1B26', 110),
('R1B27', 111),
('R1B28', 106),
('R1B28', 105),
('R1B29', 111),
('R1B30', 105),
('R1B30', 106),
('R1B31', 110),
('R1B32', 112),
('R1B32', 114),
('R1B33', 113),
('R1B34', 103),
('R1B34', 104),
('R1B35', 107),
('R1B35', 108),
('R1B36', 110),
('R1B37', 106),
('R1B37', 105),
('R1B38', 116),
('R1B38', 105),
('R1B38', 119),
('R1B39', 110),
('R1B40', 107),
('R1B40', 108),
('R1B41', 105),
('R1B41', 106),
('R1B42', 110),
('R1B43', 105),
('R1B43', 106),
('R1B44', 103),
('R1B44', 117),
('R1B45', 118),
('R1B45', 110),
('R1B46', 110),
('R1B47', 110),
('R1B48', 110),
('R1B49', 107),
('R1B49', 108),
('R1B50', 106),
('R1B50', 105);



