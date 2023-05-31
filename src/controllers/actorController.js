import express from 'express';
import db from '../services/actorService.js';

const route = express.Router();

route.post('/', async (request, response) => {
    const {nameActor, sexo, dataNasc} = request.body;
    await db.createActor(nameActor, sexo, dataNasc);
    response.status(200).send({message: 'Salvo com sucesso'});
});

route.put('/', async (request, response) => {
    try{
    const {idActor, nameActor, sexo, dataNasc} = request.body;
    await db.updateActor({idActor, nameActor, sexo, dataNasc});
    response.status(200).send({message: 'Dados atualizados com sucesso!'});
    }catch(error) {
        response.status(500).send({message: `Erro na requisição ${error}`});
    }
});


route.delete('/:idActor', async (request, response) => {
    try{
    const {idActor} = request.params;
    await db.deleteActor(idActor);
    response.status(200).send({message: 'Ator deletado com sucesso!'});
    }catch(error) {
        response.status(500).send({message: `Erro na requisição ${error}`});
    }
});

export default route;