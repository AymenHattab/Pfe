-- CreateTable
CREATE TABLE `Admin` (
    `UserName` VARCHAR(191) NOT NULL,
    `Password` VARCHAR(191) NULL,
    `image` VARCHAR(191) NOT NULL,

    PRIMARY KEY (`UserName`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `commercant` (
    `Id` INTEGER NOT NULL AUTO_INCREMENT,
    `Nom` VARCHAR(191) NOT NULL,
    `prenom` VARCHAR(191) NOT NULL,
    `email` VARCHAR(191) NOT NULL,
    `phone` VARCHAR(191) NOT NULL,
    `mdp` VARCHAR(191) NULL,
    `benificier` INTEGER NULL DEFAULT 10,
    `montant_actuelle` DOUBLE NULL DEFAULT 0,

    UNIQUE INDEX `commercant_email_key`(`email`),
    PRIMARY KEY (`Id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `historique` (
    `Id` INTEGER NOT NULL AUTO_INCREMENT,
    `Date` DATETIME(3) NOT NULL,
    `montant` DOUBLE NOT NULL,
    `ComId` INTEGER NULL,

    PRIMARY KEY (`Id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `objectif` (
    `Id` INTEGER NOT NULL AUTO_INCREMENT,
    `Titel` VARCHAR(191) NOT NULL,
    `Description` VARCHAR(191) NOT NULL,

    PRIMARY KEY (`Id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Com_objective` (
    `Idobj` INTEGER NOT NULL,
    `ComId` INTEGER NOT NULL,
    `Score` INTEGER NOT NULL,

    UNIQUE INDEX `Com_objective_Idobj_key`(`Idobj`),
    UNIQUE INDEX `Com_objective_ComId_key`(`ComId`),
    PRIMARY KEY (`Idobj`, `ComId`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `commande` (
    `code` VARCHAR(191) NOT NULL,
    `Date` DATETIME(3) NOT NULL,
    `qte_prod` INTEGER NOT NULL,
    `etat` VARCHAR(191) NOT NULL,
    `Adress` JSON NOT NULL,
    `ComId` INTEGER NULL,
    `Idproduit` INTEGER NULL,
    `CliId` INTEGER NULL,
    `idliv` INTEGER NULL,

    PRIMARY KEY (`code`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `facture` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `date` DATETIME(3) NOT NULL,
    `montant` DOUBLE NOT NULL,
    `code_cmd` VARCHAR(191) NOT NULL,

    UNIQUE INDEX `facture_code_cmd_key`(`code_cmd`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `produit` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `nom` VARCHAR(191) NOT NULL,
    `description` VARCHAR(191) NOT NULL,
    `prix` DOUBLE NOT NULL,
    `color` VARCHAR(191) NOT NULL,
    `idcategory` INTEGER NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Category` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `category` VARCHAR(191) NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `client` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `nom` VARCHAR(191) NOT NULL,
    `prenom` VARCHAR(191) NOT NULL,
    `email` VARCHAR(191) NOT NULL,
    `phone` VARCHAR(191) NOT NULL,
    `mdp` VARCHAR(191) NOT NULL,
    `idCom` INTEGER NOT NULL,

    UNIQUE INDEX `client_email_key`(`email`),
    UNIQUE INDEX `client_mdp_key`(`mdp`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `livreur` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `nom` VARCHAR(191) NOT NULL,
    `prenom` VARCHAR(191) NOT NULL,
    `email` VARCHAR(191) NOT NULL,
    `phone` VARCHAR(191) NOT NULL,
    `mdp` VARCHAR(191) NOT NULL,

    UNIQUE INDEX `livreur_email_key`(`email`),
    UNIQUE INDEX `livreur_mdp_key`(`mdp`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- AddForeignKey
ALTER TABLE `historique` ADD CONSTRAINT `historique_ComId_fkey` FOREIGN KEY (`ComId`) REFERENCES `commercant`(`Id`) ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Com_objective` ADD CONSTRAINT `Com_objective_Idobj_fkey` FOREIGN KEY (`Idobj`) REFERENCES `objectif`(`Id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Com_objective` ADD CONSTRAINT `Com_objective_ComId_fkey` FOREIGN KEY (`ComId`) REFERENCES `commercant`(`Id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `commande` ADD CONSTRAINT `commande_ComId_fkey` FOREIGN KEY (`ComId`) REFERENCES `commercant`(`Id`) ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `commande` ADD CONSTRAINT `commande_Idproduit_fkey` FOREIGN KEY (`Idproduit`) REFERENCES `produit`(`id`) ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `commande` ADD CONSTRAINT `commande_CliId_fkey` FOREIGN KEY (`CliId`) REFERENCES `client`(`id`) ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `commande` ADD CONSTRAINT `commande_idliv_fkey` FOREIGN KEY (`idliv`) REFERENCES `livreur`(`id`) ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `facture` ADD CONSTRAINT `facture_code_cmd_fkey` FOREIGN KEY (`code_cmd`) REFERENCES `commande`(`code`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `produit` ADD CONSTRAINT `produit_idcategory_fkey` FOREIGN KEY (`idcategory`) REFERENCES `Category`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `client` ADD CONSTRAINT `client_idCom_fkey` FOREIGN KEY (`idCom`) REFERENCES `commercant`(`Id`) ON DELETE RESTRICT ON UPDATE CASCADE;
