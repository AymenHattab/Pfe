/*
  Warnings:

  - The primary key for the `commande` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - You are about to drop the column `Adress` on the `commande` table. All the data in the column will be lost.
  - You are about to alter the column `code_cmd` on the `facture` table. The data in that column could be lost. The data in that column will be cast from `VarChar(191)` to `Int`.
  - A unique constraint covering the columns `[code]` on the table `commande` will be added. If there are existing duplicate values, this will fail.
  - Added the required column `id_cmd` to the `commande` table without a default value. This is not possible if the table is not empty.
  - Added the required column `lat` to the `commande` table without a default value. This is not possible if the table is not empty.
  - Added the required column `long` to the `commande` table without a default value. This is not possible if the table is not empty.

*/
-- DropForeignKey
ALTER TABLE `facture` DROP FOREIGN KEY `facture_code_cmd_fkey`;

-- DropIndex
DROP INDEX `livreur_mdp_key` ON `livreur`;

-- AlterTable
ALTER TABLE `commande` DROP PRIMARY KEY,
    DROP COLUMN `Adress`,
    ADD COLUMN `id_cmd` INTEGER NOT NULL,
    ADD COLUMN `lat` DOUBLE NOT NULL,
    ADD COLUMN `long` DOUBLE NOT NULL,
    ADD PRIMARY KEY (`id_cmd`);

-- AlterTable
ALTER TABLE `facture` MODIFY `code_cmd` INTEGER NOT NULL;

-- CreateIndex
CREATE UNIQUE INDEX `commande_code_key` ON `commande`(`code`);

-- AddForeignKey
ALTER TABLE `facture` ADD CONSTRAINT `facture_code_cmd_fkey` FOREIGN KEY (`code_cmd`) REFERENCES `commande`(`id_cmd`) ON DELETE RESTRICT ON UPDATE CASCADE;
