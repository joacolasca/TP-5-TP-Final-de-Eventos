import {Router} from 'express';
import CategoriesService from '../services/category-service.js'
import { parse } from 'dotenv';
const router = Router();
const svc = new CategoriesService();

router.get('', async (req, res) => {
    let  limit = req.query.limit;
    let offset = req.query.offset;
    let respuesta;
    limit = parseInt(limit);
    offset= parseInt(offset);
    if(isNaN(offset))
    {
        offset = 0;
    }

    if(isNaN(limit))
    {
        limit = 99999999;
       
    }
        const returnArray = await svc.getAllAsync(limit, offset);
        if (returnArray != null){
            respuesta = res.status(200).json(returnArray);
        } else {
            respuesta = res.status(500).send(`Error interno.`);
        }
        return respuesta;
    
});

router.get('/:id', async (req, res) => {
    let respuesta;
    let id = req.params.id;
    const event_cat = await svc.getByIdAsync(id)
    if (event_cat != null){
        respuesta = res.status(200).json(event_cat);
    } else {
        respuesta = res.status(404).send(`Not found.`);
    }
    return respuesta;
});

router.post('', async (req, res) => {
    let respuesta;
    let newEent_categorie = req.body;
    const cat = await svc.createAsync(newEent_categorie)
    if (cat != null){
        respuesta = res.status(201).json("created");
    } else {
        respuesta = res.status(400).send(`Error interno.`);
    }
    return respuesta;
})

router.put('', async (req, res) => {
    let respuesta;
    let  newEent_categorie = req.body;
    const cat = await svc.updateAsync(newEent_categorie)
    if (cat != null){
        respuesta = res.status(201).json("created");
    } else {
        respuesta = res.status(400).send(`Error interno.`);
    }
    return respuesta;
})

router.delete('/:id', async (req, res) => {
    let respuesta;
    let id = req.params.id;
    const cat = await svc.deleteByIdAsync(id)
    if (cat != 0){
        respuesta = res.status(200).json("Eliminada");
    } else {
        respuesta = res.status(404).send(`Not Found.`);
    }
    return respuesta;
})

export default router;