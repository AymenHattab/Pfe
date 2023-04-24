import  express from "express";
import  cors from "cors";
import bodyparser from "body-parser";

import Authrouter from "./routers/Auth.router.js";
import Commercantrouter from "./routers/Commercant.router.js";
import Adminrouter from "./routers/Admin.router.js";
import LivreurRouter from "./routers/Livreur.router.js"
import bcrypt from "bcrypt"


const app=express()
const port=process.env.PORT||8000

//definir la methode a besoin 
app.use(cors())
app.use("/Uploads",express.static("/Uploads"))
app.use(bodyparser.json({limit: "50mb"}));
app.use(bodyparser.urlencoded({limit: "50mb", extended: true, parameterLimit:50000}));
app.use(express.json({limit: '50mb'}));
app.use(express.urlencoded({limit: '50mb'}));
          //definir les Auth routes  
app.use("/api",Authrouter)
app.use("/api",Commercantrouter)
app.use("/api",Adminrouter)
app.use("/api",LivreurRouter)  


//phone login 
app.get("/auth/phone/login",(req,res)=>{
    client
    .verify
    .services(process.env.SERVICEID)
    .verifications
    .create({
        to:`+${req.query.phone}`,
        channel:req.query.channel
    })
    .then((data)=>{
        res.status(200).send(data)
    }) 
})
//phone verification 
app.get("/auth/phone/verify",(req,res)=>{
    client
    .verify
    .services(process.env.SERVICEID)
    .verificationChecks
    .create({
        to:`+${req.query.phone}`,
        code:req.query.code 
    })
    .then((data)=>{
        res.status(200).send(data)
    }) 
})

//demarage de serveur 
app.listen(port,()=>{
    console.log(port )
    console.log(`1 2 3  Run ` )
})