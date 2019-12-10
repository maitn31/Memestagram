'use strict';

const pool = require('../database/db');
const promisePool = pool.promise();

const getAllUsers = async () => {
  try {
    const [rows] = await promisePool.query('SELECT * FROM user_info');
    return rows;
  } catch (e) {
    console.log('error', e.message);
  }   
};

const getUser = async (params) => {
  try {
    const [rows] = await promisePool.execute(
      'SELECT * FROM user_info WHERE name= ?;',
      params
    );
    return rows;
  } catch (e) {
    console.log('error', e.message);
  }   
};

const addUser = async (params) => {
  try {
    const [rows] = await promisePool.execute(
      'INSERT INTO user_info (name,email,password) VALUES (?, ?, ?);'      ,
      params
    );
    return rows;
  } catch (e) {
    console.log('error', e.message);
  }   
};

const getUserLogin = async (params) => {
  try {
    console.log(params);
    const [rows] = await promisePool.execute(
        'SELECT * FROM user_info WHERE email = ?;',
        params);
    return rows;
  } catch (e) {
    console.log('error', e.message);
  }
};

module.exports = {
  getAllUsers,
  getUser,
  addUser,
  getUserLogin
};