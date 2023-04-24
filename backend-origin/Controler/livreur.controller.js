import { PrismaClient } from "@prisma/client";
const prisma=new PrismaClient();

//Get All Commande 
export const GetAllCommande=async(req,res)=>{
    try {
        const Commande= await prisma.livreur.findMany({
            include:{
                commande:true
            }
        })
        if(Commande){
            res.status(200).json({"le Commande Trouve est":Commande})
        }else{
            res.status(400).json({"msg":"Ooops "})
        }
    } catch (error) {
        res.status(500).json({"msg":"Ooops"+error})
    }
}
//Update his State 
export const UpdateState=async(req,res)=>{
    try {
       const State=await prisma.livreur.update({
        where:{
            id:req.body.id
        },
        data:{
            isdispo:req.body.isdispo
        }
       }) 
       if(State){
        res.status(201).json(State)
       }else{
        res.status(404).json({"msg":"Ooops "})
       }
    } catch (error) {
        res.status(500).json({"msg":"Ooops "+error})
    }
}
//Update Commande's Livrer State
export const UpdateCommandeState=async(req,res)=>{
    try{
        const Update_commande=await prisma.commande.update({
            where:{
                code:req.body.code
            },
            data:{
                etat:"livrer"
            }
        })
        if(Update_commande){
            res.status(201).json(Update_commande)
        }else{
            res.status(404).send({"msg":"no Commande Found "})
        }
    }catch(error){
        res.status(500).json({"msg":"Ooops"+error})
    }
}
//Update Commande En_route State
export const updateCommande=async(req,res) => {
    try {
        const Update_commande=await prisma.commande.update({
            where:{
                code:req.body.code
            },
            data:{
                etat:"en_route"
            }
        })
        if(Update_commande){
            res.status(201).json(Update_commande)
        }else{
            res.status(404).send({"msg":"no Commande Found "})
        }
    } catch (error) {
        res.status(500).json({"msg":"Ooops"+error})
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
        const Id=req.params.id ;
        const FacturById=prisma.facture.findUnique({
            where:{
                id: Number(Id) 
            }
        })
        if (await FacturById.length>0) {
            res.status(200).json(await FacturById)
        }else{
            res.status(200).json({"msg":"Aucune Facture "})
        }
    } catch (error) {
        res.status(500).json({"msg":"Ooops !"+error})
    }
}
//Get Commande By Commande 
export const GetCommandeById=async(req,res)=>{
    try {
        const CommandeById=await prisma.commande.findUnique({
            where:{
                code:req.body.code
            },
            include:{
                produit:true
            }
        })
        if (CommandeById) {
           res.status(200).json(CommandeById) 
        }else{
            res.status(404).json({"msg":"Commande Not Found "})
        }
        
    } catch (error) {
        res.status(500).json({"Ooops":error})
    }
}
