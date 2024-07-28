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
ALTER TABLE `CountryLanguage` ADD CONSTRAINT `CountryLanguage_detailId_fkey` FOREIGN KEY (`detailId`) REFERENCES `CountryDetail`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `CountryLanguage` ADD CONSTRAINT `CountryLanguage_languageId_fkey` FOREIGN KEY (`languageId`) REFERENCES `Language`(`id`) ON DELETE RESTRICT ON UPDATE CASCADE;
