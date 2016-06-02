-- ===================================================================
-- get ready for the foreign data wrapper tests
-- ===================================================================

ALTER SEQUENCE pg_catalog.pg_dist_shardid_seq RESTART 390000;
ALTER SEQUENCE pg_catalog.pg_dist_jobid_seq RESTART 29000;

-- create fake fdw for use in tests
CREATE FUNCTION fake_fdw_handler()
RETURNS fdw_handler
AS 'citus'
LANGUAGE C STRICT;

CREATE FOREIGN DATA WRAPPER fake_fdw HANDLER fake_fdw_handler;
CREATE SERVER fake_fdw_server FOREIGN DATA WRAPPER fake_fdw;
