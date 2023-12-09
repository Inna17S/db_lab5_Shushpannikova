CREATE TABLE chart_copy AS SELECT * FROM chart;
DELETE FROM chart_copy;

DO $$
BEGIN
    FOR counter IN 1..20
    LOOP
        INSERT INTO chart_copy
        VALUES (substring(md5(random()::text) from 1 for 20), substring(md5(random()::text) from 1 for 5), random() * 20 + 1  );
    END LOOP;
END;
$$

 
SELECT * FROM chart;
SELECT * FROM chart_copy;