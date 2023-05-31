import { query } from 'express';
import database from '../repository/connection.js';

async function createUser(name, email, password, typeUser) {
    const sql = 'INSERT INTO tbl_usuario(nome, email, senha, tipo_usuario) VALUES(?, ?, ?, ?)';
    const dados = [name, email, password, typeUser];

    const conn = await database.connect();
    await conn.query(sql, dados);
    await conn.end();
}

async function updateUser(name, email, password, typeUser, idUser){
    const sql = "UPDATE tbl_usuario SET nome = ?, email = ?, senha = ?, tipo_usuario = ? WHERE id_usuario = ?";
    const dados = [name, email, password, typeUser, idUser];

    const conn = await database.connect();
    await conn.query(sql, dados);
    await conn.end();
}

async function deleteUser(idUser){
    const sql = "DELETE FROM tbl_usuario WHERE id_usuario = 1";

    const conn = await database.connect();
    await conn.query(sql, idUser);
    await conn.end();

}

export default {createUser, updateUser, deleteUser};