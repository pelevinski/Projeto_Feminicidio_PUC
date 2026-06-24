DROP TABLE IF EXISTS fato_pesquisa_pns CASCADE;
 
CREATE TABLE fato_pesquisa_pns AS 
SELECT  
   COALESCE("Unidade da Federação", 'Não Informado')::VARCHAR(50) AS uf_pns, 
   COALESCE("Idade"::INTEGER, -1) AS idade_pns, 
   COALESCE("Ofensa/humilhação em público (12 meses)", 'Não Informado')::VARCHAR(50) AS ofensa_12m, 
   COALESCE("Gritos/xingamentos (12 meses)", 'Não Informado')::VARCHAR(50) AS gritos_12m, 
   COALESCE("Ameaças/redes sociais (12 meses)", 'Não Informado')::VARCHAR(50) AS ameaca_redes_12m, 
   COALESCE("Frequência da violência psicológica", 'Não Informado')::VARCHAR(50) AS freq_psic, 
   COALESCE("Autor da violência psicológica", 'Não Informado')::VARCHAR(50) AS autor_psic, 
   COALESCE("Local da violência psicológica", 'Não Informado')::VARCHAR(50) AS local_psic, 
   COALESCE("Agressão física: tapa/bofetada", 'Não Informado')::VARCHAR(50) AS agressao_tapa, 
   COALESCE("Agressão física com arma (faca, arma de fogo)", 'Não Informado')::VARCHAR(50) AS agressao_arma, 
   COALESCE("Frequência da agressão física", 'Não Informado')::VARCHAR(50) AS freq_agres_fis, 
   COALESCE("Autor da agressao física", 'Não Informado')::VARCHAR(50) AS autor_agres_fis, 
   COALESCE("Local da agressao física", 'Não Informado')::VARCHAR(50) AS local_agres_fis, 
   COALESCE("Violência sexual (12 meses): toque/beijo/manipulação", 'Não Informado')::VARCHAR(50) AS viol_sex_toque_12m, 
   COALESCE("Violência sexual (12 meses): ameaça/forçar ato sexual", 'Não Informado')::VARCHAR(50) AS viol_sex_forcado_12m, 
   COALESCE("Frequência da violência sexual", 'Não Informado')::VARCHAR(50) AS freq_viol_sex, 
   COALESCE("Autor da violência sexual", 'Não Informado')::VARCHAR(50) AS autor_viol_sex, 
   COALESCE("Local da violência sexual", 'Não Informado')::VARCHAR(50) AS local_viol_sex, 
   COALESCE("Consequência física por ato sexual forçado", 'Não Informado')::VARCHAR(50) AS conseq_fisica_sex, 
   COALESCE("Consequência psicológica por ato sexual forçado", 'Não Informado')::VARCHAR(50) AS conseq_psic_sex, 
   COALESCE("Buscou atendimento de saúde", 'Não Informado')::VARCHAR(50) AS buscou_atend, 
   COALESCE("Internação por 24h ou mais", 'Não Informado')::VARCHAR(50) AS internacao_24h, 
   COUNT(*) AS total_respondentes 
FROM pns_violencia_2019 
GROUP BY  
   "Unidade da Federação", "Idade", "Ofensa/humilhação em público (12 meses)",  
   "Gritos/xingamentos (12 meses)", "Ameaças/redes sociais (12 meses)",  
   "Frequência da violência psicológica", "Autor da violência psicológica",  
   "Local da violência psicológica", "Agressão física: tapa/bofetada",  
   "Agressão física com arma (faca, arma de fogo)", "Frequência da agressao física",  
   "Autor da agressao física", "Local da agressão física",  
   "Violência sexual (12 meses): toque/beijo/manipulação", "Violência sexual (12 meses): ameaça/forçar ato sexual",  
   "Frequência da violência sexual", "Autor da violência sexual", "Local da violência sexual",  
   "Consequência física por ato sexual forçado", "Consequência psicológica por ato sexual forçado",  
   "Buscou atendimento de saúde", "Internação por 24h ou mais";
