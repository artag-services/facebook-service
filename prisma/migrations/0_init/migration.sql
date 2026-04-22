-- Facebook Service Schema Migration

-- CreateEnum: FbMessageStatus
DO $$ BEGIN
    CREATE TYPE "FbMessageStatus" AS ENUM ('PENDING', 'SENT', 'FAILED', 'DELIVERED');
EXCEPTION
    WHEN duplicate_object THEN null;
END $$;

-- CreateTable: FbMessage
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

-- CreateIndex: FbMessage.recipient
CREATE INDEX "FbMessage_recipient_idx" ON "FbMessage" ("recipient");

-- CreateIndex: FbMessage.status
CREATE INDEX "FbMessage_status_idx" ON "FbMessage" ("status");

-- CreateIndex: FbMessage.createdAt
CREATE INDEX "FbMessage_createdAt_idx" ON "FbMessage" ("createdAt");
