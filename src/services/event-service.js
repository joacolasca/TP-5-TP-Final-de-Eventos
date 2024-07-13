import ListEvents from '../repositories/event-repository.js';

export default class EventsService {
    getByFilter = async (filters, limit, offset) => {
        const repo = new ListEvents();
        const user = await repo.getByFilter(filters, offset);
        return user;
    }

    getByIdAsync = async (id) => {
        const repo = new ListEvents();
        const returnEntity = await repo.getByIdAsync(id);
        return returnEntity;
    }

    createAsync = async (entity, idUser) => {
        const repo = new ListEvents();
        const returnArray = await repo.createAsync(entity, idUser);
        return returnArray;
    }

    updateAsync = async (entity) => {
        const repo = new ListEvents();
        const eve = await repo.updateAsync(entity);
        return eve;
    }

    deleteByIdAsync = async (id) => {
        const repo = new ListEvents();
        const eve = await repo.deleteByIdAsync(id);
        return eve;
    }

    createEnrollmentAsync = async (idUser, idEvent) => {
        const repo = new ListEvents();
        const eve = await repo.CreateEnrollmentAsync(idUser, idEvent);
        return eve;
    }
   
    getEnrollmentAsync = async (id) => {
        const repo = new ListEvents();
        const returnArray = await repo.getEnrollmentAsync(id);
        return returnArray;
    }

    deleteEnrollmentAsync = async (idUser, idEvent, fecha) => {
        const repo = new ListEvents();
        const eve = await repo.DeleteEnrollmentAsync(idUser, idEvent, fecha);
        return eve;
    }
  
    getEnrollmentByFilterAsync = async (filters, limit, offset, idEvento) => {
        const repo = new ListEvents();
        const user = await repo.getEnrollmentByFilterAsync(filters, limit, offset, idEvento);
        return user;
    }

    patchRatingAsync = async (rating, id_event, id_user) => {
        const repo = new ListEvents();
        const eve = await repo.patchRatingAsync(rating, id_event, id_user);
        return eve;
    }

    getEnrollmentBy= async (id_user,  id_event) => {
        const repo = new ListEvents();
        const eve = await repo.getEnrollmentBy(id_user,  id_event);
        return eve;
    }
}
