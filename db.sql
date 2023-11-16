CREATE TABLE `words` (
  `id` int PRIMARY KEY,
  `word` varchar(255),
  `definition` tinytext,
  `attributes_id` int,
  `language_id` int
);

CREATE TABLE `synonyms` (
  `word_id` int,
  `synonym_id` int
);

CREATE TABLE `languages` (
  `id` int,
  `language` varchar(20)
);

CREATE TABLE `word_attributes` (
  `id` int,
  `pos` varchar(12),
  `level` varchar(10),
  `topic` varhcar(15)
);

CREATE TABLE `translations` (
  `word_id` int,
  `word_language_id` int,
  `translation_id` int,
  `translation_language_id` int
);

ALTER TABLE `translations` ADD FOREIGN KEY (`word_id`) REFERENCES `words` (`id`);

ALTER TABLE `languages` ADD FOREIGN KEY (`id`) REFERENCES `words` (`language_id`);

ALTER TABLE `translations` ADD FOREIGN KEY (`word_language_id`) REFERENCES `languages` (`id`);

ALTER TABLE `translations` ADD FOREIGN KEY (`translation_id`) REFERENCES `words` (`id`);

ALTER TABLE `translations` ADD FOREIGN KEY (`translation_language_id`) REFERENCES `languages` (`id`);

ALTER TABLE `synonyms` ADD FOREIGN KEY (`word_id`) REFERENCES `words` (`id`);

ALTER TABLE `synonyms` ADD FOREIGN KEY (`synonym_id`) REFERENCES `words` (`id`);

ALTER TABLE `words` ADD FOREIGN KEY (`attributes_id`) REFERENCES `word_attributes` (`id`);
