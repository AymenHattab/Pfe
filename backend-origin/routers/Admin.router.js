import  express from "express";
const router=express.Router();
import Cloudinary from "../Cloudinary.js";
import {GetlastCommande,
        GetlastCommercant,
         GetStatique,
         SearchProduct,
         SearchCommercant,
         AddTohistorique,
         CommercantHistorique,
         Update_commande,
         Commercant_Reset,
         GetAllCommande,
         GetAllComercant,
         Delete_com,
         AddObjective,
         Reclamation,
         Allobjective,
         GetFactureById,
         DeleteProduct,
         GetAllProduct,
         GetCategory,
         GetCategoryById,
         GetProductById,
         UpdateProduit,
         DeleteObjective,
         GetAllLivreur,
         DeleteLivreur,
         AddCategory,
         SearchLivreur,
         CountOfCommande,
         CountOfCommercant,
         Somme,
         GetAllLivreurByDespo,
         getCardItem,
         getCompts,
         getCountClient,
         getCommandePayed,
         getCommandNotPayed,
         getCountCommandeOfComercant,
         getCommandLivre,
         getCommandeRoute,
         getCommandeNotLivre,
         clientCommande
         
} from "../Controler/Admin.controller.js";
import { PrismaClient } from "@prisma/client";
const prisma=new PrismaClient();
import multer from "multer";
import {db} from "../db.configue.js"
var filename="";
//Upload File 
const mystorage=multer.diskStorage({
    destination:"../Uploads",
    filename:(req,file,redirect)=>{
        let date= Date.now();
        let f1=date+"."+file.mimetype.split("/")[1];
        redirect(null,f1)
        filename=f1;
    }
})



//Get last Commande 
router.get("/admin/lastCommande",GetlastCommande)
//Get last Commercant
router.get("/admin/lastCommercant",GetlastCommercant)
//Get All Livreur 
router.get("/admin/livreur",GetAllLivreur)
//Get Statique 
router.get("/admin/stats",GetStatique)
//Search Product 
router.get("/admin/search",SearchProduct)
//Search Commercant 
router.get("/admin/Csearch",SearchCommercant)
//Add to historique
router.post("/admin/historique/:id",AddTohistorique)
//Get the Commercant Historique 
router.get("/admin/Chistorique/:id",CommercantHistorique)
//Update the Commande State 
router.put("/admin/commande/:id",Update_commande)
//Reset the Commercant State 
router.put("/admin/commercant/reset/:id",Commercant_Reset)
//Get All Commande 
router.get("/admin/Commande",GetAllCommande)
//Get All Commercant 
router.get("/admin/Comercant",GetAllComercant)
//Delete Commercant 
router.delete("/admin/comercant/:id",Delete_com)
//Add Objective 
router.post("/admin/objective",AddObjective)
//Get All Client's Reclamation
router.get("/admin/Reclamation",Reclamation)
//Get All Objective
router.get("/admin/AllObjective",Allobjective)
//delete objective 
router.delete("/admin/objective/:id",DeleteObjective)
//Get Facture By Id 
router.get("/admin/facture/:id",GetFactureById)
//add product 
router.post("/admin/produit",multer({storage:mystorage}).single("image"),async(req,res)=>{
        const {nom,description,prix,color,pht,image,pat,remise,idcategory}=req.body
        try {
            console.log(image)
            if(image){
             const UpoadResponse= await Cloudinary.uploader.upload(image,{
                    upload_preset:"productUpload"
                })
                if(UpoadResponse){
                    const imageProduct=UpoadResponse.secure_url
                    const Product="insert into produit (nom,description,prix,color,image,pht,pat,remise,idcategory)values (?,?,?,?,?,?,?,?,?)"
                    db.query(Product,[nom,description,prix,color,imageProduct,pht,pat,remise,idcategory],(err,reslt)=>{
                     if(reslt){
                         res.status(201).json({"msg":"Produit a eté ajouter avec Sucsses "})
                     }else{
                         res.status(400).json({"msg":err})
                     }
                    })
                }
            }else{
                res.status(400).json({"msg":"Product Not Uploaded  "})
            }
           
        } catch (error) {
            res.status(500).json({"Ooops":error})

            
        } })
//Get All product 
router.get("/admin/produit",GetAllProduct)
//Delete Product 
router.delete("/admin/product/:id",DeleteProduct)
//get   Category by Id 
router.get("/admin/category/:id",GetCategoryById)
//get All category 
router.get("/admin/category",GetCategory)
//Get Product By Id
router.get("/admin/produit/:id",GetProductById)
//Update Product 
router.put("/admin/produit/:id",UpdateProduit)
//Delete livreur 
router.delete("/admin/livreur/:id",DeleteLivreur)
//Add Category 
router.post("/admin/category",AddCategory)
//Search livreur 
router.get("/admin/Lsearch",SearchLivreur)
//Get Count of commercant
router.get("/admin/Countcommercant",CountOfCommercant)
//Get Count of commande
router.get("/admin/CountCommande",CountOfCommande)
//Get Somme of commande
router.get("/admin/somme",Somme)
//Get livreur By Dispo 
router.get("/admin/livreurBydispo",GetAllLivreurByDespo)
//Get CardItem 
router.get("/admin/cardItem/:id",getCardItem)
//Get Count Client 
router.get("/admin/countClient",getCountClient)
//Get Count Client Acount 
router.get("/admin/countCompt",getCompts)
//Get Commande Payed 
router.get("/admin/CommandePayed",getCommandePayed)
//Get Commande Not Payed 
router.get("/admin/CommandeNotPayed",getCommandNotPayed)
//Get count Commande of each Commercant 
router.get("/admin/CommandeCount",getCountCommandeOfComercant)
//Get count les Commande livré 
router.get("/admin/CommandeLivre",getCommandLivre)
//Get Count les Commande livrer 
router.get("/admin/CommandeEnRout",getCommandeRoute)
//Get Count les Command not livrer
router.get("/admin/CommandeC",getCommandeNotLivre)
router.get("/admin/ClientCommande",clientCommande)
export default router;