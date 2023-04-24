/*
  Warnings:

  - You are about to drop the column `Idproduit` on the `commande` table. All the data in the column will be lost.
  - You are about to drop the column `code` on the `commande` table. All the data in the column will be lost.
  - You are about to drop the column `qte_prod` on the `commande` table. All the data in the column will be lost.
  - A unique constraint covering the columns `[idCard]` on the table `commande` will be added. If there are existing duplicate values, this will fail.
  - Added the required column `idCard` to the `commande` table without a default value. This is not possible if the table is not empty.

*/
-- DropForeignKey
ALTER TABLE `commande` DROP FOREIGN KEY `commande_Idproduit_fkey`;

-- AlterTable
ALTER TABLE `commande` DROP COLUMN `Idproduit`,
    DROP COLUMN `code`,
    DROP COLUMN `qte_prod`,
    ADD COLUMN `idCard` INTEGER NOT NULL,
    MODIFY `Date_cmd` VARCHAR(191) NOT NULL;

-- AlterTable
ALTER TABLE `rapport` ADD COLUMN `Date` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3);

-- CreateTable
CREATE TABLE `CardItem` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `idProduit` INTEGER NOT NULL,
    `qte_produit` INTEGER NOT NULL,
    `Prix` DOUBLE NOT NULL,
    `idCard` INTEGER NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Card` (
    `id` INTEGER NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateIndex
CREATE UNIQUE INDEX `commande_idCard_key` ON `commande`(`idCard`);

-- AddForeignKey
ALTER TABLE `commande` ADD CONSTRAINT `commande_idCard_fkey` FOREIGN KEY (`idCard`) REFERENCES `Card`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `CardItem` ADD CONSTRAINT `CardItem_idProduit_fkey` FOREIGN KEY (`idProduit`) REFERENCES `produit`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `CardItem` ADD CONSTRAINT `CardItem_idCard_fkey` FOREIGN KEY (`idCard`) REFERENCES `Card`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;
