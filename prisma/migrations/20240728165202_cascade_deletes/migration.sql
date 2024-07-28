-- CreateTable
CREATE TABLE "Country" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "country_name" TEXT NOT NULL,
    "code" TEXT NOT NULL,
    "createdAt" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" DATETIME NOT NULL
);

-- CreateTable
CREATE TABLE "Region" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "region_name" TEXT NOT NULL
);

-- CreateTable
CREATE TABLE "RegionCountry" (
    "countryId" INTEGER NOT NULL,
    "regionId" INTEGER NOT NULL,

    PRIMARY KEY ("countryId", "regionId"),
    CONSTRAINT "RegionCountry_countryId_fkey" FOREIGN KEY ("countryId") REFERENCES "Country" ("id") ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT "RegionCountry_regionId_fkey" FOREIGN KEY ("regionId") REFERENCES "Region" ("id") ON DELETE RESTRICT ON UPDATE CASCADE
);

-- CreateTable
CREATE TABLE "CountryDetail" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "countryId" INTEGER NOT NULL,
    "latlng" TEXT NOT NULL,
    "population" INTEGER NOT NULL,
    CONSTRAINT "CountryDetail_countryId_fkey" FOREIGN KEY ("countryId") REFERENCES "Country" ("id") ON DELETE RESTRICT ON UPDATE CASCADE
);

-- CreateTable
CREATE TABLE "Language" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "language_name" TEXT NOT NULL
);

-- CreateTable
CREATE TABLE "CountryLanguage" (
    "detailId" INTEGER NOT NULL,
    "languageId" INTEGER NOT NULL,

    PRIMARY KEY ("detailId", "languageId"),
    CONSTRAINT "CountryLanguage_detailId_fkey" FOREIGN KEY ("detailId") REFERENCES "CountryDetail" ("id") ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT "CountryLanguage_languageId_fkey" FOREIGN KEY ("languageId") REFERENCES "Language" ("id") ON DELETE RESTRICT ON UPDATE CASCADE
);

-- CreateIndex
CREATE UNIQUE INDEX "Country_country_name_key" ON "Country"("country_name");

-- CreateIndex
CREATE UNIQUE INDEX "Region_region_name_key" ON "Region"("region_name");

-- CreateIndex
CREATE UNIQUE INDEX "CountryDetail_countryId_key" ON "CountryDetail"("countryId");

-- CreateIndex
CREATE UNIQUE INDEX "Language_language_name_key" ON "Language"("language_name");
