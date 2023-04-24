/*
  Warnings:

  - You are about to drop the column `email` on the `client` table. All the data in the column will be lost.
  - You are about to drop the column `image` on the `client` table. All the data in the column will be lost.
  - You are about to drop the column `mdp` on the `client` table. All the data in the column will be lost.

*/
-- DropIndex
DROP INDEX `client_email_key` ON `client`;

-- AlterTable
ALTER TABLE `client` DROP COLUMN `email`,
    DROP COLUMN `image`,
    DROP COLUMN `mdp`;

-- AlterTable
ALTER TABLE `commercant` ADD COLUMN `isActive` BOOLEAN NOT NULL DEFAULT true;

-- CreateTable
CREATE TABLE `CompteClient` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `email` VARCHAR(191) NOT NULL,
    `image` VARCHAR(191) NULL DEFAULT 'https://th.bing.com/th/id/OIP.DcifgGr8xOF70qzHb0tmqQAAAA?pid=ImgDet&rs=1',
    `mdp` VARCHAR(191) NOT NULL,
    `CliId` INTEGER NULL,

    UNIQUE INDEX `CompteClient_email_key`(`email`),
    UNIQUE INDEX `CompteClient_CliId_key`(`CliId`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- AddForeignKey
ALTER TABLE `CompteClient` ADD CONSTRAINT `CompteClient_CliId_fkey` FOREIGN KEY (`CliId`) REFERENCES `client`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;
