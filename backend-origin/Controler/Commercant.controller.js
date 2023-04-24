import { PrismaClient } from "@prisma/client";
const prisma=new PrismaClient();
import {db} from "../db.configue.js";
import  moment from "moment";
import Cloudinary from "../Cloudinary.js";



//obtenir les information de commercant et son historique 
export const getAllComercantwithhistorique= async(req,res)=>{
    try {
        const id=req.params.id
        const Allcom=await prisma.commercant.findUnique({
            where:{
                id:Number(id)
            },
            include:{
                historique:true,
                client:true,
                commande:true,
                score:true
            },
        })
        res.json(Allcom)
        
    } catch (error) {
        res.status(500).send({"msg":"somthing wreng" + error})
    }
}
//obtenir les Commande de chaque Client par id 
export const getclient_Commande=async(req,res)=>{
    const id=req.body.id
    try {
        const Allclient=await prisma.client.findUnique({
            where:{id:Number(id)},
            include:{commande:true},
        })
        res.json(Allclient)
        
    } catch (error) {
        res.status(500).send({"msg":"somthing wreng" + error})
    }
}
//obtenir tous les informtion d'objective 
export const AllObjective=async(req,res)=>{
    try {
        const objectif=await prisma.objectif.findMany({
            include:{
                score:true
            }
        })
        res.json(objectif)
     
}   catch(error){
    res.status(500).json({"msg":"Somthing wrong "+error})
}
}

