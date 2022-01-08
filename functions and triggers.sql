CREATE FUNCTION check_periods_of_transf_operations() RETURNS trigger AS $$
    DECLARE start_time TIMESTAMP;
    DECLARE end_time TIMESTAMP;
    BEGIN
        SELECT start_time, end_time INTO start_time, end_time FROM Operation WHERE Operation_ID = new.Operation_ID;
        IF (TRUE) IN (
            SELECT (start_time, end_time) OVERLAPS
                   (start_date_and_time, end_date_and_time) FROM Operation
                WHERE Operation_ID IN (SELECT Operation_ID FROM Operation_Transformer WHERE Transformer_ID= new.Transformer_ID)) THEN
            RAISE EXCEPTION 'This robot cannot be assigned to a operation as he was on another operation at the time';
        ELSE RETURN new;
        END IF;
    END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER check_transf_mission_period BEFORE INSERT ON Operation_Transformer
    FOR EACH ROW EXECUTE PROCEDURE check_periods_of_transf_operations();

CREATE FUNCTION close_empty_bases() RETURNS SETOF void AS $$
    BEGIN
        DELETE FROM Base WHERE Base_ID IN (SELECT * FROM base_count_transf);
    END;
$$ LANGUAGE plpgsql;

CREATE MATERIALIZED VIEW base_count_transf AS
    (SELECT Base_ID FROM Base JOIN Transformer USING (Transformer_ID) GROUP BY Base_ID HAVING COUNT(Transformer_ID) = 0);

CREATE FUNCTION update_base_count_transf() RETURNS trigger AS $$
    BEGIN
        REFRESH MATERIALIZED VIEW base_count_transf;
        RETURN new;
    END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER update_base_count_transf AFTER INSERT OR UPDATE OR DELETE ON Transformer
    FOR EACH ROW EXECUTE PROCEDURE update_base_count_transf();

CREATE FUNCTION get_combat_candidates(n int DEFAULT 1) RETURNS Transformer AS $$
    BEGIN
        SELECT Transformer_ID FROM Transformer
            JOIN Position USING (Position_ID)
            JOIN Operation_Transformer USING (Transformer_ID)
            JOIN Operation USING (Operation_ID)
        WHERE rank IS NOT NULL OR !~~ ''
        ORDER BY end_date_and_time DESC, hiring_date DESC
        LIMIT n;
    END;
$$ LANGUAGE plpgsql;

