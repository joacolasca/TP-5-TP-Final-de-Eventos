import {Router} from 'express';
import LocationsService from '../services/event-location-service.js'
import AutenticationMddleware from '../middlewares/autentication-middleware.js';

import { parse } from 'dotenv';
import jwt from 'jsonwebtoken';
const router = Router();
const svc = new LocationsService();

const claveSecreta = "teclado5390"

router.get('',  AutenticationMddleware.AuthMiddleware, async (req, res) => {
    let  limit = req.query.limit;
    let offset = req.query.offset;
    let id_user = req.id_user;
    let respuesta;
    if(isNaN(offset))
    {
        offset = 0;
    }

    if(isNaN(limit))
    {
        limit = 99999999;
       
    }
        const returnArray = await svc.getByIdUserCreatorAsync(limit, offset, id_user);
        if (returnArray != null){
            respuesta = res.status(200).json(returnArray);
        } else {
            respuesta = res.status(401).send(`Unauthorized.`);
        }
        return respuesta;
});

router.get('/:id',  AutenticationMddleware.AuthMiddleware, async (req, res) => {
    let  id = req.params.id;
    let id_user = req.id_user;
    let respuesta;
    const returnArray = await svc.getByIdANDUserCreatorAsync(id, id_user);
    if (returnArray != null){
        respuesta = res.status(200).json(returnArray);
    } else {
        respuesta = res.status(401).send(`Unauthorized.`);
    }
    return respuesta;
});

router.post('', AutenticationMddleware.AuthMiddleware, async (req, res) => {
    try {
        let respuesta;
        let id_creator_user = req.id_user;
        let newUbi = req.body;
        newUbi.id_creator_user = id_creator_user;
        if (!newUbi.name || newUbi.name.length < 3 || !newUbi.full_address || newUbi.full_address.length < 3) {
            return res.status(400).send('Los campos name y full_address son obligatorios y deben tener al menos 3 caracteres.');
        }
        if (newUbi.max_capacity <= 0) {
            return res.status(400).send('El campo max_capacity debe ser mayor a 0.');
        }
        const locationExists = await svc.checkLocationExists(newUbi.id_location);
        if (!locationExists) {
            return res.status(400).send('El id_location especificado no existe.');
        } else{
            const province = await svc.createByUserCreatorAsync(newUbi);
            if (province != null) {
                respuesta = res.status(201).json("created");
            } else {
                respuesta = res.status(400).send(`Error interno.`);
            }
        }
        return respuesta;
    } catch (error) {
        console.error("Error en la creación:", error);
        return res.status(500).send(`Error interno en el servidor.`);
    }
});

router.put('', AutenticationMddleware.AuthMiddleware, async (req, res) => {
    try {
        let respuesta;
        let id_creator_user = req.id_user;
        let newUbi = req.body;
        newUbi.id_creator_user = id_creator_user;
        if (!newUbi.name || newUbi.name.length < 3 || !newUbi.full_address || newUbi.full_address.length < 3) {
            return res.status(400).send('Los campos name y full_address son obligatorios y deben tener al menos 3 caracteres.');
        }
        if (newUbi.max_capacity <= 0) {
            return res.status(400).send('El campo max_capacity debe ser mayor a 0.');
        }
        const locationExists = await svc.checkLocationExists(newUbi.id_location);
        if (!locationExists) {
            return res.status(404).send('El id_location especificado no existe.');
        } else{
            const province = await svc.upDateLocationAsync(newUbi);
            if (province != null) {
                respuesta = res.status(200).json("ok");
            } else {
                respuesta = res.status(400).send(`bad request.`);
            }
        }
        return respuesta;
    } catch (error) {
        console.error("Error en la creación:", error);
        return res.status(500).send(`Error interno en el servidor.`);
    }
});

router.delete('/:id', AutenticationMddleware.AuthMiddleware, async (req, res) => {
    try{
        let respuesta;
        let id = req.params.id;
        const province = await svc.deleteByIdAsync(id)
        if (province != 0){
            respuesta = res.status(200).json("Eliminada");
        } else {
            respuesta = res.status(404).send(`Provincia no econtrada o sin posibilidad de eliminarse.`);
        }
        return respuesta;
    } catch(error) {
        console.error("Error en la creación:", error);
        return res.status(500).send(`Error interno en el servidor.`);
    }
})

export default router;
