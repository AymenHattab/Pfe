/*
  Warnings:

  - The primary key for the `commercant` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - You are about to drop the column `Id` on the `commercant` table. All the data in the column will be lost.
  - Added the required column `id` to the `commercant` table without a default value. This is not possible if the table is not empty.

*/
-- DropForeignKey
ALTER TABLE `client` DROP FOREIGN KEY `client_idCom_fkey`;

-- DropForeignKey
ALTER TABLE `com_objective` DROP FOREIGN KEY `Com_objective_ComId_fkey`;

-- DropForeignKey
ALTER TABLE `commande` DROP FOREIGN KEY `commande_ComId_fkey`;

-- DropForeignKey
ALTER TABLE `historique` DROP FOREIGN KEY `historique_ComId_fkey`;

-- AlterTable
ALTER TABLE `commercant` DROP PRIMARY KEY,
    DROP COLUMN `Id`,
    ADD COLUMN `id` INTEGER NOT NULL AUTO_INCREMENT,
    ADD PRIMARY KEY (`id`);

-- AddForeignKey
ALTER TABLE `historique` ADD CONSTRAINT `historique_ComId_fkey` FOREIGN KEY (`ComId`) REFERENCES `commercant`(`id`) ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Com_objective` ADD CONSTRAINT `Com_objective_ComId_fkey` FOREIGN KEY (`ComId`) REFERENCES `commercant`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `commande` ADD CONSTRAINT `commande_ComId_fkey` FOREIGN KEY (`ComId`) REFERENCES `commercant`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `client` ADD CONSTRAINT `client_idCom_fkey` FOREIGN KEY (`idCom`) REFERENCES `commercant`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;
