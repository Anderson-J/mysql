SET GLOBAL log_bin_trust_function_creators = 1;

CREATE FUNCTION fn_ola()
RETURNS VARCHAR(10)
RETURN 'Ola';

SELECT fn_ola();

DROP FUNCTION fn_ola;

SELECT NOW();