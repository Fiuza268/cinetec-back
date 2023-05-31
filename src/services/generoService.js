import { query } from 'express';
import database from '../repository/connection.js';

async function createUser(name, email, password, typeUser) {
    const sql = 'INSERT INTO tbl_genero(nome, email, senha, tipo_genero) VALUES(?, ?, ?, ?)';
    const dados = [name, email, password, typeUser];

    const conn = await database.connect();
    await conn.query(sql, dados);
    await conn.end();
}

async function updateUser(name, email, password, typeUser, idUser){
    const sql = "UPDATE tbl_genero SET nome = ?, email = ?, senha = ?, tipo_genero = ? WHERE id_genero = ?";
    const dados = [name, email, password, typeUser, idUser];

    const conn = await database.connect();
    await conn.query(sql, dados);
    await conn.end();
}

async function deleteUser(idUser){
    const sql = "DELETE FROM tbl_genero WHERE id_genero = 1";

    const conn = await database.connect();
    await conn.query(sql, idUser);
    await conn.end();

}

export default {createUser, updateUser, deleteUser};