-- RedefineTables
PRAGMA defer_foreign_keys=ON;
PRAGMA foreign_keys=OFF;
CREATE TABLE "new_CountryDetail" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "countryId" INTEGER NOT NULL,
    "latlng" TEXT NOT NULL,
    "population" INTEGER NOT NULL,
    CONSTRAINT "CountryDetail_countryId_fkey" FOREIGN KEY ("countryId") REFERENCES "Country" ("id") ON DELETE CASCADE ON UPDATE CASCADE
);
INSERT INTO "new_CountryDetail" ("countryId", "id", "latlng", "population") SELECT "countryId", "id", "latlng", "population" FROM "CountryDetail";
DROP TABLE "CountryDetail";
ALTER TABLE "new_CountryDetail" RENAME TO "CountryDetail";
CREATE UNIQUE INDEX "CountryDetail_countryId_key" ON "CountryDetail"("countryId");
CREATE TABLE "new_CountryLanguage" (
    "detailId" INTEGER NOT NULL,
    "languageId" INTEGER NOT NULL,

    PRIMARY KEY ("detailId", "languageId"),
    CONSTRAINT "CountryLanguage_detailId_fkey" FOREIGN KEY ("detailId") REFERENCES "CountryDetail" ("id") ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT "CountryLanguage_languageId_fkey" FOREIGN KEY ("languageId") REFERENCES "Language" ("id") ON DELETE CASCADE ON UPDATE CASCADE
);
INSERT INTO "new_CountryLanguage" ("detailId", "languageId") SELECT "detailId", "languageId" FROM "CountryLanguage";
DROP TABLE "CountryLanguage";
ALTER TABLE "new_CountryLanguage" RENAME TO "CountryLanguage";
CREATE TABLE "new_RegionCountry" (
    "countryId" INTEGER NOT NULL,
    "regionId" INTEGER NOT NULL,

    PRIMARY KEY ("countryId", "regionId"),
    CONSTRAINT "RegionCountry_countryId_fkey" FOREIGN KEY ("countryId") REFERENCES "Country" ("id") ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT "RegionCountry_regionId_fkey" FOREIGN KEY ("regionId") REFERENCES "Region" ("id") ON DELETE CASCADE ON UPDATE CASCADE
);
INSERT INTO "new_RegionCountry" ("countryId", "regionId") SELECT "countryId", "regionId" FROM "RegionCountry";
DROP TABLE "RegionCountry";
ALTER TABLE "new_RegionCountry" RENAME TO "RegionCountry";
PRAGMA foreign_keys=ON;
PRAGMA defer_foreign_keys=OFF;
