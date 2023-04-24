/*
  Warnings:

  - You are about to drop the column `Date` on the `commande` table. All the data in the column will be lost.
  - Added the required column `Adress` to the `commercant` table without a default value. This is not possible if the table is not empty.
  - Added the required column `image` to the `produit` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE `commande` DROP COLUMN `Date`,
    ADD COLUMN `Date_cmd` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    MODIFY `etat` VARCHAR(191) NOT NULL DEFAULT 'Confirmer';

-- AlterTable
ALTER TABLE `commercant` ADD COLUMN `Adress` VARCHAR(191) NOT NULL,
    ADD COLUMN `Paye` BOOLEAN NOT NULL DEFAULT false;

-- AlterTable
ALTER TABLE `produit` ADD COLUMN `image` VARCHAR(191) NOT NULL;
