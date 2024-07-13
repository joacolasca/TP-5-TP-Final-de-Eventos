import CategorieRepository from '../repositories/category-repository.js';

export default class CategoriesService {
    getAllAsync = async (limit, offset) => {
        const repo = new CategorieRepository();
        const returnArray = await repo.getAllAsync(limit, offset);
        return returnArray;
    }

    getByIdAsync = async (id) => {
        const repo = new CategorieRepository();
        const event_cat = await repo.getByIdAsync(id);
        return event_cat;
    }

    createAsync = async (entity) => {
        const repo = new CategorieRepository();
        const cat = await repo.createAsync(entity);
        console.log(entity)

        return cat;
    }

    updateAsync = async (entity) => {
        const repo = new CategorieRepository();
        const cat = await repo.updateAsync(entity);
        return cat;
    }

    deleteByIdAsync = async (id) => {
        const repo = new CategorieRepository();
        const cat = await repo.deleteByIdAsync(id);
        return cat;
    }

}