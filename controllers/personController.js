const db = require('../db');

class PersonController {
    async createPerson(req, res){
        try{
            const {name, surname, patronymic} = req.body;
            const newPerson = await db.query(`
                INSERT INTO person (name, surname, patronymic) 
                values ($1, $2, $3) RETURNING *
                `, [name, surname, patronymic]
            );
            res.json({person: newPerson.rows[0], message: "Сотрудник успешно создан"});
        }catch(e){
            console.log(e);
            res.json({message: 'Не удалось создвать сотрудника'});
        }
    }

    async getPersons(req, res){
        try{
            let {page, sort, direction} = req.query;
            let query = 'SELECT person.* FROM person';
            page = page || 1;
            direction = direction || 'ASC'
            let offset = page * 10 - 10;
            switch (sort){
                case 'fullName':
                    query +=`
                        ORDER BY person.surname ${direction}, 
                        person.name ${direction}, 
                        person.patronymic ${direction}
                    `;
                    break;
                case 'cost':
                    query +=`
                    ORDER BY (
                        SELECT COALESCE(SUM(material.cost), 0) FROM material WHERE user_id = person.id
                    )
                    ${direction}
                    `;
                    break;
                case 'count':
                    query +=`
                    ORDER BY (
                        SELECT COUNT(*) FROM material WHERE user_id = person.id
                    ) 
                    ${direction}
                    `;
                    break;
                default:
                    query +=`
                        ORDER BY ID
                        ${direction}
                    `;
                    break;
            }
            query += 'OFFSET $1 LIMIT 10';
            const persons = await db.query(query, [offset]);
            const pages = await db.query(`
                SELECT COUNT(*) FROM person
            `)
            res.json({
                persons: persons.rows,
                pages: Math.ceil(pages.rows[0].count / 10),
                message: "Сотрудники успешно получены"
            });
        }catch(e){
            console.log(e);
            res.json({message: 'Не удалось получить сотрудников'});
        }
    }

    async getOnePerson(req, res){
        try{
            const id = req.params.id;
            const person = await db.query("SELECT * FROM person where id = $1", [id]);
            res.json({person: person.rows[0], message: "Сотрудник успешно получен"});
        }catch(e){
            console.log(e);
            res.json({message: 'Не удалось получить сотрудника'});
        }
    }

    async updatePerson(req, res){
        try{
            const {id, name, surname, patronymic} = req.body;
            const person = await db.query(`
                UPDATE person set name = $1, surname = $2, patronymic = $3
                where id = $4 RETURNING *
                `, [name, surname, patronymic, id]
            );
            res.json({person: person.rows[0], message: "Данные сотрудника успешно обновленны"});
        }catch(e){
            console.log(e);
            res.json({message: 'Не удалось обновить данные'});
        }
    }

    async deletePerson(req, res){
        try{
            const id = req.params.id;
            const person = await db.query("DELETE FROM person where id = $1", [id]);
            res.json({person: person.rows[0], message: "Сотрудник успешно удален"});
        }catch(e){
            console.log(e);
            res.json({message: 'Не удалось удалить сотрудника'});
        }
    }
}

module.exports = new PersonController();