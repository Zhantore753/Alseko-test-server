-- DDL commands

-- Таблица с сотрудниками
create TABLE person(
    id SERIAL PRIMARY KEY,
    name VARCHAR(255),
    surname VARCHAR(255),
    patronymic VARCHAR(255)
);

-- Таблица с материальными ценностями
create TABLE material(
    id SERIAL PRIMARY KEY,
    name VARCHAR(255),
    cost INTEGER NOT NULL,
    user_id INTEGER NOT NULL,
    FOREIGN KEY (user_id) REFERENCES person (id)
);

-- Создание сотрудников
INSERT INTO person(name, surname, patronymic) VALUES ('Арина', 'Захарова', 'Юрьевна');
INSERT INTO person(name, surname, patronymic) VALUES ('Александр', 'Попов', 'Николаевич');
INSERT INTO person(name, surname, patronymic) VALUES ('Василиса', 'Лобанова', 'Михайловна');
INSERT INTO person(name, surname, patronymic) VALUES ('Амина', 'Исаева', 'Александровна');
INSERT INTO person(name, surname, patronymic) VALUES ('Светлана', 'Андреева', 'Романовна');
INSERT INTO person(name, surname, patronymic) VALUES ('Алиса', 'Сальникова', 'Кирилловна');
INSERT INTO person(name, surname, patronymic) VALUES ('Мария', 'Егорова', 'Сергеевна');
INSERT INTO person(name, surname, patronymic) VALUES ('Оливия', 'Софронова', 'Софронова');
INSERT INTO person(name, surname, patronymic) VALUES ('Ева', 'Свиридова', 'Ивановна');
INSERT INTO person(name, surname, patronymic) VALUES ('Владислав', 'Соколов', 'Егорович');
INSERT INTO person(name, surname, patronymic) VALUES ('Артём', 'Федотов', 'Арсентьевич');
INSERT INTO person(name, surname, patronymic) VALUES ('Михаил', 'Устинов', 'Алексеевич');
INSERT INTO person(name, surname, patronymic) VALUES ('Владислава', 'Маркина', 'Артёмовна');
INSERT INTO person(name, surname, patronymic) VALUES ('Богдан', 'Дорохов', 'Егорович');
INSERT INTO person(name, surname, patronymic) VALUES ('Дарина', 'Иванова', 'Ярославовна');
INSERT INTO person(name, surname, patronymic) VALUES ('Николай', 'Федотов', 'Иванович');
INSERT INTO person(name, surname, patronymic) VALUES ('Аделина', 'Михайлова', 'Павловна');
INSERT INTO person(name, surname, patronymic) VALUES ('Григорий', 'Сергеев', 'Денисович');
INSERT INTO person(name, surname, patronymic) VALUES ('Екатерина', 'Герасимова', 'Алексеевна');
INSERT INTO person(name, surname, patronymic) VALUES ('Антонина', 'Богданова', 'Дмитриевна');
INSERT INTO person(name, surname, patronymic) VALUES ('Андрей', 'Фролов', 'Ярославович');
INSERT INTO person(name, surname, patronymic) VALUES ('Александр', 'Блинов', 'Маратович');
INSERT INTO person(name, surname, patronymic) VALUES ('Татьяна', 'Захарова', 'Ильинична');
INSERT INTO person(name, surname, patronymic) VALUES ('Александр', 'Макаров', 'Русланович');

-- Создание материальных ценностей
INSERT INTO material(name, cost, user_id) VALUES ('Ноутбук', 64571, 1);
INSERT INTO material(name, cost, user_id) VALUES ('Ноутбук', 85171, 2);
INSERT INTO material(name, cost, user_id) VALUES ('Ноутбук', 10000, 3);
INSERT INTO material(name, cost, user_id) VALUES ('Телефон', 16471, 4);
INSERT INTO material(name, cost, user_id) VALUES ('Ноутбук', 146874, 4);
INSERT INTO material(name, cost, user_id) VALUES ('Мышка', 1111, 4);
INSERT INTO material(name, cost, user_id) VALUES ('Ноутбук', 54784, 5);
INSERT INTO material(name, cost, user_id) VALUES ('Мышка', 1111, 5);
INSERT INTO material(name, cost, user_id) VALUES ('Камера', 99999, 6);
INSERT INTO material(name, cost, user_id) VALUES ('Ноутбук', 64571, 6);
INSERT INTO material(name, cost, user_id) VALUES ('Телефон', 54411, 7);
INSERT INTO material(name, cost, user_id) VALUES ('ПК', 61569, 8);
INSERT INTO material(name, cost, user_id) VALUES ('Мышка', 1571, 8);
INSERT INTO material(name, cost, user_id) VALUES ('Наушники', 9548, 9);
INSERT INTO material(name, cost, user_id) VALUES ('Микрофон', 8000, 10);
INSERT INTO material(name, cost, user_id) VALUES ('Камера', 99999, 11);
INSERT INTO material(name, cost, user_id) VALUES ('Ноутбук', 54369, 12);
INSERT INTO material(name, cost, user_id) VALUES ('Телефон', 49312 , 13);
INSERT INTO material(name, cost, user_id) VALUES ('ПК', 7528, 14);
INSERT INTO material(name, cost, user_id) VALUES ('Мышка', 7853, 14);
INSERT INTO material(name, cost, user_id) VALUES ('Наушники', 1742, 15);
INSERT INTO material(name, cost, user_id) VALUES ('фывфывфыв', 27852, 16);
INSERT INTO material(name, cost, user_id) VALUES ('Машина', 6000000, 18);
INSERT INTO material(name, cost, user_id) VALUES ('Телефон', 17489, 19);
INSERT INTO material(name, cost, user_id) VALUES ('Макбук', 900000, 20);
INSERT INTO material(name, cost, user_id) VALUES ('Клавиатура', 4675, 21);
INSERT INTO material(name, cost, user_id) VALUES ('Ноутбук', 10471, 22);
INSERT INTO material(name, cost, user_id) VALUES ('Ноутбук', 107565, 22);
INSERT INTO material(name, cost, user_id) VALUES ('Ноутбук', 238564, 23);
INSERT INTO material(name, cost, user_id) VALUES ('ПК', 325165, 24);
INSERT INTO material(name, cost, user_id) VALUES ('Ноутбук', 28241, 24);

