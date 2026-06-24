DROP TABLE IF EXISTS fato_feminicidio_resumida CASCADE; 
 
CREATE TABLE fato_feminicidio_resumida AS  
SELECT   
   cod_mun_res,   
   sexo,   
   raca,   
   est_civil,   
   causa,  
   local_obito,  
   -- AJUSTE AQUI: Transforma o ano/mês no primeiro dia do mês em formato DATE real
   DATE_TRUNC('month', dt_obito)::DATE AS dt_obito,   
   COUNT(*) AS total_casos  
FROM fato_feminicidio_detalhada  
GROUP BY 
   cod_mun_res, 
   sexo, 
   raca, 
   est_civil, 
   causa, 
   local_obito,  
   DATE_TRUNC('month', dt_obito)::DATE;
 
-- Índice para acelerar a leitura dessa nova coluna de data
CREATE INDEX idx_fato_resumida_dt_obito ON fato_feminicidio_resumida (dt_obito);
