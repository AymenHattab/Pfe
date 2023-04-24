/*
  Warnings:

  - The primary key for the `historique` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - You are about to drop the column `Id` on the `historique` table. All the data in the column will be lost.
  - The primary key for the `objectif` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - You are about to drop the column `Id` on the `objectif` table. All the data in the column will be lost.
  - Made the column `Idproduit` on table `commande` required. This step will fail if there are existing NULL values in that column.
  - Added the required column `id` to the `historique` table without a default value. This is not possible if the table is not empty.
  - Added the required column `id` to the `objectif` table without a default value. This is not possible if the table is not empty.

*/
-- DropForeignKey
ALTER TABLE `com_objective` DROP FOREIGN KEY `Com_objective_Idobj_fkey`;

-- DropForeignKey
ALTER TABLE `commande` DROP FOREIGN KEY `commande_Idproduit_fkey`;

-- AlterTable
ALTER TABLE `commande` MODIFY `Idproduit` INTEGER NOT NULL;

-- AlterTable
ALTER TABLE `historique` DROP PRIMARY KEY,
    DROP COLUMN `Id`,
    ADD COLUMN `id` INTEGER NOT NULL AUTO_INCREMENT,
    ADD PRIMARY KEY (`id`);

-- AlterTable
ALTER TABLE `objectif` DROP PRIMARY KEY,
    DROP COLUMN `Id`,
    ADD COLUMN `id` INTEGER NOT NULL AUTO_INCREMENT,
    ADD PRIMARY KEY (`id`);

-- AddForeignKey
ALTER TABLE `Com_objective` ADD CONSTRAINT `Com_objective_Idobj_fkey` FOREIGN KEY (`Idobj`) REFERENCES `objectif`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `commande` ADD CONSTRAINT `commande_Idproduit_fkey` FOREIGN KEY (`Idproduit`) REFERENCES `produit`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;
