/*
  Warnings:

  - You are about to drop the column `image` on the `commande` table. All the data in the column will be lost.

*/
-- DropIndex
DROP INDEX `client_mdp_key` ON `client`;

-- AlterTable
ALTER TABLE `client` MODIFY `image` VARCHAR(191) NULL DEFAULT 'https://th.bing.com/th/id/OIP.DcifgGr8xOF70qzHb0tmqQAAAA?pid=ImgDet&rs=1';

-- AlterTable
ALTER TABLE `commande` DROP COLUMN `image`;

-- AlterTable
ALTER TABLE `commercant` MODIFY `image` VARCHAR(191) NULL DEFAULT 'https://th.bing.com/th/id/OIP.DcifgGr8xOF70qzHb0tmqQAAAA?pid=ImgDet&rs=1';

-- AlterTable
ALTER TABLE `livreur` ADD COLUMN `image` VARCHAR(191) NULL;
