

const userModel = require('../models/userModel');
const { validationResult } = require('express-validator');
const bcrypt= require('bcryptjs');

const user_create_post = async (req, res, next) => {
    // Extract the validation errors from a request.

    const errors = validationResult(req); // TODO require validationResult, see userController
  
    if (!errors.isEmpty()) {
      console.log('user create error', errors);
      res.send(errors.array());
    } else {
        // TODO: bcrypt password
        const salt = bcrypt.genSaltSync(12);
        const hash = bcrypt.hashSync(req.body.password, salt);
        const params = [
        req.body.name,
        req.body.username,
        hash, // TODO: save hash instead of the actual password
        ];
        
        if (await userModel.addUser(params)) {
            next();
        } else {
            res.status(400).json({error: 'register error'});
        }   
    }
};

const login = async(req,res)=>{
    const params= [req.body.username];
    const user= await userModel.getUserLogin(params);
    await res.json(user);
}

const logout = (req, res) => {
    req.logout();
    res.json({message: 'logout'});
};

module.exports ={
    login,
    user_create_post,
    logout,
};
