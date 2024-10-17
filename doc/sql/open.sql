
PRAGMA foreign_keys = false;

-- ----------------------------
-- Table structure for alembic_version
-- ----------------------------
DROP TABLE IF EXISTS "alembic_version";
CREATE TABLE alembic_version (
	version_num VARCHAR(32) NOT NULL, 
	CONSTRAINT alembic_version_pkc PRIMARY KEY (version_num)
);

-- ----------------------------
-- Table structure for auth
-- ----------------------------
DROP TABLE IF EXISTS "auth";
CREATE TABLE "auth" ("id" VARCHAR(255) NOT NULL, "email" VARCHAR(255) NOT NULL, "password" TEXT NOT NULL NOT NULL, "active" INTEGER NOT NULL);

-- ----------------------------
-- Table structure for chat
-- ----------------------------
DROP TABLE IF EXISTS "chat";
CREATE TABLE "chat" ("id" VARCHAR(255) NOT NULL, "user_id" VARCHAR(255) NOT NULL, "title" TEXT NOT NULL NOT NULL, "chat" TEXT NOT NULL, "share_id" VARCHAR(255), "archived" INTEGER NOT NULL, "created_at" DATETIME NOT NULL NOT NULL, "updated_at" DATETIME NOT NULL NOT NULL);

-- ----------------------------
-- Table structure for chatidtag
-- ----------------------------
DROP TABLE IF EXISTS "chatidtag";
CREATE TABLE "chatidtag" ("id" VARCHAR(255) NOT NULL, "tag_name" VARCHAR(255) NOT NULL, "chat_id" VARCHAR(255) NOT NULL, "user_id" VARCHAR(255) NOT NULL, "timestamp" INTEGER NOT NULL NOT NULL);

-- ----------------------------
-- Table structure for config
-- ----------------------------
DROP TABLE IF EXISTS "config";
CREATE TABLE config (
	id INTEGER NOT NULL, 
	data JSON NOT NULL, 
	version INTEGER NOT NULL, 
	created_at DATETIME DEFAULT (CURRENT_TIMESTAMP) NOT NULL, 
	updated_at DATETIME DEFAULT (CURRENT_TIMESTAMP), 
	PRIMARY KEY (id)
);

-- ----------------------------
-- Table structure for document
-- ----------------------------
DROP TABLE IF EXISTS "document";
CREATE TABLE "document" ("id" INTEGER NOT NULL PRIMARY KEY, "collection_name" VARCHAR(255) NOT NULL, "name" VARCHAR(255) NOT NULL, "title" TEXT NOT NULL NOT NULL, "filename" TEXT NOT NULL NOT NULL, "content" TEXT, "user_id" VARCHAR(255) NOT NULL, "timestamp" INTEGER NOT NULL NOT NULL);

-- ----------------------------
-- Table structure for file
-- ----------------------------
DROP TABLE IF EXISTS "file";
CREATE TABLE "file" ("id" TEXT NOT NULL, "user_id" TEXT NOT NULL, "filename" TEXT NOT NULL, "meta" TEXT NOT NULL, "created_at" INTEGER NOT NULL, hash TEXT, data JSON, updated_at BIGINT);

-- ----------------------------
-- Table structure for function
-- ----------------------------
DROP TABLE IF EXISTS "function";
CREATE TABLE "function" ("id" TEXT NOT NULL, "user_id" TEXT NOT NULL, "name" TEXT NOT NULL, "type" TEXT NOT NULL, "content" TEXT NOT NULL, "meta" TEXT NOT NULL, "created_at" INTEGER NOT NULL, "updated_at" INTEGER NOT NULL, "valves" TEXT, "is_active" INTEGER NOT NULL, "is_global" INTEGER NOT NULL);

-- ----------------------------
-- Table structure for knowledge
-- ----------------------------
DROP TABLE IF EXISTS "knowledge";
CREATE TABLE knowledge (
	id TEXT NOT NULL, 
	user_id TEXT NOT NULL, 
	name TEXT NOT NULL, 
	description TEXT, 
	data JSON, 
	meta JSON, 
	created_at BIGINT NOT NULL, 
	updated_at BIGINT, 
	PRIMARY KEY (id)
);

-- ----------------------------
-- Table structure for memory
-- ----------------------------
DROP TABLE IF EXISTS "memory";
CREATE TABLE "memory" ("id" VARCHAR(255) NOT NULL, "user_id" VARCHAR(255) NOT NULL, "content" TEXT NOT NULL, "updated_at" INTEGER NOT NULL, "created_at" INTEGER NOT NULL);

-- ----------------------------
-- Table structure for migratehistory
-- ----------------------------
DROP TABLE IF EXISTS "migratehistory";
CREATE TABLE "migratehistory" ("id" INTEGER NOT NULL PRIMARY KEY, "name" VARCHAR(255) NOT NULL, "migrated_at" DATETIME NOT NULL);

