--sqlite3 db/opl_data.db

CREATE TABLE IF NOT EXISTS user_type (
    id INTEGER PRIMARY KEY,
    name TEXT NOT NULL
);

INSERT into user_type VALUES (1, 'super');
INSERT into user_type VALUES (2, 'power');
INSERT into user_type VALUES (3, 'user');

CREATE TABLE IF NOT EXISTS user(
    id INTEGER PRIMARY KEY,
    username TEXT NOT NULL UNIQUE,
    password TEXT NOT NULL,
    user_type_id INTEGER NOT NULL
);

INSERT into user VALUES (1, "meghna","meghna",1);
INSERT into user VALUES (2, "shaurya","shaurya",2);
INSERT into user VALUES (3, "maneesh","maneesh",3);


CREATE TABLE IF NOT EXISTS lesson(
    id INTEGER PRIMARY KEY,
    name TEXT NOT NULL,
    description TEXT,
    youtube_url TEXT,
    git_url TEXT,
    published_timestamp TEXT,
    category_id INTEGER NOT NULL,
    sub_category_id INTEGER NOT NULL,
    author_id INTEGER NOT NULL
);

CREATE TABLE IF NOT EXISTS lesson_sub_category_xref(
    id INTEGER PRIMARY KEY,
    lesson_id INTEGER NOT NULL,
    sub_category_id INTEGER NOT NULL
);

CREATE TABLE IF NOT EXISTS my_stuff(
    id INTEGER PRIMARY KEY,
    lesson_id INTEGER NOT NULL,
    completion_pct INTEGER
);

CREATE TABLE IF NOT EXISTS category(
    id INTEGER PRIMARY KEY,
    name TEXT NOT NULL
);

INSERT into category VALUES (1,"Computer Science");
INSERT into category VALUES (2,"Science");
INSERT into category VALUES (3,"Math");


CREATE TABLE IF NOT EXISTS sub_category (
    id INTEGER PRIMARY KEY,
    name TEXT NOT NULL,
    category_id INTEGER NOT NULL
);

INSERT into sub_category VALUES (1,"C++",1);
INSERT into sub_category VALUES (2,"Java",1);
INSERT into sub_category VALUES (3,"Python",1);
INSERT into sub_category VALUES (4,"Node",1);
INSERT into sub_category VALUES (5,"Angular",1);

INSERT into sub_category VALUES (6,"Biology", 2);
INSERT into sub_category VALUES (7,"Physics", 2);
INSERT into sub_category VALUES (8,"Chemistry", 2);
INSERT into sub_category VALUES (9,"Environmental Science", 2);

INSERT into sub_category VALUES (10,"Algebra", 3);
INSERT into sub_category VALUES (11,"Geometry", 3);
INSERT into sub_category VALUES (12,"Trigonometry", 3);
INSERT into sub_category VALUES (13,"Pre-Calculus", 3);
INSERT into sub_category VALUES (14,"Calculus", 3);


INSERT into lesson VALUES (1,
    "Meiosis by Amoeba Sisters",
    "Join the Amoeba Sisters as they explore the meiosis stages with vocabulary including chromosomes, centromeres, centrioles, spindle fibers, and crossing over. ",
    "VzDMG7ke69g",
    "https://github.com/BiggBird/OPL",
    "1594875503",
    2,
    6,
    2
);

INSERT into lesson VALUES (2,
    "Intro to Cell Signaling by Amoeba Sisters",
    "Explore cell signaling with the Amoeba Sisters! This introductory video describes vocabulary such as ligand and receptor. It includes the stages of cell signaling (reception, transduction, and response) and different types of signaling including autocrine, paracrine, and endocrine. ",
    "-dbRterutHY",
    "https://github.com/BiggBird/OPL",
    "1594875503",
    2,
    6,
    2
);

INSERT into lesson VALUES (3,
    "The Cell Cycle (and cancer) by Amoeba Sisters",
    "Explore the cell cycle with the Amoeba Sisters and an important example of when it is not controlled: cancer. ",
    "QVCjdNxJreE",
    "https://github.com/BiggBird/OPL",
    "1594875503",
    2,
    6,
    2
);

INSERT into lesson VALUES (4,
    "Mitosis: The Amazing Cell Process that Uses Division to Multiply! by Amoeba Sisters",
    "The Amoeba Sisters walk you through the reason for mitosis with mnemonics for prophase, metaphase, anaphase, and telophase. ",
    "f-ldPgEfAHI",
    "https://github.com/BiggBird/OPL",
    "1594875503",
    2,
    6,
    2
);


SELECT * FROM category
INNER JOIN sub_category
ON category.id = sub_category.category_id;


SELECT lesson.id, lesson.name, description, youtube_url, git_url, published_timestamp,
                 category.id, category.name, sub_category.id, sub_category.name,
                 user.username as author_name FROM category
INNER JOIN sub_category
    ON category.id = sub_category.category_id
INNER JOIN lesson
    ON sub_category.id = lesson.sub_category_id
INNER JOIN user
    ON lesson.author_id = user.id;


SELECT lesson.id, lesson.name, lesson.description, lesson.youtube_url, lesson.git_url, lesson.published_timestamp,
                             category.id as category_id, category.name as category_name, sub_category.id as sub_category_id, sub_category.name as sub_category_name,
                             user.username as author_name
                    FROM category
                    INNER JOIN sub_category
                        ON category.id = sub_category.category_id
                    INNER JOIN lesson
                        ON sub_category.id = lesson.sub_category_id
                    INNER JOIN user
                        ON lesson.author_id = user.id
                    WHERE
                        lesson.name like '%explore%' or
                        lesson.description like '%explore%' or
                        category.name like '%explore%' or
                        sub_category.name like '%explore%';


