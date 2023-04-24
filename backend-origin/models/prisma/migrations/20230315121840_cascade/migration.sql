-- DropForeignKey
ALTER TABLE `client` DROP FOREIGN KEY `client_idCom_fkey`;

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
ALTER TABLE `produit` DROP FOREIGN KEY `produit_idcategory_fkey`;

-- DropForeignKey
ALTER TABLE `rapport` DROP FOREIGN KEY `Rapport_CliId_fkey`;

-- AddForeignKey
ALTER TABLE `commande` ADD CONSTRAINT `commande_ComId_fkey` FOREIGN KEY (`ComId`) REFERENCES `commercant`(`Id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `commande` ADD CONSTRAINT `commande_Idproduit_fkey` FOREIGN KEY (`Idproduit`) REFERENCES `produit`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `commande` ADD CONSTRAINT `commande_CliId_fkey` FOREIGN KEY (`CliId`) REFERENCES `client`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `commande` ADD CONSTRAINT `commande_idliv_fkey` FOREIGN KEY (`idliv`) REFERENCES `livreur`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `facture` ADD CONSTRAINT `facture_code_cmd_fkey` FOREIGN KEY (`code_cmd`) REFERENCES `commande`(`id_cmd`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `produit` ADD CONSTRAINT `produit_idcategory_fkey` FOREIGN KEY (`idcategory`) REFERENCES `Category`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `client` ADD CONSTRAINT `client_idCom_fkey` FOREIGN KEY (`idCom`) REFERENCES `commercant`(`Id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Rapport` ADD CONSTRAINT `Rapport_CliId_fkey` FOREIGN KEY (`CliId`) REFERENCES `client`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;
