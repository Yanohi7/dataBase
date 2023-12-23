CREATE TABLE topics (
    id INT PRIMARY KEY AUTO_INCREMENT,
    topic VARCHAR(15)
);

CREATE TABLE words (
    id INT PRIMARY KEY AUTO_INCREMENT,
    word VARCHAR(25) NOT NULL,
    definition TINYTEXT,
    topic_id INT,
    language_id INT,
    FOREIGN KEY (topic_id) REFERENCES topics(id),
    FOREIGN KEY (language_id) REFERENCES languages(id)
);

CREATE TABLE translations (
    word_id INT,
    word_language_id INT,
    translation_id INT,
    translation_language_id INT,
    FOREIGN KEY (word_id) REFERENCES words(id) ON DELETE CASCADE,
    FOREIGN KEY (word_language_id) REFERENCES languages(id),
    FOREIGN KEY (translation_id) REFERENCES words(id) ON DELETE CASCADE,
    FOREIGN KEY (translation_language_id) REFERENCES languages(id)
);

CREATE TABLE languages (
    id INT PRIMARY KEY AUTO_INCREMENT,
    language VARCHAR(20) NOT NULL UNIQUE
);
