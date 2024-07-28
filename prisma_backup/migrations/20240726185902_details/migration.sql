-- CreateTable
CREATE TABLE `CountryDetails` (
    `id` INTEGER NOT NULL AUTO_INCREMENT,
    `countryId` INTEGER NOT NULL,
    `latlng` VARCHAR(191) NOT NULL,
    `population` INTEGER NOT NULL,

    UNIQUE INDEX `CountryDetails_countryId_key`(`countryId`),
    PRIMARY KEY (`id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- AddForeignKey
ALTER TABLE `Country` ADD CONSTRAINT `Country_id_fkey` FOREIGN KEY (`id`) REFERENCES `CountryDetails`(`countryId`) ON DELETE RESTRICT ON UPDATE CASCADE;
