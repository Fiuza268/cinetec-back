import express from 'express';
import user from './controllers/UserController.js';
import actor from './controllers/actorController.js';
import director from './controllers/directorController.js';
import genero from './controllers/generoController.js';


const route = express();

route.use('/actor', actor);
route.use('/user', user);
route.use('/director', director);
route.use('/genero', genero);

export default route;