CREATE TABLE "pns_violencia_2019" (
  "id_pns_violencia" integer PRIMARY KEY,
  "unidade_federacao" varchar,
  "cor_raca" varchar,
  "ofensa_humilhacao_publico_12m" varchar,
  "gritos_xingamentos_12m" varchar,
  "ameacas_redes_sociais_12m" varchar,
  "agressao_fisica_tapa_bofetada" varchar,
  "agressao_fisica_com_arma" varchar,
  "frequencia_agressao_fisica" varchar,
  "autor_agressao_fisica" varchar
);

CREATE TABLE "geo_macroregiao" (
  "id_geo_macroregiao" integer PRIMARY KEY,
  "sigla_uf" varchar,
  "uf" varchar,
  "latitude" decimal,
  "longitude" decimal,
  "cod_municipio" varchar,
  "nome_municipio" varchar
);

CREATE TABLE "feminicidio_prelim" (
  "id_feminicidio_prelim" integer PRIMARY KEY,
  "dt_nascimento" date,
  "dt_obito" date,
  "descricao" varchar,
  "est_civil" varchar,
  "gestante" varchar,
  "local_ocorrencia_obito" varchar,
  "cod_municipio_resid" varchar
);


ALTER TABLE "feminicidio_prelim" ADD FOREIGN KEY ("cod_municipio_resid") REFERENCES "geo_macroregiao" ("cod_municipio") DEFERRABLE INITIALLY IMMEDIATE;