-- ----------------------------
-- Table structure for model
-- ----------------------------
DROP TABLE IF EXISTS "model";
CREATE TABLE "model" ("id" TEXT NOT NULL, "user_id" TEXT NOT NULL, "base_model_id" TEXT, "name" TEXT NOT NULL, "meta" TEXT NOT NULL, "params" TEXT NOT NULL, "created_at" INTEGER NOT NULL, "updated_at" INTEGER NOT NULL);

-- ----------------------------
-- Table structure for prompt
-- ----------------------------
DROP TABLE IF EXISTS "prompt";
CREATE TABLE "prompt" ("id" INTEGER NOT NULL PRIMARY KEY, "command" VARCHAR(255) NOT NULL, "user_id" VARCHAR(255) NOT NULL, "title" TEXT NOT NULL NOT NULL, "content" TEXT NOT NULL, "timestamp" INTEGER NOT NULL NOT NULL);

-- ----------------------------
-- Table structure for tag
-- ----------------------------
DROP TABLE IF EXISTS "tag";
CREATE TABLE "tag" ("id" VARCHAR(255) NOT NULL, "name" VARCHAR(255) NOT NULL, "user_id" VARCHAR(255) NOT NULL, "data" TEXT);

-- ----------------------------
-- Table structure for tool
-- ----------------------------
DROP TABLE IF EXISTS "tool";
CREATE TABLE "tool" ("id" TEXT NOT NULL, "user_id" TEXT NOT NULL, "name" TEXT NOT NULL, "content" TEXT NOT NULL, "specs" TEXT NOT NULL, "meta" TEXT NOT NULL, "created_at" INTEGER NOT NULL, "updated_at" INTEGER NOT NULL, "valves" TEXT);

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS "user";
CREATE TABLE "user" ("id" VARCHAR(255) NOT NULL, "name" VARCHAR(255) NOT NULL, "email" VARCHAR(255) NOT NULL, "role" VARCHAR(255) NOT NULL, "profile_image_url" TEXT NOT NULL NOT NULL, "api_key" VARCHAR(255), "created_at" INTEGER NOT NULL NOT NULL, "updated_at" INTEGER NOT NULL NOT NULL, "last_active_at" INTEGER NOT NULL NOT NULL, "settings" TEXT, "info" TEXT, "oauth_sub" TEXT);

-- ----------------------------
-- Indexes structure for table auth
-- ----------------------------
CREATE UNIQUE INDEX "main"."auth_id"
ON "auth" (
  "id" ASC
);

-- ----------------------------
-- Indexes structure for table chat
-- ----------------------------
CREATE UNIQUE INDEX "main"."chat_id"
ON "chat" (
  "id" ASC
);
CREATE UNIQUE INDEX "main"."chat_share_id"
ON "chat" (
  "share_id" ASC
);

-- ----------------------------
-- Indexes structure for table chatidtag
-- ----------------------------
CREATE UNIQUE INDEX "main"."chatidtag_id"
ON "chatidtag" (
  "id" ASC
);

-- ----------------------------
-- Indexes structure for table document
-- ----------------------------
CREATE UNIQUE INDEX "main"."document_collection_name"
ON "document" (
  "collection_name" ASC
);
CREATE UNIQUE INDEX "main"."document_name"
ON "document" (
  "name" ASC
);

-- ----------------------------
-- Indexes structure for table file
-- ----------------------------
CREATE UNIQUE INDEX "main"."file_id"
ON "file" (
  "id" ASC
);

-- ----------------------------
-- Indexes structure for table function
-- ----------------------------
CREATE UNIQUE INDEX "main"."function_id"
ON "function" (
  "id" ASC
);

-- ----------------------------
-- Indexes structure for table memory
-- ----------------------------
CREATE UNIQUE INDEX "main"."memory_id"
ON "memory" (
  "id" ASC
);

-- ----------------------------
-- Indexes structure for table model
-- ----------------------------
CREATE UNIQUE INDEX "main"."model_id"
ON "model" (
  "id" ASC
);

-- ----------------------------
-- Indexes structure for table prompt
-- ----------------------------
CREATE UNIQUE INDEX "main"."prompt_command"
ON "prompt" (
  "command" ASC
);

-- ----------------------------
-- Indexes structure for table tag
-- ----------------------------
CREATE UNIQUE INDEX "main"."tag_id"
ON "tag" (
  "id" ASC
);

-- ----------------------------
-- Indexes structure for table tool
-- ----------------------------
CREATE UNIQUE INDEX "main"."tool_id"
ON "tool" (
  "id" ASC
);

-- ----------------------------
-- Indexes structure for table user
-- ----------------------------
CREATE UNIQUE INDEX "main"."user_api_key"
ON "user" (
  "api_key" ASC
);
CREATE UNIQUE INDEX "main"."user_id"
ON "user" (
  "id" ASC
);
CREATE UNIQUE INDEX "main"."user_oauth_sub"
ON "user" (
  "oauth_sub" ASC
);

PRAGMA foreign_keys = true;
