import { PrismaClient } from "@prisma/client";
const prisma=new PrismaClient();
import {db} from "../db.configue.js"

//client login 
export const Client_sign_in=async(req,res)=>{
    const mdp=req.body.mdp;
    const email=req.body.email;
    try {
    const  clientexiste= await prisma.compteClient.findUnique({where:{email:email}})
            if(clientexiste){
            const isEqual=clientexiste.mdp===mdp;
            console.log(isEqual,mdp,clientexiste.mdp)
            if(isEqual){
                res.status(200).send({"msg":"welcome there  "})
            }else{
                res.status(400).send({"msg":"invalide mail or password"})
            }
            }else{
                res.status(400).send({"msg":"no clint found "})
            }
    } catch (error) {
         res.status(500).send({"msg":"somthing wreng" + error})
    }
}
//client register
export const Client_register=async(req,res)=>{
    const {nom,prenom,email,mdp,CliId}=req.body;
    try {
       const isExiste=await prisma.client.count({
        where:{
            nom:nom,
            prenom:prenom,
        }
      
       }) 
       if(!isExiste) {
        res.status(404).json({"message":"Client is not exist with this Nom essayer Avec votre Code   "})
       }else{
        const Client = await prisma.compteClient.create({
            data:{
                email: email,
                mdp: mdp,
            }
        })
        if(Client){
        res.status(201).send({"msg":"Client created successfully"})
       }else{
        res.status(400).json({"msg":"Invalid Create Client"})
       }
    }
    } catch (error) {
        res.status(500).send({"msg":"oops "+ error})
    }
}   
//commercant login 
export const commercant_login=async(req,res)=>{
    const email=req.body.email;
    const mdp=req.body.mdp;
    console.log(email);
    console.log(mdp);
    try {
        const   emailExiste= await prisma.commercant.findUnique({where:{email:email}})
        if(emailExiste){
            const isEqual=emailExiste.mdp===mdp
            if(isEqual){
                res.json(emailExiste.id)
            }else {
                res.status(400).send({"msg":"password est incorrect"})
            }
        }else{
            res.status(400).send({"msg":"no clint found "})
        }
    } catch (error) {
        res.status(500).send({"msg":"somthing wreng" + error})
    }
}
//comercant register 
export const commercant_register=async(req,res)=>{
    const {Nom,prenom,email,mdp,phone,Adress}=req.body;
    const addcom ="insert into commercant(Nom,prenom,email,mdp,phone,Adress) value(?,?,?,?,?,?)";
   /* const salt=bcrypt.genSaltSync(10);
    const hach=bcrypt.hashSync(mdp,salt)*/
    try {
        const clientexiste=await prisma.commercant.count({where:{email:email}})
    if(clientexiste>0){
        res.status(401).send("commercant deja existe ")
    }else{
     db.query(addcom,[Nom,prenom,email,mdp,phone,Adress],(err,reslt)=>{
        if(reslt){
            res.status(200).send({"msg":"commercant added with sucsses "})
           }else{
            res.status(401).send({"msg":"fama haja mouch hiya"+err})
           }
     })
       }
    } catch (error) {
        res.status(500).send({"msg":"oops "+ error})
    }
    
}
//Admin login 
export const Admin_login=async(req,res)=>{
    const email=req.body.UserName;
    const Password=req.body.Password;
    try {
         const  Adminexiste= await prisma.admin.findUnique({where:{UserName:email}})
            if(Adminexiste){
                const isEqual=Adminexiste.Password===Password;
                console.log(isEqual)
                if(isEqual){
                    res.status(200).send({"msg":"welcome there  ",Adminexiste})
                }else{
                    res.status(400).send({"msg":"invalide mail or password"})
                }
                
            }else{
                res.status(400).send({"msg":"Ooops No  Admin found  try Again "})
            }
    } catch (error) {
         res.status(500).send({"msg":"somthing wrong" + error})
    }
}
//Admin reset Password 
export const Admin_Rest=async(req,res)=>{
    const newpassword=req.body.Password;
    const username=req.body.UserName;
    /*const salt=bcrypt.genSaltSync(10);
    const hach=bcrypt.hashSync(newpassword,salt)*/
    try {
     
        const Admin=await prisma.admin.update({
            where:{
                UserName:username
            },
            data:{
               Password:newpassword 
            }
        })
        if( Admin){
            return res.status(200).send({"msg":"mot de passe tbadlet sayer"})
        }else{
            return res.status(400).send({"msg":"o93ed zazwa ^_^ "})
        }
   
    } catch (error) {
        res.status(500).send({"msg":"fama haja moch hiya "+error})
    }   
}
//livreur login 
export const Livreur_login=async(req,res)=>{
    const email=req.body.email;
    const lpassword=req.body.mdp;
    try {
    const  emailexiste= await prisma.livreur.findUnique({where:{email:email}})
            if(emailexiste){
                const Passexiste=await prisma.livreur.findUnique({where:{mdp:lpassword}})
                const isEqual=bcrypt.compareSync(clientexiste.Password,Passexiste.Password);
                console.log(isEqual,Passexiste.Password,clientexiste.Password)
                if(isEqual){
                    res.status(200).send({"msg":"welcome there  "})
                }else{
                    res.status(400).send({"msg":"invalide mail or password"})
                }
            }else{
                res.status(400).send({"msg":"no clint found "})
            }
    } catch (error) {
         res.status(500).send({"msg":"somthing wreng" + error})
    }
}
//livreur register 
export const Livreur_register=async(req,res)=>{
    const {email,mdp,phone,adress,nomliv,prenomliv}=req.body;
    const addcom ="insert into livreur(email,phone,mdp,adress,nomliv,prenomliv) value(?,?,?,?,?,?)"
    try {
        const clientexiste=await prisma.livreur.count({where:{email:email}})
    if(clientexiste>0){
        res.status(401).send("livreur deja existe ")
    }else{
     db.query(addcom,[email,mdp,phone,adress,nomliv,prenomliv],(err,reslt)=>{
        if(reslt){
            res.status(200).send({"msg":"livreur added with sucsses "})
           }else{
            res.status(401).send({"msg":"fama haja mouch hiya"+err})
           }
     })
       }
    } catch (error) {
        res.status(500).send({"msg":"oops "+ error})
    }
    
}