CREATE DATABASE tw_nfe;
USE tw_nfe;

SELECT DATABASE();

/*
NOME | ENDERECO | DATA DE NASCIMENTO [...]
Tw   | Rua XPTO | 01/01/2008
Ze   | Rua XPTZ | 01/01/2008

10.001 - Precisao = 5; Escala = 3 ----- DECIMAL(5,3)
================================================================================

** Pontos Flutuantes

- DECIMAL(p,e)/DEC - Precisao = 65, Escala = 30
Padrao: Precisao = 10, Escala = 0
A cada 9 digitos, 4 bytes. Para a parte decimal: 0 = 0 bytes; 1 - 2 = 1 byte; 3 - 4 = 2 bytes; 5 - 6 = 3 bytes

- FLOAT(p,e) - -3.40E+38 a -1.17E-38, 0, 1.17E-38 a 3.40E+38
Padrao: Maximo suportado pelo SO/hardware

- DOUBLE(p,e) - -1.79E+308 a -2.23E-308, 0, 2.23E-308 a 1.79E+308
Padrao: Precisao = maximo suportado pelo SO/hardware, Escala = 15
8 bytes

- FLOAT(b) - b = bits
================================================================================

**Inteiros 

- BIT(t) - 1 a 64
Padrao: t = 1
t + 7 / 8 bytes

- TYNINT(t) - SIGNED: -128 a 127 /unsigned: 0 a 255
2 bytes

- SMALLINT(t) - SIGNED: -32768 a 32767 /unsigned: 0 a 65535
3 bytes

- INT(t), INTEGER - SIGNED: -2147483648 a 2147483647 /unsigned: 0 a 4294967295
4 bytes

- MEDIUM(t) - SIGNED: -8388608 a 8388607 /unsigned: 0 a 16777215
1 byte

- BIGINT(t) -
8 bytes
================================================================================

** Datas

- DATE - 1000-01-01 a 9999-12-31
3 bytes

- DATETIME(f) - 1000-01-01 00:00:00.000000 a 9999-12-31.999999
5 bytes + fracao

- TIMESTAMP(f) - 1970-01-01 00:00:00 a 2038-01-19 03:14:07.999999
4 bytes + fracao

- YEAR - 1901 a 2155
1 byte

-- Fracao: 0 = 0 bytes; 1 - 2 = 1 byte; 3 - 4 = 2 bytes; 5 - 6 = 3 bytes 
================================================================================

** Strings

- CHAR(t): 0 a 255
t * M
> 768 bytes: passa a ser um VARCHAR

- VARCHAR(t): 0 a 65535
t + 1 byte <= 255. Maior que esse valor: t + 2 bytes
================================================================================

- BOOL = TYNINT(1)
- JSON
*/