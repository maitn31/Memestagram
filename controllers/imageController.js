'use strict';
// imageController

const imageModel = require('../models/imageModel');
const resize = require('../utils/resize');

const image_list_get = async (req, res) => {
    const params= [req.params.idLogin]
    const images = await imageModel.getAllImages(params);
    res.json(images);
};

const image_create_post = async (req, res) => {
    try{
        // make thumbnail
        try {
            await resize.makeThumbnail(
                req.file.path,
                `thumbnails/${req.file.filename}`,
                {width: 400, height: 400}
            );
        }
        catch(e){
            console.log('cant make thumbnails');
        }

        const params= [
            req.body.name,
            req.body.owner,
            req.file.filename,
            req.body.privacy
        ];
        
        const response= await imageModel.addImage(params);
        await res.json(response);

    }catch(e){
        console.log('exif error here it is');
        res.status(400).json({message:'error'});
    }
    
};

const image_get = async (req, res) => {
    const params= [req.params.id];
    const image= await imageModel.getImage(params);
    await res.json(image);
};

const image_get_by_user = async (req, res) => {
    const params= [req.params.id, req.params.id];
    console.log(params);
    const image= await imageModel.getImageByUser(params);
    await res.json(image);
};

const image_get_by_username = async (req, res) => {
    let params= [req.params.idLogin,req.params.username];
    console.log(params);
    const image= await imageModel.getImageByUserName(params);
    await res.json(image);
};

const image_delete= async (req,res)=>{
    const params= [req.params.id];
    const image= await imageModel.deleteImage(params);
    await res.json(image);
}

module.exports ={
    image_list_get,
    image_get,
    image_create_post,
    image_delete,
    image_get_by_user,
    image_get_by_username
};

