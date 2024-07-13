import EventRepository from '../repositories/location-repository.js';

export default class LocationsService {
    getAllAsync = async (limit, offset) => {
        const repo = new EventRepository();
        const returnArray = await repo.getAllAsync(limit, offset);
        return returnArray;
    }

    getByIdAsync = async (id) => {
        const repo = new EventRepository();
        const event_loc = await repo.getByIdAsync(id);
        return event_loc;
    }

    getByIdLocationAsync = async (limit, offset, id, id_user) => {
        const repo = new EventRepository();
        const event_loc = await repo.getByIdLocationAsync(limit, offset, id, id_user);
        return event_loc;
    }
}