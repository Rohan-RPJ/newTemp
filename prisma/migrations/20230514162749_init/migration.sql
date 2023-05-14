-- CreateEnum
CREATE TYPE "Role" AS ENUM ('USER', 'ADMIN');

-- CreateTable
CREATE TABLE "USER_PROFILE" (
    "usr_id" TEXT NOT NULL,
    "email_id" TEXT NOT NULL,
    "fname" TEXT NOT NULL,
    "lname" TEXT,
    "mob_no" TEXT NOT NULL,
    "crtd_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updtd_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "lst_lgn_time" TIMESTAMP(3) NOT NULL,
    "profile_img" TEXT,
    "role" "Role" NOT NULL DEFAULT 'USER',

    CONSTRAINT "USER_PROFILE_pkey" PRIMARY KEY ("usr_id")
);

-- CreateTable
CREATE TABLE "USER_COMPANY_DETAILS" (
    "cmpny_id" TEXT NOT NULL,
    "cmpny_name" TEXT NOT NULL,
    "pymt_trms" TEXT NOT NULL DEFAULT 'SUBJECT TO PALGHAR JURISDICTION ONLY.|GOODS ONCE SOLD WILL NOT BE TAKEN BACK OR ENHANCED|RECEIVED GOODS IN GOOD ORDER AND CONDITION.',
    "crtd_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updtd_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "uSER_PROFILEUsr_id" TEXT NOT NULL,
    "uSER_COMPANY_ADDRAddr_id" TEXT NOT NULL,

    CONSTRAINT "USER_COMPANY_DETAILS_pkey" PRIMARY KEY ("cmpny_id")
);

-- CreateTable
CREATE TABLE "USER_COMPANY_ADDR" (
    "addr_id" TEXT NOT NULL,
    "addr1" TEXT NOT NULL,
    "addr2" TEXT,
    "district" TEXT NOT NULL,
    "pincode" TEXT NOT NULL,
    "cITY_MSTRCity_id" INTEGER NOT NULL,

    CONSTRAINT "USER_COMPANY_ADDR_pkey" PRIMARY KEY ("addr_id")
);

-- CreateTable
CREATE TABLE "USER_BANK_DETAILS" (
    "bnkdtls_id" TEXT NOT NULL,
    "acc_no" TEXT NOT NULL,
    "upi_id" TEXT,
    "upi_qrcode" TEXT,
    "crtd_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updtd_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "uSER_PROFILEUsr_id" TEXT NOT NULL,
    "bANK_BRANCH_MSTRBrnch_id" BIGINT NOT NULL,

    CONSTRAINT "USER_BANK_DETAILS_pkey" PRIMARY KEY ("bnkdtls_id")
);

-- CreateTable
CREATE TABLE "CUST_CMPNY_ADDR_DETAILS" (
    "cust_cmpny_id" TEXT NOT NULL,
    "cmpny_name" TEXT NOT NULL,
    "addr1" TEXT NOT NULL,
    "addr2" TEXT,
    "district" TEXT NOT NULL,
    "pincode" TEXT NOT NULL,
    "cITY_MSTRCity_id" INTEGER NOT NULL,

    CONSTRAINT "CUST_CMPNY_ADDR_DETAILS_pkey" PRIMARY KEY ("cust_cmpny_id")
);

-- CreateTable
CREATE TABLE "INVOICE_DETAILS" (
    "invc_id" TEXT NOT NULL,
    "invc_dt" TIMESTAMP(3) NOT NULL,
    "crtd_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updtd_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "uSER_BANK_DETAILSBnkdtls_id" TEXT NOT NULL,
    "uSER_PROFILEUsr_id" TEXT NOT NULL,
    "uSER_COMPANY_DETAILSCmpny_id" TEXT NOT NULL,
    "cUST_CMPNY_ADDR_DETAILSCust_cmpny_id" TEXT NOT NULL,

    CONSTRAINT "INVOICE_DETAILS_pkey" PRIMARY KEY ("invc_id")
);

-- CreateTable
CREATE TABLE "INVOICE_CUST_PRODUCT_DETAILS" (
    "invc_cust_prod_id" BIGSERIAL NOT NULL,
    "prod_price" DECIMAL(65,30) NOT NULL DEFAULT 0,
    "prod_qty" INTEGER NOT NULL DEFAULT 0,
    "prod_gst_percent" INTEGER NOT NULL DEFAULT 0,
    "uSER_PROD_MSTRProd_id" BIGINT NOT NULL,

    CONSTRAINT "INVOICE_CUST_PRODUCT_DETAILS_pkey" PRIMARY KEY ("invc_cust_prod_id")
);

