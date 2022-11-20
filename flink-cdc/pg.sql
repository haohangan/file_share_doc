select * from acc_back_log;

INSERT INTO acc_back_log (id, log_content , gmt_create) VALUES 
(1,'first record','2022-10-11 12:09:09'),
(2,'second record','2022-10-12 12:09:09'),
(3,'thrid record','2022-10-13 12:09:09');

-- c
INSERT INTO acc_back_log (id, log_content , gmt_create) VALUES 


show max_replication_slots ;-- 10
SHOW data_directory; -- /var/lib/postgresql/12/main
show wal_level ;-- replica
show archive_mode;

CREATE PUBLICATION acc_back_log_publication FOR TABLE acc_back_log;

select * from  pg_catalog.pg_publication ;

select * from pg_catalog.pg_publication_tables ;

-- 更改表的复制标识，包含 更新和删除的值
alter table acc_back_log replica identity full;
select relreplident  from pg_catalog.pg_class where relname = 'acc_back_log' ;



--select * from pg_create_logical_replication_slot


CREATE TABLE public.acc_back_log_dest (
	id int4 NOT NULL,
	log_content varchar(50) NOT NULL,
	gmt_create timestamp NOT NULL,
	CONSTRAINT acc_back_log_dest_pkey PRIMARY KEY (id)
);