#inserting music into db
INSERT into category VALUES (4,"Music");
INSERT into sub_category VALUES (15,"Trumpet", 4);
INSERT into sub_category VALUES (16,"Trombone", 4);
INSERT into sub_category VALUES (17,"Flute", 4);

#

#NEW VIDEOS!!!!
INSERT into lesson VALUES (5,
    "Python Data Types",
    "Learn Python Data Types using PyCharm! This tutorial is for beginners who have never typed Python code. We will learn how to work with strings, numbers, and booleans. We will also learn how to output the data on the screen using print statements.",
    "lOE-thp4YdE",
    "https://github.com/BiggBird/OPL",
    "1599936853",
    1,
    3,
    2
);

#Update Datatypes Video
UPDATE lesson SET name = "Python Data Types" WHERE id = 5;

#Alter user table by adding name and replace username with email
ALTER TABLE user ADD name TEXT;
ALTER TABLE user ADD display_name TEXT;

#Add users
INSERT INTO user (username, password, user_type_id, name, display_name) VALUES ('tywongny@gmail.com', 'Tyler#04', 3, 'Tyler Wong', 'Tyler');

INSERT INTO user (username, password, user_type_id, name, display_name) VALUES ('nithinparthas@gmail.com', 'Nithin#13', 3, 'Nithin Parthasarathy', 'Nithin');
INSERT INTO user (username, password, user_type_id, name, display_name) VALUES ('ksonowal2468@gmail.com', 'Kunal#07', 3, 'Kunal Sonowal', 'Kunal');
INSERT INTO user (username, password, user_type_id, name, display_name) VALUES ('huangeric50@gmail.com', 'Eric#05', 3, 'Eric Huang', 'Eric');
INSERT INTO user (username, password, user_type_id, name, display_name) VALUES ('eltonmanchester@gmail.com', 'Elton#10', 3, 'Elton Manchester', 'Elton');
INSERT INTO user (username, password, user_type_id, name, display_name) VALUES ('sooon337733@gmail.com', 'Edward#04', 3, 'Edward Chen', 'Edward');
INSERT INTO user (username, password, user_type_id, name, display_name) VALUES ('epicdavidx@gmail.com', 'David#04', 3, 'David Xing', 'David');
INSERT INTO user (username, password, user_type_id, name, display_name) VALUES ('aaronchou2004@gmail.com', 'Aaron#04', 3, 'Aaron Chou', 'Aaron');
INSERT INTO user (username, password, user_type_id, name, display_name) VALUES ('adamkg30@gmail.com', 'Adam#06', 3, 'Adam Godina', 'Adam');

#BIOTECHNOLOGY VIDEOS
INSERT INTO sub_category (name, category_id) VALUES ("Biotechnology", 2);

INSERT into lesson (name,
    description,
    youtube_url,
    git_url,
    published_timestamp,
    category_id,
    sub_category_id,
    author_id)
    VALUES (
    "Introduction to Bioremediation Part 1",
    "Today we will be learning about Biotechnology and Bioremediation with Tyler Wong. The impact of chemical pollutants, genomic programs, microbe usage in Bioremediation, and aerobic and anaerobic biodegradation are all topics covered in this video.",
    "2hIuENBhA94",
    "",
    "1603933727",
    2,
    18,
    4
);


INSERT into lesson (name,
    description,
    youtube_url,
    git_url,
    published_timestamp,
    category_id,
    sub_category_id,
    author_id)
    VALUES (
    "Introduction to Bioremediation Part 2: Deepwater Horizon oil spill",
    "Today we will be learning more about Biotechnology and Bioremediation with Tyler Wong. We will be investigating the case study on the BP Deepwater oil spill in 2010, learning about the impacts it had on the ecosystem, marine life, and clean up crew. We will be specifically discussing containment booms, Corexit dispersant, and oil-eating microbes.",
    "C7WYJJ3zfWI",
    "",
    "1603933914",
    2,
    18,
    4
);

INSERT into lesson (name,
    description,
    youtube_url,
    git_url,
    published_timestamp,
    category_id,
    sub_category_id,
    author_id)
    VALUES (
    "Phytoremediation",
    "What is Phytoremediation and how does it happen on a molecular level? We will explore this topic today with Tyler Wong and discover the pros and cons of using this method.",
    "NsdeyweuIoo",
    "",
    "1603934257",
    2,
    18,
    4
);

INSERT into lesson (name,
    description,
    youtube_url,
    git_url,
    published_timestamp,
    category_id,
    sub_category_id,
    author_id)
    VALUES (
    "Ex Situ and In Situ",
    "Today we will explore the essential understanding of Ex Situ and In Situ with Tyler Wong. We will compare the differences and similarities between both methods.",
    "ajgVNBbGbYg",
    "",
    "1603934415",
    2,
    18,
    4
);

#Networking Videos
INSERT into sub_category (name, category_id) VALUES (
    "Networking",
    1
);

INSERT into lesson (name,
    description,
    youtube_url,
    git_url,
    published_timestamp,
    category_id,
    sub_category_id,
    author_id)
    VALUES (
    "Introduction to OPL",
    "I created this website, Online Peer Learning, which is a video hosting website where students can post and view videos that teach certain subjects, such as videos that teach mathematics, science, music, or computer science concepts. In this video, we will see all of the components of this website and how most websites are set up.",
    "E6kAyqsPbkk",
    "https://github.com/BiggBird/OPL",
    "1603934754",
    1,
    19,
    2
);