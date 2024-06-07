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
------
DROP FUNCTION IF EXISTS grid_cm.generate_all_levels;
;
CREATE FUNCTION grid_cm.generate_all_levels(
  p_lev_max numeric,
  p_null_on_geom4326 boolean DEFAULT false
) RETURNS TABLE ( -- deu grid_cm.all_levels
 gid_vbit  varbit,
 hlevel    real, 
 code_b16h text  ,
 geom      geometry,
 geom4326  geometry
) AS $f$
DECLARE
  tpl text;
  s text;
  lev numeric;
  gg text :='geom4326';
BEGIN
 tpl := $$
   SELECT cbits as gid_vbit, %1$s::real as hlevel, code as code_b16h, geom, geom4326
   FROM osmc.decode_scientific_absolute_geoms(
     osmc.cover_scientific_codes(%1$s, '{0,1,2,3,4,5,6,7,8,9,a,b,c,d,e}')::text, 'CM', 16
   ) t
 $$;
 IF p_null_on_geom4326 THEN gg := 'NULL'; END IF;
 s := format(tpl,'0');
 FOR lev IN (select x from generate_series(0.5, p_lev_max, 0.5) t(x)) LOOP
    s := s || E'\n UNION ALL \n'|| format(tpl,lev::text);
  END LOOP;
  s := s|| E'\n   ORDER BY 1';
  RETURN QUERY EXECUTE s;
END;
$f$ LANGUAGE PLpgSQL IMMUTABLE;
-- comment??

-----
INSERT INTO grid_cm.all_levels
  SELECT * FROM grid_cm.generate_all_levels(4.0)
;
INSERT INTO grid_cm.all_levels
  SELECT * FROM grid_cm.generate_all_levels(5.5,true)
  WHERE hlevel>4.0
;
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

