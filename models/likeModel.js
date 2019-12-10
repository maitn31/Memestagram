'use strict';

const pool = require('../database/db');
const promisePool = pool.promise();

const likeImage = async (params) =>{
  try {
    const [rows] = await promisePool.execute(
      'INSERT INTO like_of_post (id, ownerid) VALUES (?,?);',
      params
    );
    return rows;
  } catch (e) {
    const [rows] = await promisePool.execute(
        'DELETE FROM `like_of_post` WHERE `like_of_post`.`id` = ? AND `like_of_post`.`ownerid` = ?',
        params
    );
    console.log('disliked', e.message);
    return rows;
  }
};

const mostLikes= async ()=>{
  try{
    const [rows]= await promisePool.execute(
      'SELECT * FROM (SELECT id, COUNT(*) AS likes FROM like_of_post GROUP BY id ) g ORDER BY likes DESC LIMIT 1'
    );
    return rows;
  }catch(e){
    console.log('error', e.message);
  }
};

const getLikeOfPost= async(params)=>{
  try {
    const [rows] = await promisePool.execute(
      'SELECT * FROM like_of_post WHERE id= ?',
      params
    );
    return rows;
  } catch (e) {
    console.log('error', e.message);
  }  
};

module.exports = {
  likeImage,
  getLikeOfPost, 
  mostLikes
};