1.	Anexo I – Fato detalhada

DROP TABLE IF EXISTS fato_feminicidio_detalhada CASCADE;
 
CREATE TABLE fato_feminicidio_detalhada AS 
SELECT  
   'serie_historica'::VARCHAR(20) AS origem, 
   CASE WHEN "DT_NASCIMENTO" IS NULL OR "DT_NASCIMENTO" IN ('', 'IGNORADO', 'NULL') THEN '1900-01-01'::DATE 
        ELSE TO_DATE("DT_NASCIMENTO", 'DDMMYYYY') END AS dt_nasc, 
   CASE WHEN "DT_OBITO" IS NULL OR "DT_OBITO" IN ('', 'IGNORADO', 'NULL') THEN '1900-01-01'::DATE 
        ELSE TO_DATE("DT_OBITO", 'DDMMYYYY') END AS dt_obito, 
   CASE WHEN "DT_CADASTRO_OBITO" IS NULL OR "DT_CADASTRO_OBITO" IN ('', 'IGNORADO', 'NULL') THEN '1900-01-01'::DATE 
        ELSE TO_DATE("DT_CADASTRO_OBITO", 'DDMMYYYY') END AS dt_cad, 
   -- Validação ultra-segura para HORA_OBITO contra valores lógicos impossíveis (ex: 9999)
   CASE WHEN "HORA_OBITO" IS NULL OR "HORA_OBITO" IN ('', 'IGNORADO', 'NI', 'NULL', '000', '9999') THEN '00:00:00'::TIME
        -- Se contiver letras, vira meia-noite
        WHEN "HORA_OBITO" ~ '[a-zA-Z]' THEN '00:00:00'::TIME
        -- Se for um horário que já tem dois pontos, valida se o texto antes dos dois pontos não passa de 23
        WHEN "HORA_OBITO" LIKE '%:%' AND SUBSTRING("HORA_OBITO" FROM '^[^:]+')::INTEGER > 23 THEN '00:00:00'::TIME
        WHEN "HORA_OBITO" LIKE '%:%' THEN "HORA_OBITO"::TIME
        -- Se for numérico com 4 dígitos (ex: 1430), valida matematicamente se a hora < 24 e o minuto < 60
        WHEN LENGTH(TRIM("HORA_OBITO")) = 4 AND "HORA_OBITO" ~ '^[0-9]+$' 
             AND SUBSTRING(TRIM("HORA_OBITO"), 1, 2)::INTEGER < 24 
             AND SUBSTRING(TRIM("HORA_OBITO"), 3, 2)::INTEGER < 60
             THEN (SUBSTRING(TRIM("HORA_OBITO"), 1, 2) || ':' || SUBSTRING(TRIM("HORA_OBITO"), 3, 2) || ':00')::TIME
        -- Qualquer valor que falhar nas regras acima (como "9999", "8888", "000") vira meia-noite
        ELSE '00:00:00'::TIME END AS hora, 
   COALESCE("SEXO", 'Não Informado')::VARCHAR(20) AS sexo, 
   COALESCE("RACA_COR", 'Não Informado')::VARCHAR(30) AS raca, 
   COALESCE("EST_CIVIL", 'Não Informado')::VARCHAR(30) AS est_civil, 
   COALESCE("COD_MUNICIPIO_RESID"::INTEGER, -1) AS cod_mun_res, 
   COALESCE("COD_MUNICIPIO_OBITO"::INTEGER, -1) AS cod_mun_obito, 
   COALESCE("LOCAL_OCORRENCIA_OBITO", 'Não Informado')::VARCHAR(100) AS local_obito, 
   COALESCE("CAUSA_BASICA", 'Não Informado')::VARCHAR(10) AS causa, 
   COALESCE("TIPO_OBITO", 'Não Informado')::VARCHAR(50) AS tipo_obito, 
   COALESCE("DESCRICAO", 'Não Informado')::TEXT AS desc_caso, 
   COALESCE("GESTANTE", 'Não Informado')::VARCHAR(20) AS gestante, 
   COALESCE("PUERPERIO", 'Não Informado')::VARCHAR(20) AS puerperio 
