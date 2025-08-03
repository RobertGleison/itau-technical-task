CREATE TABLE IF NOT EXISTS `users` (
    `id` UUID PRIMARY KEY,
    `email` VARCHAR(255) NOT NULL,
    `brokerage_percentage` DECIMAL(5,4) NOT NULL DEFAULT 0.0000,
    CONSTRAINT `users_email_unique` UNIQUE (`email`),
    CONSTRAINT `users_brokerage_percentage_check` CHECK (`brokerage_percentage` >= 0 AND `brokerage_percentage` <= 1)
);
CREATE INDEX IF NOT EXISTS `idx_users_email` ON `users`(`email`);


CREATE TABLE IF NOT EXISTS `assets` (
    `id` UUID PRIMARY KEY,
    `code` VARCHAR(20) NOT NULL,
    `name` TEXT NOT NULL,

    CONSTRAINT `assets_code_unique` UNIQUE (`code`),
    CONSTRAINT `assets_name_unique` UNIQUE (`name`)
);
CREATE INDEX IF NOT EXISTS `idx_assets_code` ON `assets`(`code`);


CREATE TABLE IF NOT EXISTS `operations` (
    `id` UUID PRIMARY KEY,
    `user_id` UUID NOT NULL,
    `asset_id` UUID NOT NULL,
    `quantity` BIGINT NOT NULL,
    `unit_price` BIGINT NOT NULL,
    `operation_type` VARCHAR(255) NOT NULL,
    `operation_at` TIMESTAMP WITH TIME ZONE NOT NULL,
    `brokerage` DECIMAL(16,8) NOT NULL DEFAULT 0,

    CONSTRAINT `operations_user_id_fk` FOREIGN KEY (`user_id`) REFERENCES `users`(`id`) ON DELETE CASCADE,
    CONSTRAINT `operations_asset_id_fk` FOREIGN KEY (`asset_id`) REFERENCES `assets`(`id`) ON DELETE RESTRICT,
);
CREATE INDEX IF NOT EXISTS `idx_operations_user_id` ON `operations`(`user_id`);
CREATE INDEX IF NOT EXISTS `idx_operations_asset_id` ON `operations`(`asset_id`);


CREATE TABLE IF NOT EXISTS `positions` (
    `id` UUID PRIMARY KEY,
    `user_id` UUID NOT NULL,
    `asset_id` UUID NOT NULL,
    `quantity` BIGINT NOT NULL,
    `avg_price` BIGINT NOT NULL,
    `profit_and_loss` BIGINT NOT NULL DEFAULT 0,

    CONSTRAINT `positions_user_id_fk` FOREIGN KEY (`user_id`) REFERENCES `users`(`id`) ON DELETE CASCADE,
    CONSTRAINT `positions_asset_id_fk` FOREIGN KEY (`asset_id`) REFERENCES `assets`(`id`) ON DELETE RESTRICT,
);
CREATE INDEX IF NOT EXISTS `idx_positions_user_id` ON `positions`(`user_id`);
CREATE INDEX IF NOT EXISTS `idx_positions_asset_id` ON `positions`(`asset_id`);


CREATE TABLE IF NOT EXISTS `quotes` (
    `id` UUID PRIMARY KEY,
    `asset_id` UUID NOT NULL,
    `unit_price` BIGINT NOT NULL,
    `quotation_at` TIMESTAMP WITH TIME ZONE NOT NULL,
    CONSTRAINT `quotes_asset_id_fk` FOREIGN KEY (`asset_id`) REFERENCES `assets`(`id`) ON DELETE CASCADE,
);
CREATE INDEX IF NOT EXISTS `idx_quotes_asset_id` ON `quotes`(`asset_id`);
