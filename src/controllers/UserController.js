import express from 'express';
import db from '../services/userService.js';

const route = express.Router();

route.post('/', async (request, response) => {
    const {name, email, password, typeUser} = request.body;
    await db.createUser(name, email, password, typeUser);
    response.status(200).send({message: 'Salvo com sucesso'});
});

route.put('/', async ( request, response) => {
    try{
    const {name, email, password, typeUser, idUser} = request.body;
    await db.updateUser(name, email, password, typeUser, idUser);
    response.status(200).send({message: 'Dados atualizados com sucesso!'});
    }catch(error) {
        response.status(500).send({message: `Erro na requisição ${error}`});
    }
});


route.delete('/:idUser', async (request, response) => {
    try{
    const {idUser} = request.params;
    await db.deleteUser(idUser);
    response.status(200).send({message: 'Usuário deletados com sucesso!'});
    }catch(error) {
        response.status(500).send({message: `Erro na requisição ${error}`});
    }
});


export default route;