import express from 'express';
import { listMovies } from '../services/movieService.js';

const route = express.Router();

route.get('/list', async (request, response) => {
    let data = await listMovies();
    return response.status(200).send(data);
});

export default route;