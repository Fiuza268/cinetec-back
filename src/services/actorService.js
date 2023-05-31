import { query } from 'express';
import database from '../repository/connection.js';

async function createActor(name, sexo, dataNasc) {
    const sql = 'INSERT INTO tbl_ator(nome_ator, sexo, data_nasc) VALUES(?, ?, ?)';
    const dados = [name, sexo, dataNasc];

    const conn = await database.connect();
    await conn.query(sql, dados);
    await conn.end();
}

async function updateActor(name, sexo, data_nasc, id_ator){
    const sql = "UPDATE tbl_ator SET nome = ?, sexo = ?, data_nasc = ? WHERE id_ator = ?";
    const dados = [name, sexo, data_nasc, id_ator];

    const conn = await database.connect();
    await conn.query(sql, dados);
    await conn.end();
}

async function deleteActor(id_ator){
    const sql = "DELETE FROM tbl_ator WHERE id_ator = 1";

    const conn = await database.connect();
    await conn.query(sql, id_ator);
    await conn.end();

}

export default {createActor, updateActor, deleteActor};