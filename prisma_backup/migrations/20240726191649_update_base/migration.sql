/*
  Warnings:

  - You are about to drop the column `createdAt` on the `Region` table. All the data in the column will be lost.
  - You are about to drop the column `updatedAt` on the `Region` table. All the data in the column will be lost.
  - You are about to drop the `CountryDetails` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `CountryLanguages` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropForeignKey
ALTER TABLE `Country` DROP FOREIGN KEY `Country_id_fkey`;

-- DropForeignKey
ALTER TABLE `CountryLanguages` DROP FOREIGN KEY `CountryLanguages_detailId_fkey`;

-- AlterTable
ALTER TABLE `Region` DROP COLUMN `createdAt`,
    DROP COLUMN `updatedAt`;

-- DropTable
DROP TABLE `CountryDetails`;

-- DropTable
DROP TABLE `CountryLanguages`;

-- CreateTable
CREATE TABLE `CountryDetail` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `countryId` INTEGER NOT NULL,
    `latlng` VARCHAR(191) NOT NULL,
    `population` INTEGER NOT NULL,

    UNIQUE INDEX `CountryDetail_countryId_key`(`countryId`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Language` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `language_name` VARCHAR(191) NOT NULL,

    UNIQUE INDEX `Language_language_name_key`(`language_name`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `CountryLanguage` (
    `detailId` INTEGER NOT NULL,
    `languageId` INTEGER NOT NULL,

    PRIMARY KEY (`detailId`, `languageId`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- AddForeignKey
ALTER TABLE `Country` ADD CONSTRAINT `Country_id_fkey` FOREIGN KEY (`id`) REFERENCES `CountryDetail`(`countryId`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `CountryLanguage` ADD CONSTRAINT `CountryLanguage_detailId_fkey` FOREIGN KEY (`detailId`) REFERENCES `CountryDetail`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `CountryLanguage` ADD CONSTRAINT `CountryLanguage_languageId_fkey` FOREIGN KEY (`languageId`) REFERENCES `Language`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;