FROM feminicidio_serie_historica 
 
UNION ALL 
 
SELECT  
   'preliminar'::VARCHAR(20) AS origem, 
   CASE WHEN "DT_NASCIMENTO" IS NULL OR "DT_NASCIMENTO" IN ('', 'IGNORADO', 'NULL') THEN '1900-01-01'::DATE 
        ELSE TO_DATE("DT_NASCIMENTO", 'DDMMYYYY') END AS dt_nasc, 
   CASE WHEN "DT_OBITO" IS NULL OR "DT_OBITO" IN ('', 'IGNORADO', 'NULL') THEN '1900-01-01'::DATE 
        ELSE TO_DATE("DT_OBITO", 'DDMMYYYY') END AS dt_obito, 
   CASE WHEN "DT_CADASTRO_OBITO" IS NULL OR "DT_CADASTRO_OBITO" IN ('', 'IGNORADO', 'NULL') THEN '1900-01-01'::DATE 
        ELSE TO_DATE("DT_CADASTRO_OBITO", 'DDMMYYYY') END AS dt_cad, 
   CASE WHEN "HORA_OBITO" IS NULL OR "HORA_OBITO" IN ('', 'IGNORADO', 'NI', 'NULL', '000', '9999') THEN '00:00:00'::TIME
        WHEN "HORA_OBITO" ~ '[a-zA-Z]' THEN '00:00:00'::TIME
        WHEN "HORA_OBITO" LIKE '%:%' AND SUBSTRING("HORA_OBITO" FROM '^[^:]+')::INTEGER > 23 THEN '00:00:00'::TIME
        WHEN "HORA_OBITO" LIKE '%:%' THEN "HORA_OBITO"::TIME
        WHEN LENGTH(TRIM("HORA_OBITO")) = 4 AND "HORA_OBITO" ~ '^[0-9]+$' 
             AND SUBSTRING(TRIM("HORA_OBITO"), 1, 2)::INTEGER < 24 
             AND SUBSTRING(TRIM("HORA_OBITO"), 3, 2)::INTEGER < 60
             THEN (SUBSTRING(TRIM("HORA_OBITO"), 1, 2) || ':' || SUBSTRING(TRIM("HORA_OBITO"), 3, 2) || ':00')::TIME
        ELSE '00:00:00'::TIME END AS hora, 
   COALESCE("SEXO", 'Não Informado')::VARCHAR(20) AS sexo, 
   COALESCE("RACA_COR", 'Não Informado')::VARCHAR(30) AS raca, 
   COALESCE("EST_CIVIL", 'Não Informado')::VARCHAR(30) AS est_civil, 
   COALESCE("COD_MUNICIPIO_RESID"::INTEGER, -1) AS cod_mun_res, 
   COALESCE("COD_MUNICIPIO_OBITO"::INTEGER, -1) AS cod_mun_obito, 
   COALESCE("LOCAL_OCORRENCIA_OBITO", 'Não Informado')::VARCHAR(100) AS local_obito, 
   COALESCE("CAUSA_BASICA", 'Não Informado')::VARCHAR(10) AS causa, 
   COALESCE("TIPO_OBITO", 'Não Informado')::VARCHAR(50) AS tipo_obito, 
   COALESCE("DESCRICAO", 'Não Informado')::TEXT AS desc_caso, 
   COALESCE("GESTANTE", 'Não Informado')::VARCHAR(20) AS gestante, 
   COALESCE("PUERPERIO", 'Não Informado')::VARCHAR(20) AS puerperio 
FROM feminicidio_prelim;
 
CREATE INDEX idx_fato_det_dt_obito ON fato_feminicidio_detalhada(dt_obito);
CREATE INDEX idx_fato_det_mun ON fato_feminicidio_detalhada(cod_mun_res);
