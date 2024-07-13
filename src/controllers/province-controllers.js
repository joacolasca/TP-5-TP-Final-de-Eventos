import {Router} from 'express';
import ProvinceService from '../services/province-service.js'
const router = Router();
const svc = new ProvinceService();

router.get('', async (req, res) => {
    let limit = req.query.limit;
    let offset = req.query.offset;
    let respuesta;
    limit = parseInt(limit, 10);
    offset = parseInt(offset, 10);
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
    const province = await svc.getByIdAsync(id)
    if (province != null){
        respuesta = res.status(200).json(province);
    } else {
        respuesta = res.status(404).send(`No se encontro.`);
    }
    return respuesta;
});

router.get('/:id/locations', async (req, res) => {
    let respuesta;
    let id = req.params.id;
    const provinces = await svc.getLocProvByIdAsync(id)
    if (provinces != null){
        respuesta = res.status(200).json(provinces);
    } else {
        respuesta = res.status(404).send(`No se encontro.`);
    }
    return respuesta;
});

router.post('', async (req, res) => {
    let respuesta;
    let  newProvince = req.body;
    const province = await svc.createAsync(newProvince)
    if (province != null){
        respuesta = res.status(201).json("created");
    } else {
        respuesta = res.status(400).send(`Error interno.`);
    }
    return respuesta;
})

router.put('', async (req, res) => {
    let  newProvince = req.body;
    const { id } = req.params;
    const { name, latitude, longitude } = req.body;
    if (!name || name.length < 3) {
        return res.status(400).send('El campo name es obligatorio y debe tener al menos 3 caracteres.');
    }
    if (isNaN(latitude) || isNaN(longitude)) {
        return res.status(400).send('Los campos latitude y longitude deben ser números.');
    }
    try {
        const updatedProvince = await svc.updateAsync(newProvince);
        if (updatedProvince) {
            return res.status(200).send('Provincia actualizada exitosamente.');
        } else {
            return res.status(404).send('Provincia no encontrada.');
        }
    } catch (error) {
        console.error('Error al actualizar provincia:', error);
        return res.status(500).send('Error interno del servidor.');
    }
});

router.delete('/:id', async (req, res) => {
    let respuesta;
    let id = req.params.id;
    try {
        const rowCount = await svc.deleteByIdAsync(id)
        if (rowCount != 0){
            respuesta = res.status(200).json("Eliminada");
        } else {
            console.log(id)
            respuesta = res.status(404).send(`Provincia no econtrada o sin posibilidad de eliminarse.`);
        }
        return respuesta;
    } catch (error){
        console.error('Error al intentar eliminar provincia:', error);
        return res.status(500).send('Error interno del servidor.');
    }
});

/// patch controller

export default router;