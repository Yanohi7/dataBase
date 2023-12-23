-- Table for word attributes
CREATE TABLE word_attributes (
    id INT PRIMARY KEY AUTO_INCREMENT,
    pos VARCHAR(12),
    level VARCHAR(10),
    topic VARCHAR(15)
);
-- Table for words
CREATE TABLE words (
    id INT PRIMARY KEY AUTO_INCREMENT,
    word VARCHAR(50) NOT NULL,
    definition TEXT,
    attributes_id INT,
    language_id INT,
    FOREIGN KEY (attributes_id) REFERENCES word_attributes(id),
    FOREIGN KEY (language_id) REFERENCES languages(id)
);

-- Table for translations
CREATE TABLE translations (
    word_id INT,
    word_language_id INT,
    translation_id INT,
    translation_language_id INT,
    FOREIGN KEY (word_id) REFERENCES words(id),
    FOREIGN KEY (word_language_id) REFERENCES languages(id),
    FOREIGN KEY (translation_id) REFERENCES words(id),
    FOREIGN KEY (translation_language_id) REFERENCES languages(id)
);


-- Table for synonyms
CREATE TABLE synonyms (
    word_id INT,
    synonym_id INT,
    FOREIGN KEY (word_id) REFERENCES words(id),
    FOREIGN KEY (synonym_id) REFERENCES words(id)
);

-- Table for languages
CREATE TABLE languages (
    id INT PRIMARY KEY AUTO_INCREMENT,
    language VARCHAR(20) NOT NULL UNIQUE
);

