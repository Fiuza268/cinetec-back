import express from 'express';
import db from '../services/directorService.js';

const route = express.Router();

route.post('/', async (request, response) => {
    const {name, country, password, typeUser} = request.body;
    await db.createDirector(name, country, data_nasc, );
    response.status(200).send({message: 'Salvo com sucesso'});
});

route.put('/', async ( request, response) => {
    try{
    const {name, country, password, typeUser, idUser} = request.body;
    await db.updateUser(name, country, password, typeUser, idUser);
    response.status(200).send({message: 'Dados atualizados com sucesso!'});
    }catch(error) {
        response.status(500).send({message: `Erro na requisição ${error}`});
    }
});


route.delete('/:idUser', async (request, response) => {
    try{
    const {idDirector} = request.params;
    await db.deleteUser(idDirector);
    response.status(200).send({message: 'Director deletados com sucesso!'});
    }catch(error) {
        response.status(500).send({message: `Erro na requisição ${error}`});
    }
});


export default route;