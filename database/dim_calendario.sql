DROP TABLE IF EXISTS dim_calendario CASCADE; 
 
CREATE TABLE dim_calendario AS  
SELECT  
    datum AS id_data,  -- MUDANÇA AQUI: Removeu o TO_CHAR. Agora é DATE real.
    datum AS data_completa,  
    EXTRACT(YEAR FROM datum)::INTEGER AS ano,  
    EXTRACT(MONTH FROM datum)::INTEGER AS mes_numero,  
    TO_CHAR(datum, 'TMMonth') AS nome_mes,  
    EXTRACT(QUARTER FROM datum)::INTEGER AS trimestre,

