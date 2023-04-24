/*
  Warnings:

  - Added the required column `nbr_defi` to the `objectif` table without a default value. This is not possible if the table is not empty.

*/
-- DropIndex
DROP INDEX `Admin_Password_key` ON `admin`;

-- DropIndex
DROP INDEX `commercant_mdp_key` ON `commercant`;

-- AlterTable
ALTER TABLE `admin` MODIFY `image` VARCHAR(191) NULL;

-- AlterTable
ALTER TABLE `client` ADD COLUMN `image` VARCHAR(191) NULL;

-- AlterTable
ALTER TABLE `commande` ADD COLUMN `image` VARCHAR(191) NULL DEFAULT '',
    MODIFY `Adress` VARCHAR(191) NOT NULL;

-- AlterTable
ALTER TABLE `commercant` ADD COLUMN `image` VARCHAR(191) NULL DEFAULT '';

-- AlterTable
ALTER TABLE `historique` MODIFY `Date` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3);

-- AlterTable
ALTER TABLE `objectif` ADD COLUMN `nbr_defi` INTEGER NOT NULL;

-- CreateTable
CREATE TABLE `Rapport` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `Content` VARCHAR(191) NOT NULL,
    `CliId` INTEGER NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- AddForeignKey
ALTER TABLE `Rapport` ADD CONSTRAINT `Rapport_CliId_fkey` FOREIGN KEY (`CliId`) REFERENCES `client`(`id`) ON DELETE SET NULL ON UPDATE CASCADE;
