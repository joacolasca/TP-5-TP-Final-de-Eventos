import DBConfig from '../configs/db-config.js';
import pkg from 'pg'
const { Client, Pool }  = pkg;

export default class EventRepository {
    getAllAsync = async (limit, offset) => {
        let returnArray = null;
        const client = new Client(DBConfig);
        try {
            await client.connect();
            const sql = `SELECT * FROM public2.event_locations LIMIT $1 OFFSET $2`;
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
            const sql = `SELECT * FROM public2.event_locations WHERE id = $1`;
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

    getByIdLocationAsync = async (limit, offset, id, id_user) => {
        let returnCat = null;
        const client = new Client(DBConfig);
        await client.connect();
        try {
            //const sql = `SELECT * FROM public2.event_locations WHERE id_location = $3 LIMIT $1 OFFSET $2`;
            const sql = `SELECT * FROM public2.event_locations WHERE id_location = $3  AND id_creator_user = $4 LIMIT $1 OFFSET $2 `;
            const values = [limit, offset, id, id_user];
            const result = await client.query(sql, values);
            await client.end();
            returnCat = result.rows;
        } catch (error) {
            console.log(error);
            returnCat = null;
        }
        return returnCat;
    }

}