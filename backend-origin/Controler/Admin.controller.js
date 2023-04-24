import { PrismaClient } from "@prisma/client";
const prisma=new PrismaClient();
import {db} from "../db.configue.js"




//Get All Commande 
export const GetAllCommande=async(req,res)=>{
    try {
        const Commande=await prisma.commande.findMany({
            include:{
                Client:true,
                commercant:true,
                livreur:true   
            }
        })
        if(Commande){
            res.status(200).json(Commande)
        }else{
            res.status(400).json({"msg":"Ooops ! "})
        }
    } catch (error) {
        res.status(500).json({"msg":"Ooops ! "+error})
    }
}
//Get All Commercant 
export const GetAllComercant=async(req,res)=>{
    try {
        const Comercant=await prisma.commercant.findMany({
            where:{
                isActive:true
            },
            include:{
                commande:true
            }
        })
        if(Comercant){
            res.status(200).json(Comercant)
        }else{
            res.status(400).json({"msg":"Ooops ! "})
        }
    } catch (error) {
        res.status(500).json({"msg":"Ooops ! "+error})
    }
}
//Get All Livreur 
export const GetAllLivreur=async(req,res)=>{
    try {
        const livreur=await prisma.livreur.findMany({
            include:{
                _count:{
                    select:{commande:true}
                }
            }
        })
        if(livreur){
            res.json({livreur})
        }else{
            res.status(400).json({"msg":"bad request "})
        }
    } catch (error) {
        res.status(500).json({"msg":"Eroor"+error})
    }
   
}
//Get the last Commande 
export const GetlastCommande=async(req,res)=>{
    try{
         const Commande= await prisma.commande.findMany({
            include:{
                commercant:true,
                Client:true
            },
            take:5
})
    if(Commande){
        res.status(200).json(Commande)
    }else{
        res.status(404).json({"msg": "Not Found"})
    }
    }catch(error){
        res.status(500).send({"msg":error})
    }
   
}
//Get the last Commercant 
export const GetlastCommercant=async(req,res)=>{
    try {
     const Commande="SELECT * FROM `commercant` WHERE isActive=? LIMIT ? "
     db.query(Commande,[true,5],(err,reslt)=>{
        if(reslt){
            res.status(200).json({reslt})
        }
     })
    } catch (error) {
        res.status(500).send({"msg":error})
    }
   
}
//Get Statistique 
export const GetStatique=async(req,res)=>{
    try {
        //const orders = await prisma.commande.findMany();
       const stat=await prisma.commande.groupBy({
        by:["Date_cmd"],
        _count:{
            _all:true,
        }
       })
        res.json({stat})
    } catch (error) {
        res.status(500).json({"msg":"Ooops"+error})
    }
  
      
      
}
//serach product 
export const SearchProduct=async(req,res)=>{
    const { q } = req.query; // Get the search query parameter
       
    try {
     const Product = await prisma.produit.findMany({
      where: {
           nom: { contains: q } 
       
      }
    });
    res.json({Product});
    } catch (error) {
      res.status(500).json({"msg":error})  
    }
   
   
}
//search Commercant 
export const SearchCommercant=async(req,res)=>{
    const  {q}  = req.query;
    
   try {
    const Commercant=await prisma.commercant.findMany({
        where:{
            email:{contains:q }
        },
        include:{
            commande:true
        }
    })
    res.json({Commercant})
   } catch (error) {
    res.status(500).send({"msg":error})
   }
   
}
// add to historique 
export const AddTohistorique=async(req,res)=>{
    const montant=req.body.montant;
    const id=req.params.id
    try {
        const AddTohistorique = "insert into historique (montant,ComId) values (?,?)"
        try {
            db.query(AddTohistorique,[montant,id],async(err, result)=>{
                if(result){
                    const payer= await prisma.commercant.update({
                        where:{
                          id:Number(id) 
                        },
                         data:{
                           Paye:true ,
                           montant_actuelle:0 
                         },  
                     })
                     if(payer){
                        res.json({"msg":"updated with success"})
                     }
                }else{
                    res.status(404).json({"msg":err.message});
                }
            })
        } catch (error) {
            res.status(500).json({"msg":"fama haja "+error})
        }
       
    } catch (error) {
        res.status(500).json({"msg":"fama haja "+error})
    }
    
}
// Get Commercant's Historique By Id
export const CommercantHistorique=async(req,res)=>{
    const id=req.params.id;
    try {
        const ComHist=await prisma.commercant.findUnique({
            include:{
                historique:true
            },
            where:{
               id:Number(id)
            }
        })
        if(ComHist){
            res.status(200).json([ComHist])
        }else{
            res.status(404).send("No historique ")
        }
    } catch (error) {
        res.status(500).send({'msg':"fama haja "+error})
    }
}
//ajouter un Livreur et Modifier l'etat de Commande 
export const Update_commande=async(req,res)=>{
    const id=req.params.id;
    const idliv=req.body.idliv;
    console.log(idliv);
    try {
        const Update_com=await prisma.commande.update({
            where:{
                id:Number(id)
            },
            data:{
                idliv:idliv
            }
        })
            if(Update_com){
                res.status(200).json({"msg":"Livreur Ajouter "})
            }else{
                res.status(400).json({"msg":"ooops livreur ne pas ajouter  ! "})
            }
    } catch (error) {
      res.status(500).json({"msg":"ooops !! "+error})  
    }
}
//Reset l'etat de Commercant 
export const Commercant_Reset=async(req,res)=>{
    const id=req.params.id;
    try {
         const Update_com=await prisma.commercant.update({
        where:{
           id:Number(id)
        },
        data:{
            montant_actuelle:0.0,
            Paye:false

        }
    })
    if(Update_com){
        res.status(200).json(Update_com);
    }else{
        res.status(400).json({"msg":"desolé il ya un erreur  "}); 
    }
    } catch (error) {
        res.status(500).send({"msg":"ooops "+error})
    }
   
}
//Delete Commercant 
export const Delete_com=async(req,res)=>{
    const id=req.params.id
    try {
        const Comercant=await prisma.commercant.update({
            where:{
               id:Number(id)
            },
            data:{
                isActive:false
            }
        })
        if(Comercant){
            res.status(200).send({"msg":"Commercant a eté effacer"})
        }else{
            res.status(400).json({"msg":"Ooops ! je crois qu'il n'ya pas un commercant a ce id  "})
        }
    } catch (error) {
        res.status(500).json({"msg":"Ooops ! "+error})
    }
}
//Add to Objective 
export const AddObjective=async(req,res)=>{
    const {Titel,Description,nbr_defi}=req.body
    try {
        const Add=  "insert into objectif(Titel,Description,nbr_defi) values(?,?,?)";
        db.query(Add,[Titel,Description,nbr_defi],(err,reslt)=>{
            if ( reslt) {
            res.status(200).json("Objective a éte ajouter")
        }else{
            res.status(400).json({"msg":"Oops"+err})
        }
        })
    
        
    } catch (error) {
        res.status(500).json({"msg":"Oops"+error})
    }

}
//Delete Objective 
export const DeleteObjective=async(req,res)=>{
    const id = req.params.id
    try {
        const Objective=await prisma.objectif.delete({
            where:{
                id:parseInt(id)
            }
        })
        if(Objective){
            res.status(200).json({"msg":"Objective a ete Suprimer "})
        }else{
            res.status(404).json({"msg":"Oops !! il ya un probléme"})
        }
        
    } catch (error) {
        res.status(500).json({"msg":"error"+error})
    }
}
//Consulter les Objective 
export const Allobjective=async(req,res)=>{
    try {
        const Objective=await prisma.objectif.findMany({})
        if(Objective){
            res.status(200).json({Objective});
        }else{
            res.status(404).json({"msg":"Aucune Objective trouvé "})
        }
    } catch (error) {
     res.status(500).json({"msg":"Ooops ! "+error})   
    }
}
//Condulter la reclamation de Client 
export const Reclamation =async(req,res)=>{
    try {
        const Reclamation=await prisma.client.findMany({
            include:{
              Rapport:true  
            }
        })
        if(Reclamation){
            res.status(200).json({Reclamation})
        }else{
            res.status(400).json({"msg":"Oops"})
        }
    } catch (error) {
        res.status(500).json({"msg":"Oops"+error})
    }
}
//Get Facture By id 
export const GetFactureById=async(req,res)=>{
   const id=req.params.id;
    try {
        
       const Facture=await prisma.commande.findUnique({
        where:{
            id:Number(id)
        },
        include:{
           Client:true,
           commercant:true,
           facture:true,
           livreur:true,
        }
       }) 
       if(Facture){
        res.status(200).json({Facture})
       }else{
        res.status(404).send({"msg":"Facture not Found "})
       }
    } catch (error) {
        res.status(500).send({"msg":"Oops"+error})
    }
}
//Get Card Item By Id 
export const getCardItem=async(req,res)=>{
    const id=req.params.id;
    try {
        const Card =await prisma.Card.findUnique({
            where:{
                id:Number(id)
            },
            include:{
                cardItem:true
            }
        })
        if(Card){
            res.status(200).json({Card})
        }else{
            res.status(404).json({"msg": "Card not found"})
        }
    } catch (error) {
        res.status(500).json({error:error.message})
    }
    
}
//Delete Product
export const DeleteProduct=async(req,res)=>{
    const id=req.params.id;
    try {
        const product=await prisma.produit.delete({
            where:{
                id:Number(id)
            }
        })
        if(product){
            res.status(200).send({"msg":"produit  a eté effacer"})
        }else{
            res.status(400).json({"msg":"Ooops ! je crois qu'il n'ya pas un produit a ce id  "})
        }
    } catch (error) {
        res.status(500).json({"msg":"Ooops ! "+error})
    }
}
//Get All product 
export const  GetAllProduct=async(req,res)=>{
    try {
        const Product=await prisma.produit.findMany({    
        })
        if(Product){
                res.status(200).json({Product})
            
        }else{
            res.status(400).send({"msg":"Ooops "})
        }
    } catch (error) {
     res.status(500).json({"msg":error})   
    }
}
//Get category By Id 
export const GetCategoryById=async(req,res)=>{
    const id=req.params.id;
    try {
       const Category=await prisma.category.findUnique({
        where:{
            id: Number(id) 
        }
       }) 
       if(Category){
        res.status(200).json(Category)
       }else{
        res.status(404).json({"msg":"Ooops ! je crois qu'il n'ya pas un category a ce id  "})
       }
    } catch (error) {
        res.status(500).json({"msg":"Ooops ! "+error})
    }
}
//Get category 
export const GetCategory=async(req,res)=>{
    try {
       const Category=await prisma.category.findMany({
       }) 
       if(Category){
        res.status(200).json(Category)
       }else{
        res.status(400).json({"msg":"Ooops ! "})
       }
    } catch (error) {
        res.status(500).json({"msg":"Ooops ! "+error})
    }
}
//Get Product By Id 
export const GetProductById=async(req,res)=>{
    const id=req.params.id;
    try {
        const GetProdById=await prisma.produit.findUnique({
            where:{
                id:Number(id)
            }
        })
        if(GetProdById){
            res.status(200).json({GetProdById})
        }else{
            res.status(404).json({"msg":"Ooops ! n'existe pas "})
        }
    } catch (error) {
        res.status(500).json({"msg":"Ooops ! "+error})
    }
}
//Update Produit 
export const UpdateProduit =async(req,res)=>{
    const id=req.params.id;
    const {nom,description,prix,color,pht,pat,remise}=req.body;
    try {
        const UpdateProd=await prisma.produit.update({
            where:{
                id:Number(id)
            },
            data:{
                nom:nom,
                description:description,
                prix:prix,
                color:color,
                pht:pht,
                pat:pat,
                remise:remise

            }
        })
        if(UpdateProd){
            res.status(201).json({"produit a ete Modifier ":UpdateProd})
        }else{
            res.status(400).json({"msg":"Ooops ! n'existe pas  ou Requet invalide "})
        }
        
    } catch (error) {
        res.status(500).json({"msg":"Ooops ! "+error})
    }
}
//Delete Livreur 
export const DeleteLivreur=async(req,res)=>{
    const id=req.params.id;
    try {
        const livreur=await prisma.livreur.delete({
            where:{
                id:Number(id)
            }
        })
        if(livreur){
            res.status(200).json({"msg":"Livreur a ete Suprimer "})
        }else{
            res.status(400).json({"msg":"Ooops Bad Request ... "})
        }
    } catch (error) {
        res.status(500).json({"msg":"Error"+error})
    }
}
//Add Category 
export const AddCategory=async(req,res)=>{
    const category=req.body.category;
    try {
        const Category=await prisma.category.create({
            data:{
                category:category
            }
        })
        if(Category){
            res.status(201).json({Category})
        }else{
            res.status(400).json({"msg":"Ooops Bad Request ... "})
        }
    } catch (error) {
        res.status(500).json({"msg":"Error"+error})
    }
}
//Search livreur 
export const SearchLivreur=async(req,res)=>{
    const  {q}  = req.query;
    
   try {
    const Commercant=await prisma.livreur.findMany({
        where:{
            nomliv:{contains:q }
        },
        include:{
            _count:{
                select:{
                    commande:true
                }
            }
        }
    })
    if(Commercant){
         res.json({Commercant})
    }else{
        res.status(404).json({"msg":"Livreur Not Found "})
    }
   
   } catch (error) {
    res.status(500).send({"msg":error})
   }
   
}
//Get Count of Commercant 
export const CountOfCommercant =async(req,res) => {
    try {
        const TotalCommercant =await prisma.commercant.count({})
        res.json(TotalCommercant)
    } catch (error) {
       res.status(500).json({"message":"Ooops !! "+error })
    }
}
//Get Count Of Commande 
export const CountOfCommande =async(req,res) => {
    try {
        const TotalCommande =await prisma.commande.count({})
        res.json(TotalCommande)
    } catch (error) {
        res.status(500).json({"message":"Ooops !! "+error })  
    }
}
//Get the somme de commande
export const Somme=async(req,res) => {
    try {
        const Somme=await prisma.facture.aggregate({
            _sum:{
                montant:true
            }
        })
        res.json([Somme]);
    } catch (error) {
        res.status(500).json({"message":"Ooops !! "+error })  
    }
}
//Get dispo livreur
export const GetAllLivreurByDespo=async(req,res) => {
        try {
            const livreur=await prisma.livreur.findMany({
                where:{
                    isdispo:true
                },
                include:{
                    _count:{
                        select:{commande:true}
                    }
                }
            })
            if(livreur){
                res.json({livreur})
            }else{
                res.status(400).json({"msg":"bad request "})
            }
        } catch (error) {
            res.status(500).json({"msg":"Eroor"+error})
        }
}
//Get Count Client 
export const getCountClient =async(req,res)=>{
    try {
        const ClientCount =await prisma.client.count({})
        res.json(ClientCount)
    } catch (error) {
        res.status(500).json({"msg":"Something went wrong ! "+error})
    }
}
//Client who Gets Compts 
export const getCompts =async(req,res)=>{
    try {
        const ClientComptsCount =await prisma.compteClient.count({})
        res.json(ClientComptsCount)
    } catch (error) {
        res.status(500).json({"msg":"Something went wrong ! "+error})
    }
}
//Get Commande Payed 
export const getCommandePayed=async(req,res)=>{
    try {
        const CommandePayed=await prisma.commande.count({
            where:{
                ispayed:true
            }
        })
        res.json(CommandePayed);
    } catch (error) {
        res.status(500).json({"msg":"Something went wrong ! "+error})
    }
}
//Get Commande Not payed
export const getCommandNotPayed=async(req,res)=>{
    try {
        const CommandeNPayed=await prisma.commande.count({
            where:{
                ispayed:false
            }
        })
        res.json(CommandeNPayed);
    } catch (error) {
        res.status(500).json({"msg":"Something went wrong ! "+error})
    }
}
//Get Count Commande  of each Commercant 
export const getCountCommandeOfComercant=async(req,res)=>{
    try {
        const count = await prisma.commercant.findMany({
            include:{
                _count:{
                    select:{commande:true}
                }
            }
        })
        res.json(count)
    } catch (error) {
        res.status(500).json({"msg":"Something went wrong ! "+error})
    }
}
//Get les Commandes Livré 
export const getCommandLivre=async(req,res)=>{
    try {
        const count = await prisma.commande.count({
            where:{
                etat:"livré",
            }
        })
        res.json(count)
    } catch (error) {
        res.status(500).json({"msg":"Something went wrong ! "+error})
    }
}
//Get les Commandes Non Livré 
export const getCommandeNotLivre=async(req,res)=>{
    try {
        const count = await prisma.commande.count({
            where:{
                etat:"Confirmer"
            }
        })
        res.json(count)
    } catch (error) {
        res.status(500).json({"msg":"Something went wrong ! "+error})
    }
}
//Get les Commandes en Routes 
export const getCommandeRoute=async(req,res)=>{
    try {
        const count = await prisma.commande.count({
            where:{
                etat:"En_route"
            }
        })
        res.json(count)
    } catch (error) {
        res.status(500).json({"msg":"Something went wrong ! "+error})
    }
}
//Client Commande 
export const clientCommande =async(req,res)=>{
    try {
       const client =await prisma.client.findMany({
        include:{
          commande:true  
        }
       }
       ) 
       res.json(client)
    } catch (error) {
        res.status(500).json({"msg":"Something went wrong ! "+error})
    }
}