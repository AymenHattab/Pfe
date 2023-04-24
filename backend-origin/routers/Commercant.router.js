import  express from "express";
const router=express.Router()
import {
       getAllComercantwithhistorique,
       getclient_Commande,
       AllObjective,
       AddFacture,
       GetAllFacture,
       GetFactureById,
       SearchProduct,
       Commercant_Update,
       AddCommande,
       DeleteCommande,
       GetAllCategory,
       GetAllProduct,
       addClient,
       updateImage,
       getCardInfo,
       AddCardItem,
       addCard,
       deleteCardItem,
 
} from "../Controler/Commercant.controller.js";

//get the client of commercant
//get the commande of commercant
//get the score of commercant 
//get the historique of commercant
router.get("/commercant/:id",getAllComercantwithhistorique)
//get the commande of client by id 
router.get("/client/commande",getclient_Commande)
//get All  objective 
router.get("/objectif",AllObjective)

//Get All facture 
router.get("/facture",GetAllFacture)
//Get Facture By Id 
router.get("/facture/:id",GetFactureById)
//Add New Facture 
router.post("/facture",AddFacture)
//Search Product 
router.get("/product/search",SearchProduct)
//Update the Commercant State 
router.put("/comercant/update/:id",Commercant_Update)
//Add Commande 
router.post("/commande",AddCommande)
//delete Commande 
router.delete("/commande",DeleteCommande)
//Get All Category 
router.get("/category",GetAllCategory)
//Get All Produit By Id 
router.get("/produit/:idc",GetAllProduct)
//Add Client 
router.post("/client",addClient)
//Commercant Image Update
router.put("/commercant/:id",updateImage)
//Add Card 
router.post("/commercant/card",addCard)
//Add Card Item to card 
router.post("/commercant/cardItem",AddCardItem)
//Get Card information 
router.get("/cardInfo/:id",getCardInfo)
//Delete Card Intem from Card 
router.delete("/cardItem/:id",deleteCardItem)
export default router;