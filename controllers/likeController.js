
const likeModel = require('../models/likeModel');

const image_like_click= async (req,res)=>{
    const params= [
        req.params.postId,
        req.params.ownerId
    ];
    const image= await likeModel.likeImage(params);
    await res.json(image);
}
const image_get_like= async(req,res)=>{
    const params=[req.params.postId];
    const image= await likeModel.getLikeOfPost(params);
    await res.json(image);
}

const most_likes = async (req, res) => {
    const likes = await likeModel.mostLikes();
    res.json(likes);
};

module.exports={
    image_like_click,
    image_get_like,
    most_likes
}