-- CreateTable
CREATE TABLE "CNTRY_MSTR" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,
    "code" TEXT NOT NULL,
    "crtd_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updtd_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "CNTRY_MSTR_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "STATE_MSTR" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,
    "code" TEXT NOT NULL,
    "crtd_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updtd_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "cNTRY_MSTRCntry_id" INTEGER NOT NULL,

    CONSTRAINT "STATE_MSTR_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "CITY_MSTR" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,
    "crtd_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updtd_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "sTATE_MSTRState_id" INTEGER NOT NULL,
    "cNTRY_MSTRCntry_id" INTEGER NOT NULL,

    CONSTRAINT "CITY_MSTR_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "BANK_MSTR" (
    "bnk_id" SERIAL NOT NULL,
    "bnk_name" TEXT NOT NULL,
    "crtd_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updtd_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "BANK_MSTR_pkey" PRIMARY KEY ("bnk_id")
);

-- CreateTable
CREATE TABLE "BANK_BRANCH_MSTR" (
    "brnch_id" BIGSERIAL NOT NULL,
    "brnch_name" TEXT NOT NULL,
    "ifsc_no" TEXT NOT NULL,
    "crtd_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updtd_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "bANK_MSTRBnk_id" INTEGER NOT NULL,

    CONSTRAINT "BANK_BRANCH_MSTR_pkey" PRIMARY KEY ("brnch_id")
);

-- CreateTable
CREATE TABLE "USER_PROD_MSTR" (
    "prod_id" BIGSERIAL NOT NULL,
    "prod_name" TEXT NOT NULL,
    "prod_desc" TEXT,
    "uSER_PROFILEUsr_id" TEXT NOT NULL,

    CONSTRAINT "USER_PROD_MSTR_pkey" PRIMARY KEY ("prod_id")
);

-- CreateTable
CREATE TABLE "_CUST_CMPNY_ADDR_DETAILSToUSER_PROFILE" (
    "A" TEXT NOT NULL,
    "B" TEXT NOT NULL
);

-- CreateTable
CREATE TABLE "_INVOICE_CUST_PRODUCT_DETAILSToINVOICE_DETAILS" (
    "A" BIGINT NOT NULL,
    "B" TEXT NOT NULL
);

-- CreateTable
CREATE TABLE "_USER_PROD_MSTRToUSER_PROFILE" (
    "A" BIGINT NOT NULL,
    "B" TEXT NOT NULL
);

-- CreateIndex
CREATE UNIQUE INDEX "USER_PROFILE_email_id_key" ON "USER_PROFILE"("email_id");

-- CreateIndex
CREATE UNIQUE INDEX "USER_COMPANY_DETAILS_uSER_COMPANY_ADDRAddr_id_key" ON "USER_COMPANY_DETAILS"("uSER_COMPANY_ADDRAddr_id");

-- CreateIndex
CREATE UNIQUE INDEX "_CUST_CMPNY_ADDR_DETAILSToUSER_PROFILE_AB_unique" ON "_CUST_CMPNY_ADDR_DETAILSToUSER_PROFILE"("A", "B");

-- CreateIndex
CREATE INDEX "_CUST_CMPNY_ADDR_DETAILSToUSER_PROFILE_B_index" ON "_CUST_CMPNY_ADDR_DETAILSToUSER_PROFILE"("B");

-- CreateIndex
CREATE UNIQUE INDEX "_INVOICE_CUST_PRODUCT_DETAILSToINVOICE_DETAILS_AB_unique" ON "_INVOICE_CUST_PRODUCT_DETAILSToINVOICE_DETAILS"("A", "B");

-- CreateIndex
CREATE INDEX "_INVOICE_CUST_PRODUCT_DETAILSToINVOICE_DETAILS_B_index" ON "_INVOICE_CUST_PRODUCT_DETAILSToINVOICE_DETAILS"("B");

-- CreateIndex
CREATE UNIQUE INDEX "_USER_PROD_MSTRToUSER_PROFILE_AB_unique" ON "_USER_PROD_MSTRToUSER_PROFILE"("A", "B");

-- CreateIndex
CREATE INDEX "_USER_PROD_MSTRToUSER_PROFILE_B_index" ON "_USER_PROD_MSTRToUSER_PROFILE"("B");

