DROP TABLE IF EXISTS dim_geografia CASCADE; 
 
CREATE TABLE dim_geografia AS  
SELECT DISTINCT  
    COALESCE("cod_municipio"::INTEGER, -1) AS id_municipio,  
    COALESCE("no_municipio"::VARCHAR(100), 'Não Informado') AS nome_municipio,  
    
    -- EXTRAÇÃO AUTOMÁTICA DO ID DA UF (Pega os 2 primeiros dígitos do código do município)
    CASE WHEN "cod_municipio" IS NULL THEN -1 
         ELSE (LEFT("cod_municipio"::VARCHAR, 2))::INTEGER END AS id_uf,
 
    COALESCE("regiao_pais"::VARCHAR(20), 'Não Informado') AS regiao_pais,  
    COALESCE("sg_uf"::VARCHAR(2), 'NI') AS sg_uf,  
    COALESCE("uf"::VARCHAR(50), 'Não Informado') AS nome_uf,  
    COALESCE("LATITUDE"::DOUBLE PRECISION, 0.0) AS lat,  
    COALESCE("LONGITUDE"::DOUBLE PRECISION, 0.0) AS lon  
FROM geo_macroregiao; 
 
-- Garante que o ID -1 exista fisicamente para evitar erros de FK no Power BI 
INSERT INTO dim_geografia (id_municipio, id_uf, nome_municipio, regiao_pais, sg_uf, nome_uf, lat, lon) 
SELECT -1, -1, 'Não Informado', 'Não Informado', 'NI', 'Não Informado', 0.0, 0.0 
WHERE NOT EXISTS (SELECT 1 FROM dim_geografia WHERE id_municipio = -1); 
 
ALTER TABLE dim_geografia ADD PRIMARY KEY (id_municipio);
 
-- Índice extra para acelerar a busca no grão de Estado (Usado pela PNS)
CREATE INDEX idx_dim_geo_uf ON dim_geografia (id_uf);