import { response } from "express";
import Jwt from "jsonwebtoken";
class AutenticationMddleware {
    AuthMiddleware = async (req, res, next) => {
        try{
            if(req.headers.authorization){
                let authorizationHeader = req.headers.authorization; 
                let token = authorizationHeader.replace("Bearer ", "")
                const claveSecreta = "teclado5390";
                let original = await Jwt.verify(token, claveSecreta);
                req.id_user = original.id;
                console.log(req.id_user)
                next();
            } else {
                return res.status(401).send("Unauthorized");
            }
        } catch(error){
            console.log(error)
            return res.status(401).send("Unauthorized");
        }
    }
}

export default new AutenticationMddleware