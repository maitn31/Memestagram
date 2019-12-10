'use strict';
// imageRoute
const express = require('express');
const router= express.Router();
const multer= require('multer');
// const upload = multer({dest: 'uploads/'});
const imageController = require('../controllers/imageController');

const storage= multer.diskStorage({
    destination: './uploads',
    filename: (req, file, cb)=>{
        cb(null, Date.now() + '_' + file.originalname);
    }
});

const upload= multer({storage: storage});

router.get('/:idLogin', imageController.image_list_get);
  
router.get('/test/:id', imageController.image_get);

router.get('/test/user/:id', imageController.image_get_by_user);

router.get('/test/username/:idLogin/:username', imageController.image_get_by_username);

router.post('/test',upload.single('image'),imageController.image_create_post);

router.delete('/delete/:id', imageController.image_delete);


// router.put('/', imageController.image_update_put);
// router.post('/like?postid&owner', imageController.image_like);

// router.post('/', upload.single('image'), (req, res)=>{
//   console.log(req.file);
// });

// router.post('/image', (req, res) => {
//   res.send('With this endpoint you can get images.');
// });



module.exports= router;