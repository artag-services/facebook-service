-- CreateEnum: FbMessageStatus
DO $$ BEGIN
    CREATE TYPE "FbMessageStatus" AS ENUM ('PENDING', 'SENT', 'FAILED');
EXCEPTION
    WHEN duplicate_object THEN null;
END $$;

-- CreateFbMessage
CREATE TABLE "FbMessage" (
    "id" TEXT NOT NULL,
    "messageId" TEXT NOT NULL,
    "recipient" TEXT NOT NULL,
    "body" TEXT NOT NULL,
    "mediaUrl" TEXT,
    "status" "FbMessageStatus" NOT NULL DEFAULT 'PENDING',
    "fbMessageId" TEXT,
    "errorReason" TEXT,
    "sentAt" TIMESTAMP(3),
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,
    CONSTRAINT "FbMessage_pkey" PRIMARY KEY ("id")
);

-- CreateIndex: FbMessage.messageId
CREATE UNIQUE INDEX "FbMessage_messageId_key" ON "FbMessage" ("messageId");