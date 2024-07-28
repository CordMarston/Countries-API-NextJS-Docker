-- DropForeignKey
ALTER TABLE `Country` DROP FOREIGN KEY `Country_id_fkey`;

-- AddForeignKey
ALTER TABLE `CountryDetail` ADD CONSTRAINT `CountryDetail_countryId_fkey` FOREIGN KEY (`countryId`) REFERENCES `Country`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;
