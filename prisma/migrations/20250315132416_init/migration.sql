-- CreateTable
CREATE TABLE "Users" (
    "userId" UUID NOT NULL DEFAULT gen_random_uuid(),
    "userName" VARCHAR(50) NOT NULL,
    "passwordHash" VARCHAR(255) NOT NULL,
    "email" VARCHAR(50) NOT NULL,
    "role" VARCHAR(20) NOT NULL,
    "createdAt" TIMESTAMPTZ,

    CONSTRAINT "Users_pkey" PRIMARY KEY ("userId")
);

-- CreateTable
CREATE TABLE "Vendors" (
    "vendorId" UUID NOT NULL DEFAULT gen_random_uuid(),
    "vendorName" VARCHAR(50) NOT NULL,
    "imageUrl" VARCHAR(255),
    "createdAt" TIMESTAMPTZ,

    CONSTRAINT "Vendors_pkey" PRIMARY KEY ("vendorId")
);

-- CreateTable
CREATE TABLE "Menus" (
    "menuId" UUID NOT NULL DEFAULT gen_random_uuid(),
    "vendorId" UUID NOT NULL,
    "menuName" VARCHAR(50) NOT NULL,
    "menuDesc" TEXT,
    "price" DECIMAL(15,2) NOT NULL,
    "imageUrl" VARCHAR(255),
    "isAvailable" BOOLEAN NOT NULL DEFAULT false,
    "createdAt" TIMESTAMPTZ,

    CONSTRAINT "Menus_pkey" PRIMARY KEY ("menuId")
);

-- CreateTable
CREATE TABLE "Orders" (
    "orderId" UUID NOT NULL DEFAULT gen_random_uuid(),
    "userId" UUID NOT NULL,
    "vendorId" UUID NOT NULL,
    "totalPrice" DECIMAL(15,2) NOT NULL,
    "status" VARCHAR(20),
    "createdAt" TIMESTAMPTZ,
    "updatedAt" TIMESTAMPTZ,

    CONSTRAINT "Orders_pkey" PRIMARY KEY ("orderId")
);

-- AddForeignKey
ALTER TABLE "Menus" ADD CONSTRAINT "Menus_vendorId_fkey" FOREIGN KEY ("vendorId") REFERENCES "Vendors"("vendorId") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Orders" ADD CONSTRAINT "Orders_userId_fkey" FOREIGN KEY ("userId") REFERENCES "Users"("userId") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Orders" ADD CONSTRAINT "Orders_vendorId_fkey" FOREIGN KEY ("vendorId") REFERENCES "Vendors"("vendorId") ON DELETE CASCADE ON UPDATE CASCADE;
