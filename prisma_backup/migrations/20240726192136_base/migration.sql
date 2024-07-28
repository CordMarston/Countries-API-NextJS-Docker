/*
  Warnings:

  - You are about to drop the `CountryLanguage` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `Language` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropForeignKey
ALTER TABLE `CountryLanguage` DROP FOREIGN KEY `CountryLanguage_detailId_fkey`;

-- DropForeignKey
ALTER TABLE `CountryLanguage` DROP FOREIGN KEY `CountryLanguage_languageId_fkey`;

-- DropTable
DROP TABLE `CountryLanguage`;

-- DropTable
DROP TABLE `Language`;
