import DBConfig from '../configs/db-config.js';
import pkg from 'pg'
const { Client, Pool }  = pkg;

export default class UsersRepository {
    getByUsernameAsync = async (entity) => {
        let returnEntity = null;
        const client = new Client(DBConfig);
        await client.connect();
        try {
            const sql = `SELECT * FROM public2.users WHERE public2.users.username LIKE $1 AND public2.users.password LIKE $2`;
            const values = [
                entity?.username  ??'',
                entity?.password  ??''
            ];
            const result = await client.query(sql, values);
            await client.end();
            if (result.rows.length > 0){
                returnEntity = result.rows[0];
            }
            
        } catch (error) {
            console.log(error);
            returnEntity = false;
        }
        return returnEntity;
    }

    createAsync = async (entity) => {
        let returnArray = null;
        const client = new Client(DBConfig);
        try {
            await client.connect();
            const sql = `INSERT INTO public2.users (
                first_name       , 
                last_name   ,
                username    ,
                password   
            ) VALUES ($1,
                $2,
                $3,
                $4)`;
            const values = [
            entity?.first_name    ??'',
            entity?.last_name    ??'',
            entity?.username    ??'',
            entity?.password    ??''
        ]
            const result = await client.query(sql, values);
            await client.end();
            returnArray = result.rowCount;
        } catch (error) {
            console.log(error);
        }
        return returnArray;
    }
}