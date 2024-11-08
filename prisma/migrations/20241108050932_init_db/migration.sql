-- CreateEnum
CREATE TYPE "cashmap_categoryType" AS ENUM ('HOUSING', 'TRANSPORTATION', 'FOOD', 'ENTERTAINMENT', 'HEALTH', 'UTILITY', 'SALARY', 'EDUCATION', 'OTHER');

-- CreateEnum
CREATE TYPE "cashmap_transactionType" AS ENUM ('EXPENSIVE', 'REVENUE', 'INVESTIMENT');

-- CreateEnum
CREATE TYPE "cashmap_paymentType" AS ENUM ('PIX', 'DEBITCARD', 'CREDITCARD', 'BANKSLIP', 'BANKTRANSFER', 'OTHER');

-- CreateTable
CREATE TABLE "cashmap_user" (
    "id" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "nickname" TEXT NOT NULL,
    "email" TEXT NOT NULL,
    "subscription" TEXT NOT NULL,

    CONSTRAINT "cashmap_user_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "cashmap_transactions" (
    "id" TEXT NOT NULL,
    "userId" TEXT NOT NULL,
    "title" TEXT NOT NULL,
    "cash" DECIMAL(10,2) NOT NULL,
    "category" "cashmap_categoryType" NOT NULL,
    "type" "cashmap_transactionType" NOT NULL,
    "payment" "cashmap_paymentType" NOT NULL,
    "date" TIMESTAMP(3) NOT NULL,
    "createAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updateAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "cashmap_transactions_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "cashmap_user_nickname_key" ON "cashmap_user"("nickname");

-- CreateIndex
CREATE UNIQUE INDEX "cashmap_user_email_key" ON "cashmap_user"("email");

-- CreateIndex
CREATE UNIQUE INDEX "cashmap_transactions_userId_key" ON "cashmap_transactions"("userId");

-- AddForeignKey
ALTER TABLE "cashmap_transactions" ADD CONSTRAINT "cashmap_transactions_userId_fkey" FOREIGN KEY ("userId") REFERENCES "cashmap_user"("id") ON DELETE CASCADE ON UPDATE CASCADE;
