			/* Users */

CREATE TABLE users (
userID     	INT(8) NOT NULL AUTO_INCREMENT,
userEmail  	VARCHAR(255) NOT NULL,
userName   	VARCHAR(30) NOT NULL,
userPass	VARCHAR(255) NOT NULL,
userDate   	DATETIME NOT NULL,
userLevel  	INT(8) NOT NULL,
UNIQUE INDEX userNameUnique (userName),
PRIMARY KEY (userID)
) TYPE=INNODB;

			/* Categories */

CREATE TABLE categories (
catID          	INT(8) NOT NULL AUTO_INCREMENT,
catName        	VARCHAR(255) NOT NULL,
catDescription	VARCHAR(255) NOT NULL,
UNIQUE INDEX catNameUnique (catName),
PRIMARY KEY (catID)
) TYPE=INNODB;

			/* Topics */

CREATE TABLE topics (
topicID			INT(8) NOT NULL AUTO_INCREMENT,
topicSubject	VARCHAR(255) NOT NULL,
topicDate		DATETIME NOT NULL,
topicCategory	INT(8) NOT NULL,
topicBy		INT(8) NOT NULL,
PRIMARY KEY (topicID)
) TYPE=INNODB;

			/* Posts */

CREATE TABLE posts (
postID		INT(8) NOT NULL AUTO_INCREMENT,
postContent	TEXT NOT NULL,
postDate	DATETIME NOT NULL,
postTopic	INT(8) NOT NULL,
postBy		INT(8) NOT NULL,
PRIMARY KEY (postID)
) TYPE=INNODB;

			/* Linking Topics to categories: */

ALTER TABLE topics ADD FOREIGN KEY(topicCategory) REFERENCES categories(catID) ON DELETE CASCADE ON UPDATE CASCADE;

			/* Links Topics to user who created one: */

ALTER TABLE topics ADD FOREIGN KEY(topicBy) REFERENCES users(userID) ON DELETE RESTRICT ON UPDATE CASCADE;

			/* Links posts to topics: */

ALTER TABLE posts ADD FOREIGN KEY(post_topic) REFERENCES topics(topic_id) ON DELETE CASCADE ON UPDATE CASCADE;

			/* Links post to user: */
			
ALTER TABLE posts ADD FOREIGN KEY(post_by) REFERENCES users(user_id) ON DELETE RESTRICT ON UPDATE CASCADE;
