-- CreateTable
CREATE TABLE `CountryLanguages` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `detailId` INTEGER NOT NULL,
    `language_name` VARCHAR(191) NOT NULL,

    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- AddForeignKey
ALTER TABLE `CountryLanguages` ADD CONSTRAINT `CountryLanguages_detailId_fkey` FOREIGN KEY (`detailId`) REFERENCES `CountryDetails`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;
