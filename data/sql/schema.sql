CREATE TABLE commit (id BIGINT UNSIGNED AUTO_INCREMENT, committed_at DATETIME, author_handle VARCHAR(255), author_email VARCHAR(255), committer_handle VARCHAR(255), committer_email VARCHAR(255), commit_key VARCHAR(255), commit_url TEXT, page_id BIGINT UNSIGNED NOT NULL, INDEX IX_Commit_1_idx (commit_key, page_id), INDEX page_id_idx (page_id), PRIMARY KEY(id)) ENGINE = INNODB;
CREATE TABLE page (id BIGINT UNSIGNED AUTO_INCREMENT, repository_id BIGINT UNSIGNED NOT NULL, path VARCHAR(255) NOT NULL, content_raw LONGTEXT, content_type VARCHAR(32), content_rendered LONGTEXT, title VARCHAR(255), index_json TEXT, last_updated DATETIME, last_updated_ym BIGINT DEFAULT 0, first_committed DATETIME, first_committed_ym BIGINT DEFAULT 0, created_at DATETIME NOT NULL, updated_at DATETIME NOT NULL, INDEX IX_Page_2_idx (path, last_updated_ym), INDEX repository_id_idx (repository_id), PRIMARY KEY(id)) ENGINE = INNODB;
CREATE TABLE repository (id BIGINT UNSIGNED AUTO_INCREMENT, name TEXT, repository TEXT NOT NULL, subdirectory TEXT, bind_path VARCHAR(128) NOT NULL, settings_json TEXT, force_update TINYINT(1) DEFAULT '0', force_clone TINYINT(1) DEFAULT '0', created_at DATETIME NOT NULL, updated_at DATETIME NOT NULL, PRIMARY KEY(id)) ENGINE = INNODB;
CREATE TABLE sf_guard_group (id INT AUTO_INCREMENT, name VARCHAR(255) UNIQUE, description TEXT, created_at DATETIME NOT NULL, updated_at DATETIME NOT NULL, PRIMARY KEY(id)) ENGINE = INNODB;
CREATE TABLE sf_guard_group_permission (group_id INT, permission_id INT, created_at DATETIME NOT NULL, updated_at DATETIME NOT NULL, PRIMARY KEY(group_id, permission_id)) ENGINE = INNODB;
CREATE TABLE sf_guard_permission (id INT AUTO_INCREMENT, name VARCHAR(255) UNIQUE, description TEXT, created_at DATETIME NOT NULL, updated_at DATETIME NOT NULL, PRIMARY KEY(id)) ENGINE = INNODB;
CREATE TABLE sf_guard_remember_key (id INT AUTO_INCREMENT, user_id INT, remember_key VARCHAR(32), ip_address VARCHAR(50), created_at DATETIME NOT NULL, updated_at DATETIME NOT NULL, INDEX user_id_idx (user_id), PRIMARY KEY(id, ip_address)) ENGINE = INNODB;
CREATE TABLE sf_guard_user (id INT AUTO_INCREMENT, username VARCHAR(128) NOT NULL UNIQUE, algorithm VARCHAR(128) DEFAULT 'sha1' NOT NULL, salt VARCHAR(128), password VARCHAR(128), is_active TINYINT(1) DEFAULT '1', is_super_admin TINYINT(1) DEFAULT '0', last_login DATETIME, created_at DATETIME NOT NULL, updated_at DATETIME NOT NULL, INDEX is_active_idx_idx (is_active), PRIMARY KEY(id)) ENGINE = INNODB;
CREATE TABLE sf_guard_user_group (user_id INT, group_id INT, created_at DATETIME NOT NULL, updated_at DATETIME NOT NULL, PRIMARY KEY(user_id, group_id)) ENGINE = INNODB;
CREATE TABLE sf_guard_user_permission (user_id INT, permission_id INT, created_at DATETIME NOT NULL, updated_at DATETIME NOT NULL, PRIMARY KEY(user_id, permission_id)) ENGINE = INNODB;
ALTER TABLE commit ADD CONSTRAINT commit_page_id_page_id FOREIGN KEY (page_id) REFERENCES page(id) ON DELETE CASCADE;
ALTER TABLE page ADD CONSTRAINT page_repository_id_repository_id FOREIGN KEY (repository_id) REFERENCES repository(id) ON DELETE CASCADE;
ALTER TABLE sf_guard_group_permission ADD CONSTRAINT sf_guard_group_permission_permission_id_sf_guard_permission_id FOREIGN KEY (permission_id) REFERENCES sf_guard_permission(id) ON DELETE CASCADE;
ALTER TABLE sf_guard_group_permission ADD CONSTRAINT sf_guard_group_permission_group_id_sf_guard_group_id FOREIGN KEY (group_id) REFERENCES sf_guard_group(id) ON DELETE CASCADE;
ALTER TABLE sf_guard_remember_key ADD CONSTRAINT sf_guard_remember_key_user_id_sf_guard_user_id FOREIGN KEY (user_id) REFERENCES sf_guard_user(id) ON DELETE CASCADE;
ALTER TABLE sf_guard_user_group ADD CONSTRAINT sf_guard_user_group_user_id_sf_guard_user_id FOREIGN KEY (user_id) REFERENCES sf_guard_user(id) ON DELETE CASCADE;
ALTER TABLE sf_guard_user_group ADD CONSTRAINT sf_guard_user_group_group_id_sf_guard_group_id FOREIGN KEY (group_id) REFERENCES sf_guard_group(id) ON DELETE CASCADE;
ALTER TABLE sf_guard_user_permission ADD CONSTRAINT sf_guard_user_permission_user_id_sf_guard_user_id FOREIGN KEY (user_id) REFERENCES sf_guard_user(id) ON DELETE CASCADE;
ALTER TABLE sf_guard_user_permission ADD CONSTRAINT sf_guard_user_permission_permission_id_sf_guard_permission_id FOREIGN KEY (permission_id) REFERENCES sf_guard_permission(id) ON DELETE CASCADE;
