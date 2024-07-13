import ProvinceRepository from '../repositories/province-repository.js';

export default class ProvinceService {
    getAllAsync = async (limit, offset) => {
        const repo = new ProvinceRepository();
        const returnArray = await repo.getAllAsync(limit, offset);
        return returnArray;
    }

    getByIdAsync = async (id) => {
        const repo = new ProvinceRepository();
        const province = await repo.getByIdAsync(id);
        return province;
    }

    getLocProvByIdAsync = async (id) => {
        const repo = new ProvinceRepository();
        const province = await repo.getLocProvByIdAsync(id);
        return province;
    }

    createAsync = async (entity) => {
        const repo = new ProvinceRepository();
        const province = await repo.createAsync(entity);
        return province;
    }
    
    updateAsync = async (entity) => {
        const repo = new ProvinceRepository();
        const province = await repo.updateAsync(entity);
        return province;
    }

    deleteByIdAsync = async (id) => {
        const repo = new ProvinceRepository();
        const province = await repo.deleteByIdAsync(id);
        return province;
    }

}