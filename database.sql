//-----------------------------//
// Создание таблицы user_types //
//-----------------------------//
CREATE TABLE IF NOT EXISTS users_types(
    id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50),
    date_create DATETIME DEFAULT CURRENT_TIMESTAMP
);

//---------------------------------------//
// Создание таблицы notifications_status //
//---------------------------------------//
CREATE TABLE IF NOT EXISTS notifications_status(
    id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50) NOT NULL,
    date_create DATETIME DEFAULT CURRENT_TIMESTAMP
);

//--------------------------------------//
// Создание таблицы notifications_types //
//--------------------------------------//
CREATE TABLE IF NOT EXISTS notifications_types(
    id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50) NOT NULL,
    date_create DATETIME DEFAULT CURRENT_TIMESTAMP
);

//--------------------------------//
// Создание таблицы notifications //
//--------------------------------//
CREATE TABLE IF NOT EXISTS notifications(
    id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    full_descr VARCHAR(100) NOT NULL,
    short_descr VARCHAR(50),
    id_notifications_types INT,
    id_notifications_status INT,
    date_create DATETIME DEFAULT CURRENT_TIMESTAMP,
    date_show DATETIME,
    attempt_count INT DEFAULT 5,
    CONSTRAINT `id_notifications_types_fkey`
        FOREIGN KEY (id_notifications_types) REFERENCES notifications_types(id)
        ON DELETE CASCADE
        ON UPDATE RESTRICT,
    CONSTRAINT `id_notifications_status_fkey`
        FOREIGN KEY (id_notifications_status) REFERENCES notifications_status(id)
        ON DELETE CASCADE
        ON UPDATE RESTRICT
);

//---------------------------------//
// Создание таблицы settings_email //
//---------------------------------//
CREATE TABLE IF NOT EXISTS settings_email(
    id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    login VARCHAR(50),
    passwords VARCHAR(50),
    address VARCHAR(50),
    PORT VARCHAR(10),
    is_tls INT DEFAULT 0
);

//--------------------------------//
// Создание таблицы settings_push //
//--------------------------------//
CREATE TABLE IF NOT EXISTS settings_push(
    id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    url VARCHAR(50)
);

//-----------------------------------------//
// Создание таблицы settings_notifications //
//-----------------------------------------//
CREATE TABLE IF NOT EXISTS settings_notifications(
    id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    id_notifications_types INT,
    CONSTRAINT `settings_id_notifications_types_fkey`
        FOREIGN KEY (id_notifications_types) REFERENCES notifications_types(id)
        ON DELETE CASCADE
        ON UPDATE RESTRICT
);

//---------------------------//
// Создание таблицы settings //
//---------------------------//
CREATE TABLE IF NOT EXISTS settings(
    id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    id_settings_push INT,
    id_settings_email INT,
    id_settings_notifications INT,
    CONSTRAINT `id_settings_push_fkey`
        FOREIGN KEY (id_settings_push) REFERENCES settings_push(id)
        ON DELETE CASCADE
        ON UPDATE RESTRICT,
    CONSTRAINT `id_settings_email_fkey`
        FOREIGN KEY (id_settings_email) REFERENCES settings_email(id)
        ON DELETE CASCADE
        ON UPDATE RESTRICT,
    CONSTRAINT `id_settings_notifications`
        FOREIGN KEY (id_settings_notifications) REFERENCES settings_notifications(id)
        ON DELETE CASCADE
        ON UPDATE RESTRICT
);

//------------------------//
// Создание таблицы users //
//------------------------//
CREATE TABLE IF NOT EXISTS users(
    id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    email VARCHAR(50),
    login VARCHAR(50),
    password VARCHAR(50),
    id_users_types INT,
    id_settings INT,
    CONSTRAINT `id_users_types_fkey`
        FOREIGN KEY (id_users_types) REFERENCES users_types(id)
        ON DELETE CASCADE
        ON UPDATE RESTRICT,
    CONSTRAINT `id_settings_fkey`
        FOREIGN KEY (id_settings) REFERENCES settings(id)
        ON DELETE CASCADE
        ON UPDATE RESTRICT
);

//-------------------------//
// Создание таблицы tokens //
//-------------------------//
CREATE TABLE IF NOT EXISTS tokens(
    id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    token VARCHAR(50) NOT NULL,
    date_create DATETIME DEFAULT CURRENT_TIMESTAMP,
    id_users INT NOT NULL,
    CONSTRAINT `id_users_fkey`
        FOREIGN KEY (id_users) REFERENCES users(id)
        ON DELETE CASCADE
        ON UPDATE RESTRICT
);