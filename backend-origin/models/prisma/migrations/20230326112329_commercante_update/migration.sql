/*
  Warnings:

  - Added the required column `Adress` to the `commercant` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE `commercant` ADD COLUMN `Adress` VARCHAR(191) NOT NULL,
    MODIFY `image` VARCHAR(191) NULL DEFAULT 'https://th.bing.com/th/id/OIP.DcifgGr8xOF70qzHb0tmqQAAAA?pid=ImgDet&rs=1';
