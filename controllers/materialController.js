const db = require('../db');

class materialController {
    async createMaterial(req, res) {
        try{
            const {name, cost, personId} = req.body;
            const newMaterial = await db.query(`
                INSERT INTO material (name, cost, user_id) 
                values ($1, $2, $3) RETURNING *
                `, [name, cost, personId]
            );
            res.json({material: newMaterial.rows[0], message: 'Материальная ценность создана'});
        }catch(e){
            console.log(e);
            res.json({message: 'Не удалось создать материальную ценность'});
        }
    }

    async getMaterialsByPerson(req, res){
        try{
            const id = req.query.id
            const materials = await db.query(`SELECT * FROM material where user_id = $1`, [id]);
            res.json({materials: materials.rows, message: "Материальные ценнсоти получены"});
        }catch(e){
            console.log(e);
            res.json({message: 'Не удалось получить материальные ценности'});
        }
    }

    async updateMaterial(req, res){
        try{
            const {id, name, cost} = req.body;
            const material = await db.query(`
                UPDATE material set name = $1, cost = $2 
                where id = $3 RETURNING *
                `, [name, cost, id]
            );
            res.json({material: material.rows[0], message: "Данные обновленны"});
        }catch(e){
            console.log(e);
            res.json({message: 'Не удалось обновить данные'});
        }
    }

    async deleteMaterial(req, res){
        try{
            const id = req.params.id;
            const material = await db.query("DELETE FROM material where id = $1", [id]);
            res.json({material: material.rows[0], message: "Материльная ценность успешно удалена"});
        }catch(e){
            console.log(e);
            res.json({message: 'Не удалось удалить МЦ'});
        }
    }

    async deleteMaterialByUserId(req, res){
        try{
            const id = req.params.id;
            const materials = await db.query("DELETE FROM material where user_id = $1", [id]);
            res.json({materials: materials.rows[0], message: "Материльные ценности успешно удалены"});
        }catch(e){
            console.log(e);
            res.json({message: 'Не удалось удалить МЦ'});
        }
    }
}

module.exports = new materialController();