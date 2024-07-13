import EventRepository from '../repositories/event-location-repository.js';

export default class LocationsService {
    getByIdUserCreatorAsync = async (limit, offset, id_user) => {
        const repo = new EventRepository();
        const event_loc = await repo.getByIdUserCreatorAsync(limit, offset, id_user);
        return event_loc;
    }

    getByIdANDUserCreatorAsync = async (id, id_user) => {
        const repo = new EventRepository();
        const event_loc = await repo.getByIdANDUserCreatorAsync(id, id_user);
        return event_loc;
    }

    createByUserCreatorAsync = async (entity) => {
        const repo = new EventRepository();
        const event_loc = await repo.createByUserCreatorAsync(entity);
        return event_loc;
    }
    
    checkLocationExists = async (locationId) => {
        try {
            const repo = new EventRepository(); 
            const location = await repo.findById(locationId); 
            return location !== null
        } catch (error) {
            console.error('Error al verificar la existencia de la ubicación:', error);
            return false; 
        }
    }

    upDateLocationAsync = async (entity) =>{
        const repo = new EventRepository(); 
        const location = await repo.upDateLocationAsync(entity); 
        return location;
    }

    deleteByIdAsync = async (id) =>{
        const repo = new EventRepository(); 
        const location = await repo.deleteByIdAsync(id); 
        return location;
    }
}