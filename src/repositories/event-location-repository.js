import DBConfig from '../configs/db-config.js';
import pkg from 'pg'
const { Client, Pool }  = pkg;

export default class UbicacionesEventos{
    getByIdUserCreatorAsync = async (limit, offset, id_user) => {
        let returnLoc = null;
        const client = new Client(DBConfig);
        await client.connect();
        try {
            const sql = `SELECT * FROM public2.event_locations WHERE id_creator_user = $3 LIMIT $1 OFFSET $2 `;
            const values = [limit, offset, id_user];
            const result = await client.query(sql, values);
            await client.end();
            returnLoc = result.rows;
        } catch (error) {
            console.log(error);
            returnLoc = null;
        }
        return returnLoc;
    }    

    getByIdANDUserCreatorAsync = async (id, id_user) => {
        let returnLoc = null;
        const client = new Client(DBConfig);
        await client.connect();
        try {
            const sql = `SELECT * FROM public2.event_locations WHERE id_creator_user = $2 AND id = $1 `;
            const values = [id, id_user];
            const result = await client.query(sql, values);
            await client.end();
            returnLoc = result.rows;
        } catch (error) {
            console.log(error);
            returnLoc = null;
        }
        return returnLoc;
    }    

    createByUserCreatorAsync = async (entity) => {
        let returnLoc = null;
        const client = new Client(DBConfig);
        await client.connect();
        try {
            const sql = `INSERT INTO public2.event_locations(
                        id_location, name, full_address, max_capacity, latitude, longitude, id_creator_user)
                VALUES ($1,
                    $2,
                    $3,
                    $4,
                    $5,
                    $6,
                    $7)`;
            const values = [
            entity?.id_location    ??'',
            entity?.name    ??'',
            entity?.full_address    ??'',
            entity?.max_capacity    ??'',
            entity?.latitude    ??'',
            entity?.longitude    ??'',
            entity?.id_creator_user    ??''];
            const result = await client.query(sql, values);
            await client.end();
            returnLoc = result.rows;
        } catch (error) {
            console.log(error);
            returnLoc = null;
        }
        return returnLoc;
    }

    async findById(id) {
        let returnCat = null;
        const client = new Client(DBConfig);
        await client.connect();
        try {
            const sql = `SELECT * FROM public2.locations WHERE id = $1`;
            const values = [id];
            const result = await client.query(sql, values);
            await client.end();
            returnCat = result.rows.length > 0 ? result.rows[0] : null;
        } catch (error) {
            console.error('Error al buscar la ubicación por ID:', error);
            returnCat = null;
        }
        return returnCat;
    }

    upDateLocationAsync = async (entity) =>{
        let returnArray = null;
        let id = entity.id;
        let id_creator_user = entity.id_creator_user;
        const client = new Client(DBConfig);
        try {
            const previousEntity = await this.getByIdANDUserCreatorAsync(id, id_creator_user)
            if (previousEntity == null) {
            return 0;}
            await client.connect();
            const sql = `UPDATE public2.event_locations SET
                    id_location   = $2,
                    name = $3,
                    full_address = $4,
                    max_capacity = $5,
                    latitude = $6,
                    longitude = $7
                WHERE id = $1 AND id_creator_user = $8
                `;
            const values = [
            entity?.id    ?? previousEntity?.id,
            entity?.id_location    ?? previousEntity?.id_location,
            entity?.name    ??previousEntity?.name,
            entity?.full_address    ??previousEntity?.full_address,
            entity?.max_capacity    ??previousEntity?.max_capacity,
            entity?.latitude    ??previousEntity?.latitude,
            entity?.longitude    ??previousEntity?.longitude,
            entity?.id_creator_user    ??previousEntity?.id_creator_user
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
            const sql = `DELETE FROM event_locations WHERE id = $1`;
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