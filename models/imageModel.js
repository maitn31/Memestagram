'use strict';

const pool = require('../database/db');
const promisePool = pool.promise();

const getAllImages = async (params) => {
    try {
        const [rows] = await promisePool.query('SELECT p.*, u.name as ownername, count(DISTINCT l.ownerid) as likes, IF(EXISTS(SELECT * FROM like_of_post WHERE like_of_post.ownerid=? AND like_of_post.id = p.post_id),1,0) as isLiked, count(DISTINCT c.id) as comments FROM post p LEFT OUTER JOIN like_of_post l ON l.id= p.post_id JOIN user_info u ON p.ownerid=u.user_id LEFT OUTER JOIN comment c ON c.postid=p.post_id GROUP BY p.post_id ORDER BY p.post_id DESC;',
        params
    );
        return rows;
    } catch (e) {
        console.log('error', e.message);
    }
};

const getImage = async (params) => {
    try {
        const [rows] = await promisePool.execute(
            'SELECT post.*, user_info.name as ownername FROM post JOIN user_info ON user_info.user_id = post.ownerid WHERE post_id = ? ORDER BY `post_id` DESC;',
            params
        );
        return rows;
    } catch (e) {
        console.log('error', e.message);
    }
};

const getImageByUser = async (params) => {
    try {
        const [rows] = await promisePool.execute(
            'SELECT p.*, u.name as ownername, count(l.ownerid) as likes, IF(EXISTS(SELECT * FROM like_of_post WHERE like_of_post.ownerid=? AND like_of_post.id = p.post_id),1,0) as isLiked FROM post p LEFT OUTER JOIN like_of_post l ON l.id= p.post_id JOIN user_info u ON p.ownerid=u.user_id WHERE p.ownerid= ? GROUP BY p.post_id ORDER BY p.post_id DESC;',
            params
        );
        return rows;
    } catch (e) {
        console.log('error', e.message);
    }
};

const getImageByUserName = async (params) => {
    try {
        const [rows] = await promisePool.execute(
            'SELECT p.*, u.name as ownername, count(l.ownerid) as likes, IF(EXISTS(SELECT * FROM like_of_post WHERE like_of_post.ownerid= ? AND like_of_post.id = p.post_id),1,0) as isLiked FROM post p LEFT OUTER JOIN like_of_post l ON l.id= p.post_id JOIN user_info u ON p.ownerid=u.user_id WHERE u.name= ? GROUP BY p.post_id ORDER BY p.post_id DESC;',
            params
        );
        return rows;
    } catch (e) {
        console.log('error', e.message);
    }
};


const addImage = async (params) => {
    try {
        const [rows] = await promisePool.execute(
            'INSERT INTO post (description, ownerid, filename, privacy) VALUES (?, ?, ?, ?);',
            params
        );
        return rows;
    } catch (e) {
        console.log('error', e.message);
    }
};


const deleteImage = async (params) => {
    try {
        const [rows] = await promisePool.execute(
            'DELETE FROM post WHERE post.post_id = ?;',
            params
        );
        return rows;
    } catch (e) {
        console.log('error', e.message);
    }
};

module.exports = {
    getAllImages,
    getImage,
    addImage,
    deleteImage,
    getImageByUser,
    getImageByUserName
};