//Ajouter Facture 
export const AddFacture=async(req,res)=>{
    const {montant,code_cmd}=req.body;
    try {
        const Addfact="insert into facture (montant,code_cmd) values(?,?)"
        db.query(Addfact,[montant,code_cmd],(err,reslt)=>{
            if(reslt){
               res.status(200).json({"msg":"Facture a eté bien Enregistrer "}) 
            }else{
                res.status(400).json({"msg":"fama Galta "+err}) 
            }
        }) 
    } catch (error) {
        res.status(500).send({"msg":"fama Galta "+error})
    }
   
}
//Get All Facture 
export const GetAllFacture=async(req,res)=>{
    try {
        const Facture=await prisma.facture.findMany();
        if(Facture){
            res.status(200).json(  Facture)
            
        }else{
            res.status(400).send({"msg":"fama Ghalta"})
        }
    } catch (error) {
       res.status(500).send({"msg":"fama Ghalta"+error}) 
    }
}
//Get Facture Details 
export const GetFactureById=async(req,res)=>{
    try {
        const id=req.params.id ;
        console.log(id)
        const FacturById=await prisma.facture.findUnique({
            where:{
                id: Number(id) 
            }
        })
        if (FacturById) {
            res.status(200).json(FacturById)
        }else{
            res.status(404).json({"msg":"Aucune Facture "})
        }
    } catch (error) {
        res.status(500).json({"msg":"Ooops !"+error})
    }
}
//serach product 
export const SearchProduct=async(req,res)=>{
    const {q}=req.query;
    
   try {
    const Product=prisma.produit.findMany({
        where:{
            nom:{
                contains:q
            }
        }
    })
    if((await Product).length>0){
        res.status(200).send({"le produit trouver est:": await Product})
    }else{
        res.status(404).send({"msg":"Product Not Found "})
    }
    
   } catch (error) {
    res.status(500).send({"msg":error})
   }
   
}
//Update Comercant profile 
export const Commercant_Update=async(req,res)=>{
    const id=req.params.id;
    const {email,phone,benificier,montant_actuelle,mdp}=req.body;
    try {
       
      const Update_com=await prisma.commercant.update({
        where:{
           id:Number(id) 
        },
        data:{
           benificier:benificier,
           email:email,
           mdp:mdp,
           montant_actuelle:montant_actuelle,
           phone:phone 
        }
      })
      if(Update_com){
        res.status(201).json({"success":"true"})
      }
    } catch (error) {
        res.status(500).send({"msg":"ooops "+error})
    }
   
}
//Add Commande 
export const AddCommande=async(req,res)=>{
    let MyDate;
    MyDate=moment().format('YYYY-MM-DD');
    const {idCard,ComId,CliId,lat,long,id}=req.body;
    try {
      const Command=await prisma.commande.create({
        data:{
            idCard: idCard,
            ComId:ComId,
            CliId:CliId,
            Date_cmd:MyDate,
            lat:lat,
            long:long,
            id:id
        }
      })
      if(Command){
        res.status(201).send({"Commande A ete Ajouter ":Command})
      }else{
        res.status(400).json("il y a Un Error")
      }
    } catch (error) {
        res.status(500).send({"msg":"il ya Un Error "+error})
    }
}
//Delete Commande where not en_route
export const DeleteCommande=async(req,res)=>{
    const code=req.body.code;
    try {
        const commande="DELETE FROM commande WHERE code =?";
        db.query(commande,code,(err,reslt)=>{
            if(reslt){
                res.status(200).json({"msg":"Commande a eté Supprimer"})
            }else{
                res.status(400).json({"msg":err})
            }
        })
        
    } catch (error) {
       res.status(500).json({"msg":"Ooops"+error}) 
    }
}
//Get All Category 
export const GetAllCategory=async(req,res)=>{

    try {
        const Category=await prisma.category.findMany({})
        if(Category){
            res.status(200).json({Category})
            console.log(Category)
        }else{
            res.status(400).json({"msg":"Ooops Bad request ... "})
        }
    } catch (error) {
        res.status(500).json({"msg":"Ooops"+error}) 
    }
}
//Get Product By Id 
export const GetAllProduct=async(req,res)=>{
    const idcategory=req.params.idc;
    console.log("test",idcategory)
    try {
        const produit=await prisma.produit.findMany({
            where:{
            idcategory:parseInt(idcategory)
            }
        })
        if(produit){
            res.status(200).json({produit})
        }else{
            res.status(400).json({"msg":"Ooops Bad Request .. "})
        }
    } catch (error) {
        res.status(500).json({"msg":"Ooops"+error})
    }
}
//Add Client 
export const addClient =async(req,res)=>{
    const {id,nom,prenom,phone,idCom}=req.body;
   const client= "INSERT INTO `client`(`id`,`nom`, `prenom`, `phone`, `idCom`) VALUES(?,?,?,?,?)";
    try {
       db.query(client,[id,nom,prenom,phone,idCom],(err, result) => {
        if(result) {
            res.status(201).json({"msg": "Client Added successfully"})
        }else{
            res.status(400).json({"msg": "Faild to Add client failed"+err});
        }
       }); 
    } catch (error) {
        res.json({"msg":"errrors"+error})
    }
}
//Update Commercant Image 
export const updateImage=async(req,res)=>{
    const {Nom,prenom,email,phone,mdp,image}=req.body;
    const id=req.params.id;
    try {
        console.log(image)
        if(image){
            const UpoadResponse= await Cloudinary.uploader.upload(image,{
                upload_preset:"productUpload"
            })
            if(UpoadResponse){
                const imageProduct=UpoadResponse.secure_url;
                const UpdateImage=await prisma.commercant.update({
                    where:{
                        id:Number(id)
                    },
                    data:{
                     email:email,
                     image:imageProduct,
                     mdp:mdp,
                     Nom:Nom,
                     prenom:prenom,
                     phone:phone  
                    }
                })
                if(UpdateImage){
                res.status(201).json("Commerçant details is Modified  ")
                }else{
                    request.status(400).json("Commerçant details is not Modified")
                }
            }
           
        }else{
         res.status(400).json("image not Updated ")
        }
    } catch (error) {
        res.status(500).json({"msg":"Ooops"+error})
    }
}
//Add Card 
export const addCard =async(req, res) => {
    const id=req.body.id
     try {
        const card = await prisma.card.create({
            data:{
                id:id
            }
        })
        if(card){
            res.status(201).json({card})
        }else{
            res.status(400).json({"msg":"Bad Request"})
        }
     } catch (error) {
        res.status(500).json({"msg":"Ooops"+error});
     }
}
//Add Card item to Card 
/*export const AddCardItem = async(req, res) => {
    const {idproduit,qte_produit,Prix,idcard}=req.body;
    const CardItem="insert into CardItem (idproduit,qte_produit,Prix,idcard) values(?,?,?,?)";
    try {
        console.log(Prix,idproduit,qte_produit,idcard)
       db.query(CardItem,[idproduit,qte_produit,Prix,idcard],(reselt,err)=>{
        if(reselt){
            res.status(201).json(reselt)
        }else{
            res.status(400).json({"msg":"Invalide " + err})
        } 
       })     
    } catch (error) {
        res.status(500).json({"msg":"Bad request"+error})
    }
}*/
export const AddCardItem=async(req,res)=>{
    const {idproduit,qte_produit,Prix,idcard}=req.body;
    const AddCardItem=await prisma.cardItem.create({
        data:{
            Prix:Prix,
            qte_produit:qte_produit,
            idProduit:idproduit,
            idCard:idcard

        }
    })
    if(AddCardItem){
        res.status(201).json({"msg":"success add card item"})
    }
}
//Get Card information
export const getCardInfo =async(req, res) => {
    const id = req.params.id;
    try {
        const CardInfo=await prisma.card.findUnique({
            where:{
                id:Number(id)
            },
            include:{
                cardItem:true
            }
        })
        res.json({CardInfo})
    } catch (error) {
        res.status(500).json({"msg":"Bad request"+error})
    }
}
//delete CardItem from Card 
export const deleteCardItem=async(req,res)=>{
    const id=req.params.id;
    try {
        const CardItem = await prisma.cardItem.delete({
            where:{
                id:Number(id)
            }
        })
        if(CardItem) {
            res.status(200).json({"msg":"success"})
        }else{
            res.status(404).json({"msg":"Canot Find this Card Item"})
        }
    } catch (error) {
       res.status(500).json({"msg":"Bad request"+error}) 
    }
}