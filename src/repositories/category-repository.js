import DBConfig from '../configs/db-config.js';
import pkg from 'pg'
const { Client, Pool }  = pkg;

export default class CategorieRepository {
    getAllAsync = async (limit, offset) => {
        let returnArray = null;
        const client = new Client(DBConfig);
        try {
            await client.connect();
            const sql = `SELECT * FROM public2.event_categories LIMIT $1 OFFSET $2`;
            const values = [limit, offset];
            const result = await client.query(sql, values);
            await client.end();
            returnArray = result.rows;
        } catch (error) {
            console.log(error);
        }
        return returnArray;
    }

    getByIdAsync = async (id) => {
        let returnCat = null;
        const client = new Client(DBConfig);
        await client.connect();
        try {
            const sql = `SELECT * FROM public2.event_categories WHERE id = $1`;
            const values = [id];
            const result = await client.query(sql, values);
            await client.end();
            returnCat = result.rows;
        } catch (error) {
            console.log(error);
            returnCat = null;
        }
        return returnCat;
    }

    createAsync = async (entity) => {
        let returnArray = null;
        const client = new Client(DBConfig);
        try {
            await client.connect();
            const sql = `INSERT INTO public2.event_categories (
                name   ,
                display_order
            ) VALUES ($1,
                $2)`;
            const values = [entity?.name    ??'',
            entity?.display_order    ??0
        ]
            const result = await client.query(sql, values);
            await client.end();
            returnArray = result.rowCount;
        } catch (error) {
            console.log(error);
        }
        return returnArray;
    }

    updateAsync = async (entity) => {
        let returnArray = null;
        let id = entity.id;
        const client = new Client(DBConfig);
        try {
            const previousEntity = await this.getByIdAsync(id)
            console.log(previousEntity)
            if (previousEntity == null) { return 0;}

            await client.connect();
            const sql = `UPDATE public2.event_categories SET
                    name   = $2,
                    display_order = $3

                WHERE id = $1
                `;
            const values = [
            entity?.id    ?? previousEntity?.id,
            entity?.name    ?? previousEntity?.name,
            entity?.display_order    ??previousEntity?.display_order
        ]
            const result = await client.query(sql, values);
            await client.end();
            returnArray = result.rowCount;
        } catch (error) {
            console.log(error);
        }
        return returnArray;
    }

    deleteByIdAsync = async (id) => {
        let rowCount = 0;
        const client = new Client(DBConfig);
        await client.connect();
        try {
            const sql = `DELETE FROM public2.event_categories WHERE id = $1`;
            const values = [id];
            const result = await client.query(sql, values);
            await client.end();
            rowCount = result.rowCount;
        } catch (error) {
            console.log(error);
        }
        return rowCount; 
    }
}