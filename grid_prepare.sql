DROP SCHEMA IF EXISTS grid_cm CASCADE
; 
CREATE SCHEMA grid_cm
;
CREATE TABLE grid_cm.all_levels(
 gid_vbit  varbit NOT NULL PRIMARY KEY,
 hlevel    real NOT NULL CHECK(hlevel>=0.0 AND hlevel<30.0), 
 code_b16h text  NOT NULL,
 geom      geometry  NOT NULL,
 geom4326  geometry,
 UNIQUE(code_b16h),
 UNIQUE(geom)
);
-----
function grid_cm.generate_all_levels() returns TABLE LIKE grid_cm.all_levels ?? see osmc.grid_generate_all_levels(4.0, 'CM', '{1,2,3,4,5,6,7,8,9,a,b,c,d,e}', 16, 0.005, 0.00000005);
------
INSERT INTO grid_cm.all_levels
  SELECT * FROM grid_cm.generate_all_levels(4.0)
;
INSERT INTO grid_cm.all_levels
  SELECT * FROM grid_cm.generate_all_levels(5.5,true) -- Melhorar!
  WHERE hlevel>4.0
; -- no update?
CREATE VIEW grid_cm.vw_level00_0 AS SELECT * FROM grid_cm.all_levels WHERE hlevel=0;
CREATE VIEW grid_cm.vw_level00_5 AS SELECT * FROM grid_cm.all_levels WHERE hlevel=0.5;
CREATE VIEW grid_cm.vw_level01_0 AS SELECT * FROM grid_cm.all_levels WHERE hlevel=1.0;
CREATE VIEW grid_cm.vw_level01_5 AS SELECT * FROM grid_cm.all_levels WHERE hlevel=1.5;
CREATE VIEW grid_cm.vw_level02_0 AS SELECT * FROM grid_cm.all_levels WHERE hlevel=2.0;
CREATE VIEW grid_cm.vw_level02_5 AS SELECT * FROM grid_cm.all_levels WHERE hlevel=2.5;
CREATE VIEW grid_cm.vw_level03_0 AS SELECT * FROM grid_cm.all_levels WHERE hlevel=3.0;
CREATE VIEW grid_cm.vw_level03_5 AS SELECT * FROM grid_cm.all_levels WHERE hlevel=3.5;
CREATE VIEW grid_cm.vw_level04_0 AS SELECT * FROM grid_cm.all_levels WHERE hlevel=4.0;
CREATE VIEW grid_cm.vw_level04_5 AS SELECT * FROM grid_cm.all_levels WHERE hlevel=4.5;
CREATE VIEW grid_cm.vw_level05_0 AS SELECT * FROM grid_cm.all_levels WHERE hlevel=5.0;
CREATE VIEW grid_cm.vw_level05_5 AS SELECT * FROM grid_cm.all_levels WHERE hlevel=5.5;

