import { Router } from "express";
import EventsService from "../services/event-service.js";
import AutenticationMddleware from "./../middlewares/autentication-middleware.js";
import { parse } from "dotenv";
const router = Router();
const svc = new EventsService();

const claveSecreta = "teclado5390";

router.get("", async (req, res) => {
  let respuesta;
  const filtros = req.query;
  let limit = req.query.limit;
  let offset = req.query.offset;
  if (isNaN(offset)) {
    offset = 0;
  }

  if (isNaN(limit)) {
    limit = 99999999;
  }
  const usarInicio = await svc.getByFilter(filtros, limit, offset);
  if (usarInicio != null) {
    respuesta = res.status(200).json(usarInicio);
  } else {
    respuesta = res.status(401).send("NoOk");
  }
  return respuesta;
});

router.get("/:id", async (req, res) => {
  let respuesta;
  let id = req.params.id;
  console.log("controller getByIdAsync: ", id)
  const evento = await svc.getByIdAsync(id);
  if (evento != null) {
    respuesta = res.status(200).json(evento);
  } else {
    respuesta = res.status(404).send(`Not found.`);
  }
  return respuesta;
});

router.post("", AutenticationMddleware.AuthMiddleware, async (req, res) => {
  let respuesta;
  let newEve = req.body;
  let id_creator_user = req.id_user;
  if(newEve.name.lenght <3 || newEve.description.lenght < 3 ){
     return res.status(400).send(`Bad request, no son campos validos`);
  } else if(newEve.price < 0 ||  newEve.duration_in_minutes < 0){
    return res.status(400).send(`Bad request, no son campos validos`);
  } 
  /* PENDIENTE
  else if(newEve.max_assistance){    
    /// El max_assistance es mayor que el max_capacity del id_event_location.
  }*/
  const eve = await svc.createAsync(newEve, id_creator_user);
  if (eve != null) {
    respuesta = res.status(201).json("created");
  } else {
    respuesta = res.status(400).send(`Bad request.`);
  }
  return respuesta;
});

router.put("", AutenticationMddleware.AuthMiddleware, async (req, res) => {
  let respuesta;
  let newEve = req.body;
  const eve = await svc.updateAsync(newEve);
  if (eve != 0) {
    respuesta = res.status(200).json("Succesfully");
  } else {
    if(newEve.name.lenght < 3 || newEve.name == null ){
      return res.status(400).send(`Bad request, no son campos validos`);
    } else if(newEve.price < 0 ||  newEve.duration_in_minutes < 0){
      return res.status(400).send(`Bad request, no son campos validos`);
    } else if (!newEve.description || newEve.description.lenght < 3){
      return res.status(400).send(`Bad request, no son campos validos`);
    }
    return respuesta = res.status(404).send(`Error interno.`);
  }


});

router.delete(
  "/:id",
  AutenticationMddleware.AuthMiddleware,
  async (req, res) => {
    let respuesta;
    let id = req.params.id;
    const eve = await svc.deleteByIdAsync(id);
    if (eve != 0) {
      respuesta = res.status(200).json("Eliminada");
    } else {
      respuesta = res.status(404).send(`Not Found.`);
    }
    return respuesta;
  }
);

router.post(
  "/:id/enrollment",
  AutenticationMddleware.AuthMiddleware,
  async (req, res) => {
    let idEvento = req.params.id;
    let idUsuario = req.id_user;
    let respuesta = null;
    const event = await svc.getByIdAsync(idEvento);
    if (event != null) {
      const startDate = new Date(event.event.start_date);
      const currentDate = new Date();

      if ((startDate) => currentDate) {
        if (event.event.enabled_for_enrollment = '1') {
          const cantidadinscriptos = await svc.getEnrollmentAsync(idEvento);
          if (cantidadinscriptos.cantidad < event.event.max_assistance) {
            const enr = await svc.createEnrollmentAsync(
              idUsuario,
              idEvento,
              currentDate
            );

            if (enr != 0) {
              respuesta = res.status(201).json("Created");
            } else {
              respuesta = res.status(400).send(`Bad Request.`);
            }
          } else {
            respuesta = res
              .status(400)
              .send(`Exceda la capacidad máxima de registrados`);
          }
        } else {
          respuesta = res
            .status(400)
            .send(`No está habilitado para la inscripción`);
        }
      } else {
        respuesta = res.status(400).send(`El evento ya sucedio!`);
      }
    } else {
      respuesta = res.status(404).send(`El evento no existe!`);
    }
    return respuesta;
  }
);

