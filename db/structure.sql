CREATE TABLE court_forms
	( court_forms_id            smallint        NOT NULL
	, court_forms_num           nchar(1000)     NOT NULL
	, court_forms_title         varchar(3000)       NULL
	, court_forms_type          nchar(100)      NOT NULL
	, court_forms_comments      nchar(400)          NULL
	, court_forms_category      nchar(100)      NOT NULL
	, court_forms_downloadable  bit             NOT NULL
	, court_forms_internal_flag bit             NOT NULL
	, court_forms_url           nchar(200)      NOT NULL
	, court_forms_keywords      nchar(400)          NULL
	, court_forms_format        nchar(40)       NOT NULL
	, court_forms_lastupdate    nchar(100)          NULL
	, language_id               smallint        NOT NULL
	, court_work_type_id        smallint            NULL
	);

ALTER TABLE court_forms ADD CONSTRAINT PK_court_forms PRIMARY KEY clustered (court_forms_id);

CREATE TABLE court_leaflets
	( court_leaflets_id            smallint        NOT NULL
	, court_leaflets_num           nchar(1000)     NOT NULL
	, court_leaflets_title         nchar(1000)     NOT NULL
	, court_leaflets_type          nchar(100)      NOT NULL
	, court_leaflets_comment       nchar(400)          NULL
	, court_leaflets_category      nchar(100)      NOT NULL
	, court_leaflets_download      bit             NOT NULL
	, court_leaflets_internal_flag bit             NOT NULL
	, court_leaflets_url           nchar(200)      NOT NULL
	, court_leaflets_keywords      nchar(400)          NULL
	, court_leaflets_format        nchar(40)       NOT NULL
	, court_leaflets_lastupdate    nchar(100)          NULL
	, language_id                  smallint        NOT NULL
	, court_work_type_id           smallint            NULL
	);

ALTER TABLE court_leaflets ADD CONSTRAINT PK_court_leaflets PRIMARY KEY clustered (court_leaflets_id);

CREATE TABLE court_work_type
	( court_work_type_id   smallint        NOT NULL
	, court_work_type_desc nchar(100)      NOT NULL
	);

ALTER TABLE court_work_type ADD CONSTRAINT PK_court_work_type PRIMARY KEY clustered (court_work_type_id);

CREATE TABLE forms_leaflets
	( forms_leaflets_id smallint        NOT NULL
	, court_forms_id    smallint        NOT NULL
	, court_leaflets_id smallint        NOT NULL
	);

ALTER TABLE forms_leaflets ADD CONSTRAINT PK_forms_leaflets PRIMARY KEY clustered (forms_leaflets_id);

CREATE TABLE language
	( language_id   smallint        NOT NULL
	, language_desc nchar(100)      NOT NULL
	);

ALTER TABLE language ADD CONSTRAINT PK_language PRIMARY KEY clustered (language_id);

CREATE TABLE w_court_forms
	( court_forms_id            smallint        NOT NULL
	, court_forms_num           nchar(1000)     NOT NULL
	, court_forms_title         nchar(1000)     NOT NULL
	, court_forms_type          nchar(100)      NOT NULL
	, court_forms_comments      nchar(400)          NULL
	, court_forms_category      nchar(100)      NOT NULL
	, court_forms_downloadable  bit             NOT NULL
	, court_forms_internal_flag bit             NOT NULL
	, court_forms_url           nchar(200)      NOT NULL
	, court_forms_keywords      nchar(400)          NULL
	, court_forms_format        nchar(40)       NOT NULL
	, court_forms_lastupdate    nchar(100)          NULL
	, language_id               smallint        NOT NULL
	, court_work_type_id        smallint            NULL
	);

ALTER TABLE w_court_forms ADD CONSTRAINT PK_w_court_forms PRIMARY KEY clustered (court_forms_id);

CREATE TABLE w_court_leaflets
	( court_leaflets_id            smallint        NOT NULL
	, court_leaflets_num           nchar(1000)     NOT NULL
	, court_leaflets_title         nchar(1000)     NOT NULL
	, court_leaflets_type          nchar(100)      NOT NULL
	, court_leaflets_comment       nchar(400)          NULL
	, court_leaflets_category      nchar(100)      NOT NULL
	, court_leaflets_download      bit             NOT NULL
	, court_leaflets_internal_flag bit             NOT NULL
	, court_leaflets_url           nchar(200)      NOT NULL
	, court_leaflets_keywords      nchar(400)          NULL
	, court_leaflets_format        nchar(40)       NOT NULL
	, court_leaflets_lastupdate    nchar(100)          NULL
	, language_id                  smallint        NOT NULL
	, court_work_type_id           smallint            NULL
	);

ALTER TABLE w_court_leaflets ADD CONSTRAINT PK_w_court_leaflets PRIMARY KEY clustered (court_leaflets_id);

CREATE TABLE w_court_work_type
	( court_work_type_id   smallint        NOT NULL
	, court_work_type_desc nchar(100)      NOT NULL
	);

ALTER TABLE w_court_work_type ADD CONSTRAINT PK_w_court_work_type PRIMARY KEY clustered (court_work_type_id);

CREATE TABLE w_forms_leaflets
	( forms_leaflets_id smallint        NOT NULL
	, court_forms_id    smallint        NOT NULL
	, court_leaflets_id smallint        NOT NULL
	);

ALTER TABLE w_forms_leaflets ADD CONSTRAINT PK_w_forms_leaflets PRIMARY KEY clustered (forms_leaflets_id);

CREATE TABLE w_language
	( language_id   smallint        NOT NULL
	, language_desc nchar(100)      NOT NULL
	);

ALTER TABLE w_language ADD CONSTRAINT PK_w_language PRIMARY KEY clustered (language_id);