-- AddForeignKey
ALTER TABLE "USER_COMPANY_DETAILS" ADD CONSTRAINT "USER_COMPANY_DETAILS_uSER_PROFILEUsr_id_fkey" FOREIGN KEY ("uSER_PROFILEUsr_id") REFERENCES "USER_PROFILE"("usr_id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "USER_COMPANY_DETAILS" ADD CONSTRAINT "USER_COMPANY_DETAILS_uSER_COMPANY_ADDRAddr_id_fkey" FOREIGN KEY ("uSER_COMPANY_ADDRAddr_id") REFERENCES "USER_COMPANY_ADDR"("addr_id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "USER_COMPANY_ADDR" ADD CONSTRAINT "USER_COMPANY_ADDR_cITY_MSTRCity_id_fkey" FOREIGN KEY ("cITY_MSTRCity_id") REFERENCES "CITY_MSTR"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "USER_BANK_DETAILS" ADD CONSTRAINT "USER_BANK_DETAILS_uSER_PROFILEUsr_id_fkey" FOREIGN KEY ("uSER_PROFILEUsr_id") REFERENCES "USER_PROFILE"("usr_id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "USER_BANK_DETAILS" ADD CONSTRAINT "USER_BANK_DETAILS_bANK_BRANCH_MSTRBrnch_id_fkey" FOREIGN KEY ("bANK_BRANCH_MSTRBrnch_id") REFERENCES "BANK_BRANCH_MSTR"("brnch_id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "CUST_CMPNY_ADDR_DETAILS" ADD CONSTRAINT "CUST_CMPNY_ADDR_DETAILS_cITY_MSTRCity_id_fkey" FOREIGN KEY ("cITY_MSTRCity_id") REFERENCES "CITY_MSTR"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "INVOICE_DETAILS" ADD CONSTRAINT "INVOICE_DETAILS_uSER_BANK_DETAILSBnkdtls_id_fkey" FOREIGN KEY ("uSER_BANK_DETAILSBnkdtls_id") REFERENCES "USER_BANK_DETAILS"("bnkdtls_id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "INVOICE_DETAILS" ADD CONSTRAINT "INVOICE_DETAILS_uSER_PROFILEUsr_id_fkey" FOREIGN KEY ("uSER_PROFILEUsr_id") REFERENCES "USER_PROFILE"("usr_id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "INVOICE_DETAILS" ADD CONSTRAINT "INVOICE_DETAILS_uSER_COMPANY_DETAILSCmpny_id_fkey" FOREIGN KEY ("uSER_COMPANY_DETAILSCmpny_id") REFERENCES "USER_COMPANY_DETAILS"("cmpny_id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "INVOICE_DETAILS" ADD CONSTRAINT "INVOICE_DETAILS_cUST_CMPNY_ADDR_DETAILSCust_cmpny_id_fkey" FOREIGN KEY ("cUST_CMPNY_ADDR_DETAILSCust_cmpny_id") REFERENCES "CUST_CMPNY_ADDR_DETAILS"("cust_cmpny_id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "INVOICE_CUST_PRODUCT_DETAILS" ADD CONSTRAINT "INVOICE_CUST_PRODUCT_DETAILS_uSER_PROD_MSTRProd_id_fkey" FOREIGN KEY ("uSER_PROD_MSTRProd_id") REFERENCES "USER_PROD_MSTR"("prod_id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "STATE_MSTR" ADD CONSTRAINT "STATE_MSTR_cNTRY_MSTRCntry_id_fkey" FOREIGN KEY ("cNTRY_MSTRCntry_id") REFERENCES "CNTRY_MSTR"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "CITY_MSTR" ADD CONSTRAINT "CITY_MSTR_sTATE_MSTRState_id_fkey" FOREIGN KEY ("sTATE_MSTRState_id") REFERENCES "STATE_MSTR"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "CITY_MSTR" ADD CONSTRAINT "CITY_MSTR_cNTRY_MSTRCntry_id_fkey" FOREIGN KEY ("cNTRY_MSTRCntry_id") REFERENCES "CNTRY_MSTR"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "BANK_BRANCH_MSTR" ADD CONSTRAINT "BANK_BRANCH_MSTR_bANK_MSTRBnk_id_fkey" FOREIGN KEY ("bANK_MSTRBnk_id") REFERENCES "BANK_MSTR"("bnk_id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_CUST_CMPNY_ADDR_DETAILSToUSER_PROFILE" ADD CONSTRAINT "_CUST_CMPNY_ADDR_DETAILSToUSER_PROFILE_A_fkey" FOREIGN KEY ("A") REFERENCES "CUST_CMPNY_ADDR_DETAILS"("cust_cmpny_id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_CUST_CMPNY_ADDR_DETAILSToUSER_PROFILE" ADD CONSTRAINT "_CUST_CMPNY_ADDR_DETAILSToUSER_PROFILE_B_fkey" FOREIGN KEY ("B") REFERENCES "USER_PROFILE"("usr_id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_INVOICE_CUST_PRODUCT_DETAILSToINVOICE_DETAILS" ADD CONSTRAINT "_INVOICE_CUST_PRODUCT_DETAILSToINVOICE_DETAILS_A_fkey" FOREIGN KEY ("A") REFERENCES "INVOICE_CUST_PRODUCT_DETAILS"("invc_cust_prod_id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_INVOICE_CUST_PRODUCT_DETAILSToINVOICE_DETAILS" ADD CONSTRAINT "_INVOICE_CUST_PRODUCT_DETAILSToINVOICE_DETAILS_B_fkey" FOREIGN KEY ("B") REFERENCES "INVOICE_DETAILS"("invc_id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_USER_PROD_MSTRToUSER_PROFILE" ADD CONSTRAINT "_USER_PROD_MSTRToUSER_PROFILE_A_fkey" FOREIGN KEY ("A") REFERENCES "USER_PROD_MSTR"("prod_id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "_USER_PROD_MSTRToUSER_PROFILE" ADD CONSTRAINT "_USER_PROD_MSTRToUSER_PROFILE_B_fkey" FOREIGN KEY ("B") REFERENCES "USER_PROFILE"("usr_id") ON DELETE CASCADE ON UPDATE CASCADE;
