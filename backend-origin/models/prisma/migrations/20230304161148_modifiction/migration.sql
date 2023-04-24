/*
  Warnings:

  - A unique constraint covering the columns `[Password]` on the table `Admin` will be added. If there are existing duplicate values, this will fail.
  - A unique constraint covering the columns `[mdp]` on the table `commercant` will be added. If there are existing duplicate values, this will fail.
  - Made the column `Password` on table `admin` required. This step will fail if there are existing NULL values in that column.
  - Made the column `mdp` on table `commercant` required. This step will fail if there are existing NULL values in that column.

*/
-- DropIndex
DROP INDEX `client_idCom_fkey` ON `client`;

-- DropIndex
DROP INDEX `commande_CliId_fkey` ON `commande`;

-- DropIndex
DROP INDEX `commande_ComId_fkey` ON `commande`;

-- DropIndex
DROP INDEX `commande_Idproduit_fkey` ON `commande`;

-- DropIndex
DROP INDEX `commande_idliv_fkey` ON `commande`;

-- DropIndex
DROP INDEX `historique_ComId_fkey` ON `historique`;

-- DropIndex
DROP INDEX `produit_idcategory_fkey` ON `produit`;

-- AlterTable
ALTER TABLE `admin` MODIFY `Password` VARCHAR(191) NOT NULL;

-- AlterTable
ALTER TABLE `commercant` MODIFY `mdp` VARCHAR(191) NOT NULL;

-- CreateIndex
CREATE UNIQUE INDEX `Admin_Password_key` ON `Admin`(`Password`);

-- CreateIndex
CREATE UNIQUE INDEX `commercant_mdp_key` ON `commercant`(`mdp`);

-- AddForeignKey
ALTER TABLE `historique` ADD CONSTRAINT `historique_ComId_fkey` FOREIGN KEY (`ComId`) REFERENCES `commercant`(`Id`) ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Com_objective` ADD CONSTRAINT `Com_objective_Idobj_fkey` FOREIGN KEY (`Idobj`) REFERENCES `objectif`(`Id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Com_objective` ADD CONSTRAINT `Com_objective_ComId_fkey` FOREIGN KEY (`ComId`) REFERENCES `commercant`(`Id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `commande` ADD CONSTRAINT `commande_ComId_fkey` FOREIGN KEY (`ComId`) REFERENCES `commercant`(`Id`) ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `commande` ADD CONSTRAINT `commande_Idproduit_fkey` FOREIGN KEY (`Idproduit`) REFERENCES `produit`(`id`) ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `commande` ADD CONSTRAINT `commande_CliId_fkey` FOREIGN KEY (`CliId`) REFERENCES `client`(`id`) ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `commande` ADD CONSTRAINT `commande_idliv_fkey` FOREIGN KEY (`idliv`) REFERENCES `livreur`(`id`) ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `facture` ADD CONSTRAINT `facture_code_cmd_fkey` FOREIGN KEY (`code_cmd`) REFERENCES `commande`(`code`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `produit` ADD CONSTRAINT `produit_idcategory_fkey` FOREIGN KEY (`idcategory`) REFERENCES `Category`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `client` ADD CONSTRAINT `client_idCom_fkey` FOREIGN KEY (`idCom`) REFERENCES `commercant`(`Id`) ON DELETE RESTRICT ON UPDATE CASCADE;
