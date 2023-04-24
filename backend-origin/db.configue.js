
import sql from "mysql2"

//configuration base de donnee 
export const db= sql.createPool({
    host:"localhost",
    user:"root",
    password:"",
    database:"hgedb01"
})
