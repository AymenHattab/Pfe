/*
  Warnings:

  - Added the required column `pat` to the `produit` table without a default value. This is not possible if the table is not empty.
  - Added the required column `pht` to the `produit` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE `commande` ADD COLUMN `ispayed` BOOLEAN NOT NULL DEFAULT false,
    MODIFY `Date` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3);

-- AlterTable
ALTER TABLE `facture` MODIFY `date` DATETIME(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3);

-- AlterTable
ALTER TABLE `livreur` ADD COLUMN `isdispo` BOOLEAN NOT NULL DEFAULT true;

-- AlterTable
ALTER TABLE `produit` ADD COLUMN `pat` DOUBLE NOT NULL,
    ADD COLUMN `pht` DOUBLE NOT NULL;