router.delete("/:id/enrollment",
  AutenticationMddleware.AuthMiddleware,
  async (req, res) => {
    let idEvento = req.params.id;
    let idUsuario = req.id_user;
    let respuesta = null;
    const event_detalle = await svc.getByIdAsync(idEvento);

    if (event_detalle != null) {
      const startDate = new Date(event_detalle.event.start_date);
      const currentDate = new Date();
      if ((startDate) => currentDate) {
          const enr = await svc.deleteEnrollmentAsync(
              idUsuario,
              idEvento,
            );
            if (enr != 0) {
              respuesta = res.status(200).json("Te desuscribiste correctamente");
            } else {
              respuesta = res.status(400).send(`No se encontro tu suscripcion.`);
            }
      } else {
        respuesta = res.status(400).send(`El evento ya sucedio!`);
      }
    } else {
      respuesta = res.status(404).send(`El evento no existe!`);
    }
    return respuesta;
});

router.get("/:id/enrollment", AutenticationMddleware.AuthMiddleware, async (req, res) => {
  let respuesta;
  const filtros = req.query;
  let idEvento = req.params.id;
  let limit = req.query.limit;
  let offset = req.query.offset;
  if (isNaN(offset)) {
    offset = 0;
  }

  if (isNaN(limit)) {
    limit = 99999999;
  }
  const usersEnrollments = await svc.getEnrollmentByFilterAsync(filtros, limit, offset, idEvento);
  if (usersEnrollments != null) {
    respuesta = res.status(200).json(usersEnrollments);
  } else {
    respuesta = res.status(404).send("No se encontro tu busqueda");
  }
  return respuesta;
});

router.patch("/:id/enrollment/:rating", AutenticationMddleware.AuthMiddleware, async (req, res) => {
  let idEvent_enroll = req.params.id;
  let rating = parseInt(req.params.rating);
  let idUsuario = req.id_user;
  const observations = req.body.observations;
  let respuesta = null;
  let limit = 100000;
  let offset = 0;
  const filtros = req.query;

  try{
    if(rating > 10 || rating < 1 || isNaN(rating)){
      respuesta = res.status(400).send(`El rating debe ser entre 1 y 10!`);
    } else{
      const event_detalle = await svc.getByIdAsync(idEvent_enroll);
      console.log("event ", event_detalle)
      if (event_detalle != null) { 
        const usersEnrollments = await svc.getEnrollmentBy(idUsuario, idEvent_enroll);
        console.log("usersEnrollments", usersEnrollments)
        //const userEnrollment = usersEnrollments.find(enrollment => enrollment.id_user === idUsuario);
        if (usersEnrollments == null) {
          respuesta = res.status(400).send(`El usuario no está inscrito en este evento.`);
        }else{
          const startDate = new Date(event_detalle.event.start_date);
          const currentDate = new Date();
          if (startDate <= currentDate) {
            const event_rating = await svc.patchRatingAsync(rating, idEvent_enroll, idUsuario);
            respuesta = res.status(200).json("Rankeada correctamente");
          } else {
            respuesta = res.status(400).send(`El evento no sucedio aún!`);
          }
        }
      } else {
        respuesta = res.status(404).send(`El evento no existe!`);
      }
    } 
  } catch(error){
    console.log("error", error)

    return res.status(500).json(error);
  }
  });
  
  export default router;
