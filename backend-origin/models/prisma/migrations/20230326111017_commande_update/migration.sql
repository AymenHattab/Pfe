/*
  Warnings:

  - The primary key for the `commande` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - You are about to drop the column `id_cmd` on the `commande` table. All the data in the column will be lost.
  - You are about to drop the column `Adress` on the `commercant` table. All the data in the column will be lost.
  - You are about to drop the column `nom` on the `livreur` table. All the data in the column will be lost.
  - You are about to drop the column `prenom` on the `livreur` table. All the data in the column will be lost.
  - Added the required column `id` to the `commande` table without a default value. This is not possible if the table is not empty.
  - Added the required column `adress` to the `livreur` table without a default value. This is not possible if the table is not empty.
  - Added the required column `nomliv` to the `livreur` table without a default value. This is not possible if the table is not empty.
  - Added the required column `prenomliv` to the `livreur` table without a default value. This is not possible if the table is not empty.

*/
-- DropForeignKey
ALTER TABLE `facture` DROP FOREIGN KEY `facture_code_cmd_fkey`;

-- AlterTable
ALTER TABLE `client` MODIFY `id` INTEGER NOT NULL;

-- AlterTable
ALTER TABLE `commande` DROP PRIMARY KEY,
    DROP COLUMN `id_cmd`,
    ADD COLUMN `id` INTEGER NOT NULL,
    ADD PRIMARY KEY (`id`);

-- AlterTable
ALTER TABLE `commercant` DROP COLUMN `Adress`,
    MODIFY `image` VARCHAR(191) NULL DEFAULT '';

-- AlterTable
ALTER TABLE `compteclient` MODIFY `image` VARCHAR(191) NULL DEFAULT '';

-- AlterTable
ALTER TABLE `livreur` DROP COLUMN `nom`,
    DROP COLUMN `prenom`,
    ADD COLUMN `adress` VARCHAR(191) NOT NULL,
    ADD COLUMN `nomliv` VARCHAR(191) NOT NULL,
    ADD COLUMN `prenomliv` VARCHAR(191) NOT NULL,
    MODIFY `image` VARCHAR(191) NULL DEFAULT '';

-- AddForeignKey
ALTER TABLE `facture` ADD CONSTRAINT `facture_code_cmd_fkey` FOREIGN KEY (`code_cmd`) REFERENCES `commande`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;
