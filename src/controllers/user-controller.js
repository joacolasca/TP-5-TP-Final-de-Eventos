import {Router} from 'express';
import { parse } from 'dotenv';
import jwt from 'jsonwebtoken';
import UsersService from '../services/user-service.js';
const router = Router();
const svc = new UsersService();

const claveSecreta = "teclado5390"

router.post('/login', async (req, res) => {
    let respuesta;
    let user = req.body;
    
    const usarInicio = await svc.getByUsernameAsync(user)
    if (usarInicio != null){
        const options = {
            expiresIn: '1h',
            issuer: 'ort'
        }
        const token = jwt.sign(usarInicio, claveSecreta, options)
        let ok = {
            success : true,
            mensagge : "El usuario existe",
            token : token

        }
        respuesta = res.status(200).json(ok);
    } else {
        const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
        if(!emailRegex.test(user.username) || user.password.length < 3){
            let NoOk = {
                success : false,
                mensagge : "Campos invalidos",
                token : null
            }
            respuesta = res.status(400).send(NoOk);
            
        }else{
            let NoOk = {
                success : false,
                mensagge : "Usuario o clave invalida",
                token : null
            }
            respuesta = res.status(401).send(NoOk);
        }
    }
    return respuesta;
});

router.post('/register', async (req, res) => {
    const { first_name, last_name, username, password } = req.body;
    if (!first_name || !last_name) {
        return res.status(400).send('Los campos first_name y last_name son obligatorios.');
    }
    const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
    if (!emailRegex.test(username)) {
        return res.status(400).send('El email (username) no es válido.');
    }
    if (password.length < 3) {
        return res.status(400).send('El campo password debe tener al menos 3 caracteres.');
    }
    try {
        const newUser = await svc.createAsync({ first_name, last_name, username, password });
        return res.status(201).send('Usuario creado exitosamente.');
    } catch (error) {
        console.error('Error al crear usuario:', error);
        return res.status(500).send('Error interno del servidor.');
    }
});


export default router;

