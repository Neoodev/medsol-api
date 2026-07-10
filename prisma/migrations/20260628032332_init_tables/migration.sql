-- CreateSchema
CREATE SCHEMA
IF NOT EXISTS "inventory";

-- CreateSchema
CREATE SCHEMA
IF NOT EXISTS "medicine";

-- CreateSchema
CREATE SCHEMA
IF NOT EXISTS "modules";

-- CreateSchema
CREATE SCHEMA
IF NOT EXISTS "sales";

-- CreateTable
CREATE TABLE "modules"."Module"
(
    "id" SERIAL NOT NULL,
    "name" VARCHAR(50) NOT NULL,
    "description" VARCHAR(150) NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedat" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "Module_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "modules"."SubModule"
(
    "id" SERIAL NOT NULL,
    "name" VARCHAR(50) NOT NULL,
    "description" VARCHAR(150) NOT NULL,
    "moduleId" INTEGER NOT NULL,

    CONSTRAINT "SubModule_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "medicine"."Medicine"
(
    "id" SERIAL NOT NULL,
    "barCode" TEXT,
    "itemCode" TEXT NOT NULL,
    "manuFacturer" TEXT,
    "purchaseDate" TIMESTAMP(3),
    "serialNumber" TEXT,
    "productionDate" TIMESTAMP(3),
    "fileId" INTEGER,
    "categoryId" INTEGER NOT NULL,
    "pharmacologicId" INTEGER NOT NULL,
    "genericId" INTEGER NOT NULL,
    "brandId" INTEGER NOT NULL,
    "medicineSalesInfoIdId" INTEGER NOT NULL,
    "inventoryId" INTEGER NOT NULL,
    "unitId" INTEGER NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedat" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "Medicine_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "medicine"."Pharmacologic"
(
    "id" SERIAL NOT NULL,
    "name" VARCHAR(50) NOT NULL,
    "description" VARCHAR(150) NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedat" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "Pharmacologic_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "medicine"."Category"
(
    "id" SERIAL NOT NULL,
    "name" VARCHAR(50) NOT NULL,
    "description" VARCHAR(150) NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedat" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "Category_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "medicine"."Generic"
(
    "id" SERIAL NOT NULL,
    "name" VARCHAR(50) NOT NULL,
    "description" VARCHAR(150) NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedat" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "Generic_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "medicine"."Brand"
(
    "id" SERIAL NOT NULL,
    "name" VARCHAR(50) NOT NULL,
    "description" VARCHAR(150) NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedat" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "Brand_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "medicine"."Unit"
(
    "id" SERIAL NOT NULL,
    "name" VARCHAR(50) NOT NULL,
    "description" VARCHAR(150) NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedat" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "Unit_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "inventory"."Inventory"
(
    "id" SERIAL NOT NULL,
    "inventoryStatusId" INTEGER NOT NULL,
    "qty" INTEGER NOT NULL,
    "section" TEXT NOT NULL,
    "expirynDate" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "Inventory_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "inventory"."InventoryStatus"
(
    "id" SERIAL NOT NULL,
    "name" VARCHAR(50) NOT NULL,
    "description" VARCHAR(150) NOT NULL,

    CONSTRAINT "InventoryStatus_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "sales"."Sales"
(
    "id" SERIAL NOT NULL,
    "receiptNo" TEXT NOT NULL,
    "totalAmount" DECIMAL(65,30) NOT NULL,
    "cashier" TEXT NOT NULL,
    "amountTendered" DECIMAL(65,30) NOT NULL,
    "change" DECIMAL(65,30) NOT NULL,
    "paymentId" INTEGER NOT NULL,
    "fileId" INTEGER NOT NULL,
    "purchaseate" TIMESTAMP(3) NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedat" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "Sales_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "sales"."SalesPurchaseItem"
(
    "id" SERIAL NOT NULL,
    "itemCode" TEXT NOT NULL,
    "qty" INTEGER NOT NULL,
    "unitPrice" DECIMAL(65,30) NOT NULL,
    "total" DECIMAL(65,30) NOT NULL,
    "subTotal" DECIMAL(65,30) NOT NULL,
    "note" TEXT NOT NULL,
    "salesId" INTEGER NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedat" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "SalesPurchaseItem_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "sales"."Payment"
(
    "id" SERIAL NOT NULL,
    "name" VARCHAR(50) NOT NULL,
    "description" VARCHAR(150) NOT NULL,
    "eWalletId" INTEGER NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedat" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "Payment_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "sales"."EWallet"
(
    "id" SERIAL NOT NULL,
    "name" VARCHAR(50) NOT NULL,
    "description" VARCHAR(150) NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedat" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "EWallet_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "sales"."MedicineSalesInfo"
(
    "id" SERIAL NOT NULL,
    "purchasePrice" DECIMAL(65,30) NOT NULL,
    "sellingPrice" DECIMAL(65,30) NOT NULL,
    "discountId" INTEGER NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedat" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "MedicineSalesInfo_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "sales"."Discount"
(
    "id" SERIAL NOT NULL,
    "name" VARCHAR(50) NOT NULL,
    "description" VARCHAR(150) NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedat" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "Discount_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "medicine"."FileType"
(
    "id" SERIAL NOT NULL,
    "name" VARCHAR(50) NOT NULL,
    "description" VARCHAR(150) NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedat" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "FileType_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "medicine"."File"
(
    "id" SERIAL NOT NULL,
    "fileName" TEXT NOT NULL,
    "objectKey" TEXT NOT NULL,
    "url" TEXT NOT NULL,
    "fileTypeId" INTEGER NOT NULL,
    "description" TEXT,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "File_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE INDEX "Medicine_barCode_idx" ON "medicine"."Medicine"("barCode");

-- CreateIndex
CREATE INDEX "Medicine_itemCode_idx" ON "medicine"."Medicine"("itemCode");

-- CreateIndex
CREATE INDEX "Medicine_categoryId_idx" ON "medicine"."Medicine"("categoryId");

-- CreateIndex
CREATE INDEX "Medicine_pharmacologicId_idx" ON "medicine"."Medicine"("pharmacologicId");

-- CreateIndex
CREATE INDEX "Medicine_genericId_idx" ON "medicine"."Medicine"("genericId");

-- CreateIndex
CREATE INDEX "Medicine_brandId_idx" ON "medicine"."Medicine"("brandId");

-- CreateIndex
CREATE INDEX "Medicine_medicineSalesInfoIdId_idx" ON "medicine"."Medicine"("medicineSalesInfoIdId");

-- CreateIndex
CREATE INDEX "Medicine_inventoryId_idx" ON "medicine"."Medicine"("inventoryId");

-- CreateIndex
CREATE INDEX "Medicine_unitId_idx" ON "medicine"."Medicine"("unitId");

-- CreateIndex
CREATE UNIQUE INDEX "Sales_receiptNo_key" ON "sales"."Sales"("receiptNo");

-- CreateIndex
CREATE INDEX "Sales_receiptNo_idx" ON "sales"."Sales"("receiptNo");

-- CreateIndex
CREATE UNIQUE INDEX "File_objectKey_key" ON "medicine"."File"("objectKey");

-- CreateIndex
CREATE INDEX "File_fileTypeId_idx" ON "medicine"."File"("fileTypeId");

-- CreateIndex
CREATE INDEX "File_createdAt_idx" ON "medicine"."File"("createdAt");

-- AddForeignKey
ALTER TABLE "modules"."SubModule" ADD CONSTRAINT "SubModule_moduleId_fkey" FOREIGN KEY ("moduleId") REFERENCES "modules"."Module"("id")
ON DELETE RESTRICT ON
UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "medicine"."Medicine" ADD CONSTRAINT "Medicine_fileId_fkey" FOREIGN KEY ("fileId") REFERENCES "medicine"."File"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "medicine"."Medicine" ADD CONSTRAINT "Medicine_categoryId_fkey" FOREIGN KEY ("categoryId") REFERENCES "medicine"."Category"("id")
ON DELETE RESTRICT ON
UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "medicine"."Medicine" ADD CONSTRAINT "Medicine_pharmacologicId_fkey" FOREIGN KEY ("pharmacologicId") REFERENCES "medicine"."Pharmacologic"("id")
ON DELETE RESTRICT ON
UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "medicine"."Medicine" ADD CONSTRAINT "Medicine_genericId_fkey" FOREIGN KEY ("genericId") REFERENCES "medicine"."Generic"("id")
ON DELETE RESTRICT ON
UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "medicine"."Medicine" ADD CONSTRAINT "Medicine_brandId_fkey" FOREIGN KEY ("brandId") REFERENCES "medicine"."Brand"("id")
ON DELETE RESTRICT ON
UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "medicine"."Medicine" ADD CONSTRAINT "Medicine_medicineSalesInfoIdId_fkey" FOREIGN KEY ("medicineSalesInfoIdId") REFERENCES "sales"."MedicineSalesInfo"("id")
ON DELETE RESTRICT ON
UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "medicine"."Medicine" ADD CONSTRAINT "Medicine_inventoryId_fkey" FOREIGN KEY ("inventoryId") REFERENCES "inventory"."Inventory"("id")
ON DELETE RESTRICT ON
UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "medicine"."Medicine" ADD CONSTRAINT "Medicine_unitId_fkey" FOREIGN KEY ("unitId") REFERENCES "medicine"."Unit"("id")
ON DELETE RESTRICT ON
UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "inventory"."Inventory" ADD CONSTRAINT "Inventory_inventoryStatusId_fkey" FOREIGN KEY ("inventoryStatusId") REFERENCES "inventory"."InventoryStatus"("id")
ON DELETE RESTRICT ON
UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "sales"."Sales" ADD CONSTRAINT "Sales_paymentId_fkey" FOREIGN KEY ("paymentId") REFERENCES "sales"."Payment"("id")
ON DELETE RESTRICT ON
UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "sales"."Sales" ADD CONSTRAINT "Sales_fileId_fkey" FOREIGN KEY ("fileId") REFERENCES "medicine"."File"("id")
ON DELETE RESTRICT ON
UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "sales"."SalesPurchaseItem" ADD CONSTRAINT "SalesPurchaseItem_salesId_fkey" FOREIGN KEY ("salesId") REFERENCES "sales"."Sales"("id")
ON DELETE RESTRICT ON
UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "sales"."Payment" ADD CONSTRAINT "Payment_eWalletId_fkey" FOREIGN KEY ("eWalletId") REFERENCES "sales"."EWallet"("id")
ON DELETE RESTRICT ON
UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "sales"."MedicineSalesInfo" ADD CONSTRAINT "MedicineSalesInfo_discountId_fkey" FOREIGN KEY ("discountId") REFERENCES "sales"."Discount"("id")
ON DELETE RESTRICT ON
UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "medicine"."File" ADD CONSTRAINT "File_fileTypeId_fkey" FOREIGN KEY ("fileTypeId") REFERENCES "medicine"."FileType"("id")
ON DELETE RESTRICT ON
UPDATE CASCADE;
