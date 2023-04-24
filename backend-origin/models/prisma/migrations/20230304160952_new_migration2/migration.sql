-- DropForeignKey
ALTER TABLE `client` DROP FOREIGN KEY `client_idCom_fkey`;

-- DropForeignKey
ALTER TABLE `com_objective` DROP FOREIGN KEY `Com_objective_ComId_fkey`;

-- DropForeignKey
ALTER TABLE `com_objective` DROP FOREIGN KEY `Com_objective_Idobj_fkey`;

-- DropForeignKey
ALTER TABLE `commande` DROP FOREIGN KEY `commande_CliId_fkey`;

-- DropForeignKey
ALTER TABLE `commande` DROP FOREIGN KEY `commande_ComId_fkey`;

-- DropForeignKey
ALTER TABLE `commande` DROP FOREIGN KEY `commande_Idproduit_fkey`;

-- DropForeignKey
ALTER TABLE `commande` DROP FOREIGN KEY `commande_idliv_fkey`;

-- DropForeignKey
ALTER TABLE `facture` DROP FOREIGN KEY `facture_code_cmd_fkey`;

-- DropForeignKey
ALTER TABLE `historique` DROP FOREIGN KEY `historique_ComId_fkey`;

-- DropForeignKey
ALTER TABLE `produit` DROP FOREIGN KEY `produit_idcategory_fkey`;
