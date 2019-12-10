'use strict';
// catRoute
const express = require('express');
const router= express.Router();
const userController = require('../controllers/userController');


router.get('/', userController.user_list_get);

router.get('/:name', userController.user_get);

// router.post('/', userController.user_create_post);

// router.get('/user/:id', (req, res) => {
//     res.send(`You request a user with id ${req.params.id}`);
//   });
  
// router.post('/user', (req, res) => {
//     res.send('With this endpoint you can get users.');
//   });

router.put('/user', (req, res) => {
    res.send('With this endpoint you can edit users.');
  });
router.delete('/user', (req, res) => {
    res.send('With this endpoint you can delete users.');
  });

module.exports= router;