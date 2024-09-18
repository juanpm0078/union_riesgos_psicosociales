# librerias instaladas o no, en caso de que no esten instaladas, las instala.
installed_packages <- packages %in% rownames(installed.packages())
if (any(installed_packages == FALSE)) {
  install.packages(packages[!installed_packages])}
invisible(lapply(packages, library, character.only = TRUE))# Carga todas las librerias
#####LLAMAR LIBRERIAS########################################################################

Sys.setlocale("LC_TIME", "es_EC.utf8")

library(readxl)
library(lubridate)
library(tidyverse)
library(stringi)
library(stringr)
library(openxlsx)
library(dplyr)
library(excel.link)

cas_zona_1 <- read_excel(path = "C:/Users/juan.minchalo/Desktop/MINEDUC/2. Riesgos Psicosociales/4. RPS - EIS 2024/2. II TRIM/Zona 1/CASOS Y PREVENCION ABRIL MAYO JUNIO.xlsx",
                       sheet = "CASOS",
                       skip = 1)

cas_zona_2 <- read_excel(path = "C:/Users/juan.minchalo/Desktop/MINEDUC/2. Riesgos Psicosociales/4. RPS - EIS 2024/2. II TRIM/Zona 2/MATRIZ RPS-EIS 2024_23-04-24.xlsx",
                         sheet = "CASOS",
                         skip = 1)

cas_zona_3 <- read_excel(path = "C:/Users/juan.minchalo/Desktop/MINEDUC/2. Riesgos Psicosociales/4. RPS - EIS 2024/2. II TRIM/Zona 3/MATRIZ RPS CONSOLIDADO ABRIL - JUNIO.xlsx",
                         sheet = "CASOS",
                         skip = 1) %>% select(1:43)


cas_zona_4 <- read_excel(path = "C:/Users/juan.minchalo/Desktop/MINEDUC/2. Riesgos Psicosociales/4. RPS - EIS 2024/2. II TRIM/Zona 4/RPS -2 segundo trimestre.xls",
                         sheet = "CASOS",
                         skip = 1)


cas_zona_5 <- read_excel(path = "C:/Users/juan.minchalo/Desktop/MINEDUC/2. Riesgos Psicosociales/4. RPS - EIS 2024/2. II TRIM/Zona 5/MATRIZ RPS-EIS 2024 (1).xlsx",
                         sheet = "CASOS",
                         skip = 1)

cas_zona_6 <- read_excel(path = "C:/Users/juan.minchalo/Desktop/MINEDUC/2. Riesgos Psicosociales/4. RPS - EIS 2024/2. II TRIM/Zona 6/MATRIZ CASOS RIESGO PSICOSOCIAL N° 2 - PC (1).xlsx",
                         sheet = "CASOS",
                         skip = 1)

cas_zona_7 <- read_excel(path = "C:/Users/juan.minchalo/Desktop/MINEDUC/2. Riesgos Psicosociales/4. RPS - EIS 2024/2. II TRIM/Zona 7/CZ7 -  MATRIZ DE CASOS - PREVENCIÓN..xlsx",
                         sheet = "CASOS",
                         skip = 1)

cas_zona_8 <- read_excel(path = "C:/Users/juan.minchalo/Desktop/MINEDUC/2. Riesgos Psicosociales/4. RPS - EIS 2024/2. II TRIM/Zona 8/Z8_DZEEI_matriz_rps_abril-mayo y junio_2024.xls",
                         sheet = "CASOS",
                         skip = 1)

cas_zona_9 <- read_excel(path = "C:/Users/juan.minchalo/Desktop/MINEDUC/2. Riesgos Psicosociales/4. RPS - EIS 2024/2. II TRIM/Zona 9/Matriz riesgos zona 9 (1).xls",
                          sheet = "CASOS",
                          skip = 1)

names(cas_zona_1) <- gsub("#","",names(cas_zona_1))
names(cas_zona_1) <- gsub(",","",names(cas_zona_1))
names(cas_zona_1) <- gsub("[\\ \\-\\...\\.\\..]+", "_", names(cas_zona_1))
names(cas_zona_1) <- gsub("\\.", "_", names(cas_zona_1))
names(cas_zona_1) <- gsub("__|___", "_", names(cas_zona_1))
names(cas_zona_1) <- gsub(pattern = "\\?", replacement = "", names(cas_zona_1))
names(cas_zona_1) <- gsub(pattern = "¿", replacement = "", names(cas_zona_1))
names(cas_zona_1) <- iconv(names(cas_zona_1), to = "ASCII//TRANSLIT")
names(cas_zona_1) <- gsub("\\(|\\)", "", names(cas_zona_1))
names(cas_zona_1) <- gsub("/", "", names(cas_zona_1))
names(cas_zona_1) <- gsub("SINO", "", names(cas_zona_1))
names(cas_zona_1) <- gsub("\\s+", "", names(cas_zona_1))

names(cas_zona_2) <- gsub("#", "", names(cas_zona_2))
names(cas_zona_2) <- gsub(",", "", names(cas_zona_2))
names(cas_zona_2) <- gsub("[\\ \\-\\...\\.\\..]+", "_", names(cas_zona_2))
names(cas_zona_2) <- gsub("\\.", "_", names(cas_zona_2))
names(cas_zona_2) <- gsub("__|___", "_", names(cas_zona_2))
names(cas_zona_2) <- gsub(pattern = "\\?", replacement = "", names(cas_zona_2))
names(cas_zona_2) <- gsub(pattern = "¿", replacement = "", names(cas_zona_2))
names(cas_zona_2) <- iconv(names(cas_zona_2), to = "ASCII//TRANSLIT")
names(cas_zona_2) <- gsub("\\(|\\)", "", names(cas_zona_2))
names(cas_zona_2) <- gsub("/", "", names(cas_zona_2))
names(cas_zona_2) <- gsub("SINO", "", names(cas_zona_2))
names(cas_zona_2) <- gsub("\\s+", "", names(cas_zona_2))

names(cas_zona_3) <- gsub("#", "", names(cas_zona_3))
names(cas_zona_3) <- gsub(",", "", names(cas_zona_3))
names(cas_zona_3) <- gsub("[\\ \\-\\...\\.\\..]+", "_", names(cas_zona_3))
names(cas_zona_3) <- gsub("\\.", "_", names(cas_zona_3))
names(cas_zona_3) <- gsub("__|___", "_", names(cas_zona_3))
names(cas_zona_3) <- gsub(pattern = "\\?", replacement = "", names(cas_zona_3))
names(cas_zona_3) <- gsub(pattern = "¿", replacement = "", names(cas_zona_3))
names(cas_zona_3) <- iconv(names(cas_zona_3), to = "ASCII//TRANSLIT")
names(cas_zona_3) <- gsub("\\(|\\)", "", names(cas_zona_3))
names(cas_zona_3) <- gsub("/", "", names(cas_zona_3))
names(cas_zona_3) <- gsub("SINO", "", names(cas_zona_3))
names(cas_zona_3) <- gsub("\\s+", "", names(cas_zona_3))

names(cas_zona_4) <- gsub("#", "", names(cas_zona_4))
names(cas_zona_4) <- gsub(",", "", names(cas_zona_4))
names(cas_zona_4) <- gsub("[\\ \\-\\...\\.\\..]+", "_", names(cas_zona_4))
names(cas_zona_4) <- gsub("\\.", "_", names(cas_zona_4))
names(cas_zona_4) <- gsub("__|___", "_", names(cas_zona_4))
names(cas_zona_4) <- gsub(pattern = "\\?", replacement = "", names(cas_zona_4))
names(cas_zona_4) <- gsub(pattern = "¿", replacement = "", names(cas_zona_4))
names(cas_zona_4) <- iconv(names(cas_zona_4), to = "ASCII//TRANSLIT")
names(cas_zona_4) <- gsub("\\(|\\)", "", names(cas_zona_4))
names(cas_zona_4) <- gsub("/", "", names(cas_zona_4))
names(cas_zona_4) <- gsub("SINO", "", names(cas_zona_4))
names(cas_zona_4) <- gsub("\\s+", "", names(cas_zona_4))

names(cas_zona_5) <- gsub("#", "", names(cas_zona_5))
names(cas_zona_5) <- gsub(",", "", names(cas_zona_5))
names(cas_zona_5) <- gsub("[\\ \\-\\...\\.\\..]+", "_", names(cas_zona_5))
names(cas_zona_5) <- gsub("\\.", "_", names(cas_zona_5))
names(cas_zona_5) <- gsub("__|___", "_", names(cas_zona_5))
names(cas_zona_5) <- gsub(pattern = "\\?", replacement = "", names(cas_zona_5))
names(cas_zona_5) <- gsub(pattern = "¿", replacement = "", names(cas_zona_5))
names(cas_zona_5) <- iconv(names(cas_zona_5), to = "ASCII//TRANSLIT")
names(cas_zona_5) <- gsub("\\(|\\)", "", names(cas_zona_5))
names(cas_zona_5) <- gsub("/", "", names(cas_zona_5))
names(cas_zona_5) <- gsub("SINO", "", names(cas_zona_5))
names(cas_zona_5) <- gsub("\\s+", "", names(cas_zona_5))

names(cas_zona_6) <- gsub("#", "", names(cas_zona_6))
names(cas_zona_6) <- gsub(",", "", names(cas_zona_6))
names(cas_zona_6) <- gsub("[\\ \\-\\...\\.\\..]+", "_", names(cas_zona_6))
names(cas_zona_6) <- gsub("\\.", "_", names(cas_zona_6))
names(cas_zona_6) <- gsub("__|___", "_", names(cas_zona_6))
names(cas_zona_6) <- gsub(pattern = "\\?", replacement = "", names(cas_zona_6))
names(cas_zona_6) <- gsub(pattern = "¿", replacement = "", names(cas_zona_6))
names(cas_zona_6) <- iconv(names(cas_zona_6), to = "ASCII//TRANSLIT")
names(cas_zona_6) <- gsub("\\(|\\)", "", names(cas_zona_6))
names(cas_zona_6) <- gsub("/", "", names(cas_zona_6))
names(cas_zona_6) <- gsub("SINO", "", names(cas_zona_6))
names(cas_zona_6) <- gsub("\\s+", "", names(cas_zona_6))

names(cas_zona_7) <- gsub("#", "", names(cas_zona_7))
names(cas_zona_7) <- gsub(",", "", names(cas_zona_7))
names(cas_zona_7) <- gsub("[\\ \\-\\...\\.\\..]+", "_", names(cas_zona_7))
names(cas_zona_7) <- gsub("\\.", "_", names(cas_zona_7))
names(cas_zona_7) <- gsub("__|___", "_", names(cas_zona_7))
names(cas_zona_7) <- gsub(pattern = "\\?", replacement = "", names(cas_zona_7))
names(cas_zona_7) <- gsub(pattern = "¿", replacement = "", names(cas_zona_7))
names(cas_zona_7) <- iconv(names(cas_zona_7), to = "ASCII//TRANSLIT")
names(cas_zona_7) <- gsub("\\(|\\)", "", names(cas_zona_7))
names(cas_zona_7) <- gsub("/", "", names(cas_zona_7))
names(cas_zona_7) <- gsub("SINO", "", names(cas_zona_7))
names(cas_zona_7) <- gsub("\\s+", "", names(cas_zona_7))

names(cas_zona_8) <- gsub("#", "", names(cas_zona_8))
names(cas_zona_8) <- gsub(",", "", names(cas_zona_8))
names(cas_zona_8) <- gsub("[\\ \\-\\...\\.\\..]+", "_", names(cas_zona_8))
names(cas_zona_8) <- gsub("\\.", "_", names(cas_zona_8))
names(cas_zona_8) <- gsub("__|___", "_", names(cas_zona_8))
names(cas_zona_8) <- gsub(pattern = "\\?", replacement = "", names(cas_zona_8))
names(cas_zona_8) <- gsub(pattern = "¿", replacement = "", names(cas_zona_8))
names(cas_zona_8) <- iconv(names(cas_zona_8), to = "ASCII//TRANSLIT")
names(cas_zona_8) <- gsub("\\(|\\)", "", names(cas_zona_8))
names(cas_zona_8) <- gsub("/", "", names(cas_zona_8))
names(cas_zona_8) <- gsub("SINO", "", names(cas_zona_8))
names(cas_zona_8) <- gsub("\\s+", "", names(cas_zona_8))

names(cas_zona_9) <- gsub("#", "", names(cas_zona_9))
names(cas_zona_9) <- gsub(",", "", names(cas_zona_9))
names(cas_zona_9) <- gsub("[\\ \\-\\...\\.\\..]+", "_", names(cas_zona_9))
names(cas_zona_9) <- gsub("\\.", "_", names(cas_zona_9))
names(cas_zona_9) <- gsub("__|___", "_", names(cas_zona_9))
names(cas_zona_9) <- gsub(pattern = "\\?", replacement = "", names(cas_zona_9))
names(cas_zona_9) <- gsub(pattern = "¿", replacement = "", names(cas_zona_9))
names(cas_zona_9) <- iconv(names(cas_zona_9), to = "ASCII//TRANSLIT")
names(cas_zona_9) <- gsub("\\(|\\)", "", names(cas_zona_9))
names(cas_zona_9) <- gsub("/", "", names(cas_zona_9))
names(cas_zona_9) <- gsub("SINO", "", names(cas_zona_9))
names(cas_zona_9) <- gsub("\\s+", "", names(cas_zona_9))


ren_cas_1 <- cas_zona_1 %>% rename(FECHA_CONOCIMIENTO=FECHA_DE_CONOCIMIENTO_ddmmaaaa,
       NUM_IDEN_VICTIM=NUMERO_DE_DOCUMENTO_DE_IDENTIDAD_9,
       NOM_VIC=NOMBRES_Y_APELLIDOS_10,
       EDAD_VIC=EDAD_12,
       GEN_VIC=GENERO_13,
       STS_DISCAPACIDAD=TIENE_DISCAPACIDAD,
       DIV_GEN= DIVERSIDAD_DE_GENERO_U_ORIENTACION_SEXUAL,
       OTRAS_COND= Otras_condiciones_relevantesESPECIFIQUE,
       NOM_REPRES=NOMBRES_Y_APELLIDOS_20,
       NUM_TELF_REPRES = NUMERO_DE_TELEFONO,
       NUM_IDEN_AGRESOR=NUMERO_DE_DOCUMENTO_DE_IDENTIDAD_22,
       NOM_AGRESOR = NOMBRES_Y_APELLIDOS_23,
       EDAD_AGRESOR=EDAD_24,
       RELAC_VIC = RELACION_ENTRE_LA_VICTIMA_CON_LA_PRESUNTA_PERSONA_AGRESORA,
       FECHA_LEV_FICHA = FECHA_DE_LEVANTAMIENTO_DE_LA_FICHA_DE_HECHO_DE_VIOLENCIA_Y_OTROS_RIESGOS_PSICOSOCIALES_ddmmaaaa,
       NUM_TRAM_DIST = NUMERO_DE_TRAMITE_PRESENTADO_AL_DISTRITO,
       FECHA_INGRESO_DIST = FECHA_DE_INGRESO_DE_CASO_EN_DISTRITO_ddmmaaaa,
       STS_PLAN_ACOM = Cuenta_con_Plan_de_Acompanamiento_y_Restitucion_de_derechos_o_Plan_de_Atencion_y_seguimiento_Psicosocial,
       SALUD = SALUD_Psicologico_y_medico,
       STS_DEN_FISCALIA = EXISTE_DENUNCIA_EN_FISCALIA_SOLO_EN_PRESUNTOS_DELITOS,
       FECH_DEN_FISC = FECHA_DE_DENUNCIA_EN_FISCALIA_ddmmaaaa,
       STS_DEN_JPCDNA = EXISTE_DENUNCIA_EN_JCPDNASOLO_EN_PRESUNTAS_VULNERACIONES,
       FECH_DEN_JPCDNA = FECHA_DE_DENUNCIA_EN_JCPDNA_ddmmaaaa,
       OBSER_NUD_CRIT = OBSERVACIONES_YO_NUDOS_CRITICOS)


ren_cas_2 <- cas_zona_2 %>% rename(FECHA_CONOCIMIENTO=FECHA_DE_CONOCIMIENTO_ddmmaaaa,
                                   NUM_IDEN_VICTIM=NUMERO_DE_DOCUMENTO_DE_IDENTIDAD_9,
                                   NOM_VIC=NOMBRES_Y_APELLIDOS_10,
                                   EDAD_VIC=EDAD_12,
                                   GEN_VIC=GENERO_13,
                                   STS_DISCAPACIDAD=TIENE_DISCAPACIDAD,
                                   DIV_GEN= DIVERSIDAD_DE_GENERO_U_ORIENTACION_SEXUAL,
                                   OTRAS_COND= Otras_condiciones_relevantesESPECIFIQUE,
                                   NOM_REPRES=NOMBRES_Y_APELLIDOS_20,
                                   NUM_TELF_REPRES = NUMERO_DE_TELEFONO,
                                   NUM_IDEN_AGRESOR=NUMERO_DE_DOCUMENTO_DE_IDENTIDAD_22,
                                   NOM_AGRESOR = NOMBRES_Y_APELLIDOS_23,
                                   EDAD_AGRESOR=EDAD_24,
                                   RELAC_VIC = RELACION_ENTRE_LA_VICTIMA_CON_LA_PRESUNTA_PERSONA_AGRESORA,
                                   FECHA_LEV_FICHA = FECHA_DE_LEVANTAMIENTO_DE_LA_FICHA_DE_HECHO_DE_VIOLENCIA_Y_OTROS_RIESGOS_PSICOSOCIALES_ddmmaaaa,
                                   NUM_TRAM_DIST = NUMERO_DE_TRAMITE_PRESENTADO_AL_DISTRITO,
                                   FECHA_INGRESO_DIST = FECHA_DE_INGRESO_DE_CASO_EN_DISTRITO_ddmmaaaa,
                                   STS_PLAN_ACOM = Cuenta_con_Plan_de_Acompanamiento_y_Restitucion_de_derechos_o_Plan_de_Atencion_y_seguimiento_Psicosocial,
                                   SALUD = SALUD_Psicologico_y_medico,
                                   STS_DEN_FISCALIA = EXISTE_DENUNCIA_EN_FISCALIA_SOLO_EN_PRESUNTOS_DELITOS,
                                   FECH_DEN_FISC = FECHA_DE_DENUNCIA_EN_FISCALIA_ddmmaaaa,
                                   STS_DEN_JPCDNA = EXISTE_DENUNCIA_EN_JCPDNASOLO_EN_PRESUNTAS_VULNERACIONES,
                                   FECH_DEN_JPCDNA = FECHA_DE_DENUNCIA_EN_JCPDNA_ddmmaaaa,
                                   OBSER_NUD_CRIT = OBSERVACIONES_YO_NUDOS_CRITICOS)

ren_cas_3 <- cas_zona_3 %>% rename(FECHA_CONOCIMIENTO=FECHA_DE_CONOCIMIENTO_ddmmaaaa,
                                   NUM_IDEN_VICTIM=NUMERO_DE_DOCUMENTO_DE_IDENTIDAD_9,
                                   NOM_VIC=NOMBRES_Y_APELLIDOS_10,
                                   EDAD_VIC=EDAD_12,
                                   GEN_VIC=GENERO_13,
                                   STS_DISCAPACIDAD=TIENE_DISCAPACIDAD,
                                   DIV_GEN= DIVERSIDAD_DE_GENERO_U_ORIENTACION_SEXUAL,
                                   OTRAS_COND= Otras_condiciones_relevantesESPECIFIQUE,
                                   NOM_REPRES=NOMBRES_Y_APELLIDOS_20,
                                   NUM_TELF_REPRES = NUMERO_DE_TELEFONO,
                                   NUM_IDEN_AGRESOR=NUMERO_DE_DOCUMENTO_DE_IDENTIDAD_22,
                                   NOM_AGRESOR = NOMBRES_Y_APELLIDOS_23,
                                   EDAD_AGRESOR=EDAD_24,
                                   RELAC_VIC = RELACION_ENTRE_LA_VICTIMA_CON_LA_PRESUNTA_PERSONA_AGRESORA,
                                   FECHA_LEV_FICHA = FECHA_DE_LEVANTAMIENTO_DE_LA_FICHA_DE_HECHO_DE_VIOLENCIA_Y_OTROS_RIESGOS_PSICOSOCIALES_ddmmaaaa,
                                   NUM_TRAM_DIST = NUMERO_DE_TRAMITE_PRESENTADO_AL_DISTRITO,
                                   FECHA_INGRESO_DIST = FECHA_DE_INGRESO_DE_CASO_EN_DISTRITO_ddmmaaaa,
                                   STS_PLAN_ACOM = Cuenta_con_Plan_de_Acompanamiento_y_Restitucion_de_derechos_o_Plan_de_Atencion_y_seguimiento_Psicosocial,
                                   SALUD = SALUD_Psicologico_y_medico,
                                   STS_DEN_FISCALIA = EXISTE_DENUNCIA_EN_FISCALIA_SOLO_EN_PRESUNTOS_DELITOS,
                                   FECH_DEN_FISC = FECHA_DE_DENUNCIA_EN_FISCALIA_ddmmaaaa,
                                   STS_DEN_JPCDNA = EXISTE_DENUNCIA_EN_JCPDNASOLO_EN_PRESUNTAS_VULNERACIONES,
                                   FECH_DEN_JPCDNA = FECHA_DE_DENUNCIA_EN_JCPDNA_ddmmaaaa,
                                   OBSER_NUD_CRIT = OBSERVACIONES_YO_NUDOS_CRITICOS)

ren_cas_4 <- cas_zona_4 %>% rename(FECHA_CONOCIMIENTO=FECHA_DE_CONOCIMIENTO_ddmmaaaa,
                                   NUM_IDEN_VICTIM=NUMERO_DE_DOCUMENTO_DE_IDENTIDAD_9,
                                   NOM_VIC=NOMBRES_Y_APELLIDOS_10,
                                   EDAD_VIC=EDAD_12,
                                   GEN_VIC=GENERO_13,
                                   STS_DISCAPACIDAD=TIENE_DISCAPACIDAD,
                                   DIV_GEN= DIVERSIDAD_DE_GENERO_U_ORIENTACION_SEXUAL,
                                   OTRAS_COND= Otras_condiciones_relevantesESPECIFIQUE,
                                   NOM_REPRES=NOMBRES_Y_APELLIDOS_20,
                                   NUM_TELF_REPRES = NUMERO_DE_TELEFONO,
                                   NUM_IDEN_AGRESOR=NUMERO_DE_DOCUMENTO_DE_IDENTIDAD_22,
                                   NOM_AGRESOR = NOMBRES_Y_APELLIDOS_23,
                                   EDAD_AGRESOR=EDAD_24,
                                   RELAC_VIC = RELACION_ENTRE_LA_VICTIMA_CON_LA_PRESUNTA_PERSONA_AGRESORA,
                                   FECHA_LEV_FICHA = FECHA_DE_LEVANTAMIENTO_DE_LA_FICHA_DE_HECHO_DE_VIOLENCIA_Y_OTROS_RIESGOS_PSICOSOCIALES_ddmmaaaa,
                                   NUM_TRAM_DIST = NUMERO_DE_TRAMITE_PRESENTADO_AL_DISTRITO,
                                   FECHA_INGRESO_DIST = FECHA_DE_INGRESO_DE_CASO_EN_DISTRITO_ddmmaaaa,
                                   STS_PLAN_ACOM = Cuenta_con_Plan_de_Acompanamiento_y_Restitucion_de_derechos_o_Plan_de_Atencion_y_seguimiento_Psicosocial,
                                   SALUD = SALUD_Psicologico_y_medico,
                                   STS_DEN_FISCALIA = EXISTE_DENUNCIA_EN_FISCALIA_SOLO_EN_PRESUNTOS_DELITOS,
                                   FECH_DEN_FISC = FECHA_DE_DENUNCIA_EN_FISCALIA_ddmmaaaa,
                                   STS_DEN_JPCDNA = EXISTE_DENUNCIA_EN_JCPDNASOLO_EN_PRESUNTAS_VULNERACIONES,
                                   FECH_DEN_JPCDNA = FECHA_DE_DENUNCIA_EN_JCPDNA_ddmmaaaa,
                                   OBSER_NUD_CRIT = OBSERVACIONES_YO_NUDOS_CRITICOS)

ren_cas_5 <- cas_zona_5 %>% rename(FECHA_CONOCIMIENTO=FECHA_DE_CONOCIMIENTO_ddmmaaaa,
                                   NUM_IDEN_VICTIM=NUMERO_DE_DOCUMENTO_DE_IDENTIDAD_9,
                                   NOM_VIC=NOMBRES_Y_APELLIDOS_10,
                                   EDAD_VIC=EDAD_12,
                                   GEN_VIC=GENERO_13,
                                   STS_DISCAPACIDAD=TIENE_DISCAPACIDAD,
                                   DIV_GEN= DIVERSIDAD_DE_GENERO_U_ORIENTACION_SEXUAL,
                                   OTRAS_COND= Otras_condiciones_relevantesESPECIFIQUE,
                                   NOM_REPRES=NOMBRES_Y_APELLIDOS_20,
                                   NUM_TELF_REPRES = NUMERO_DE_TELEFONO,
                                   NUM_IDEN_AGRESOR=NUMERO_DE_DOCUMENTO_DE_IDENTIDAD_22,
                                   NOM_AGRESOR = NOMBRES_Y_APELLIDOS_23,
                                   EDAD_AGRESOR=EDAD_24,
                                   RELAC_VIC = RELACION_ENTRE_LA_VICTIMA_CON_LA_PRESUNTA_PERSONA_AGRESORA,
                                   FECHA_LEV_FICHA = FECHA_DE_LEVANTAMIENTO_DE_LA_FICHA_DE_HECHO_DE_VIOLENCIA_Y_OTROS_RIESGOS_PSICOSOCIALES_ddmmaaaa,
                                   NUM_TRAM_DIST = NUMERO_DE_TRAMITE_PRESENTADO_AL_DISTRITO,
                                   FECHA_INGRESO_DIST = FECHA_DE_INGRESO_DE_CASO_EN_DISTRITO_ddmmaaaa,
                                   STS_PLAN_ACOM = Cuenta_con_Plan_de_Acompanamiento_y_Restitucion_de_derechos_o_Plan_de_Atencion_y_seguimiento_Psicosocial,
                                   SALUD = SALUD_Psicologico_y_medico,
                                   STS_DEN_FISCALIA = EXISTE_DENUNCIA_EN_FISCALIA_SOLO_EN_PRESUNTOS_DELITOS,
                                   FECH_DEN_FISC = FECHA_DE_DENUNCIA_EN_FISCALIA_ddmmaaaa,
                                   STS_DEN_JPCDNA = EXISTE_DENUNCIA_EN_JCPDNASOLO_EN_PRESUNTAS_VULNERACIONES,
                                   FECH_DEN_JPCDNA = FECHA_DE_DENUNCIA_EN_JCPDNA_ddmmaaaa,
                                   OBSER_NUD_CRIT = OBSERVACIONES_YO_NUDOS_CRITICOS)

ren_cas_6 <- cas_zona_6 %>% rename(FECHA_CONOCIMIENTO=FECHA_DE_CONOCIMIENTO_ddmmaaaa,
                                   NUM_IDEN_VICTIM=NUMERO_DE_DOCUMENTO_DE_IDENTIDAD_9,
                                   NOM_VIC=NOMBRES_Y_APELLIDOS_10,
                                   EDAD_VIC=EDAD_12,
                                   GEN_VIC=GENERO_13,
                                   STS_DISCAPACIDAD=TIENE_DISCAPACIDAD,
                                   DIV_GEN= DIVERSIDAD_DE_GENERO_U_ORIENTACION_SEXUAL,
                                   OTRAS_COND= Otras_condiciones_relevantesESPECIFIQUE,
                                   NOM_REPRES=NOMBRES_Y_APELLIDOS_20,
                                   NUM_TELF_REPRES = NUMERO_DE_TELEFONO,
                                   NUM_IDEN_AGRESOR=NUMERO_DE_DOCUMENTO_DE_IDENTIDAD_22,
                                   NOM_AGRESOR = NOMBRES_Y_APELLIDOS_23,
                                   EDAD_AGRESOR=EDAD_24,
                                   RELAC_VIC = RELACION_ENTRE_LA_VICTIMA_CON_LA_PRESUNTA_PERSONA_AGRESORA,
                                   FECHA_LEV_FICHA = FECHA_DE_LEVANTAMIENTO_DE_LA_FICHA_DE_HECHO_DE_VIOLENCIA_Y_OTROS_RIESGOS_PSICOSOCIALES_ddmmaaaa,
                                   NUM_TRAM_DIST = NUMERO_DE_TRAMITE_PRESENTADO_AL_DISTRITO,
                                   FECHA_INGRESO_DIST = FECHA_DE_INGRESO_DE_CASO_EN_DISTRITO_ddmmaaaa,
                                   STS_PLAN_ACOM = Cuenta_con_Plan_de_Acompanamiento_y_Restitucion_de_derechos_o_Plan_de_Atencion_y_seguimiento_Psicosocial,
                                   SALUD = SALUD_Psicologico_y_medico,
                                   STS_DEN_FISCALIA = EXISTE_DENUNCIA_EN_FISCALIA_SOLO_EN_PRESUNTOS_DELITOS,
                                   FECH_DEN_FISC = FECHA_DE_DENUNCIA_EN_FISCALIA_ddmmaaaa,
                                   STS_DEN_JPCDNA = EXISTE_DENUNCIA_EN_JCPDNASOLO_EN_PRESUNTAS_VULNERACIONES,
                                   FECH_DEN_JPCDNA = FECHA_DE_DENUNCIA_EN_JCPDNA_ddmmaaaa,
                                   OBSER_NUD_CRIT = OBSERVACIONES_YO_NUDOS_CRITICOS)


ren_cas_7 <- cas_zona_7 %>% rename(FECHA_CONOCIMIENTO=FECHA_DE_CONOCIMIENTO_ddmmaaaa,
                                   NUM_IDEN_VICTIM=NUMERO_DE_DOCUMENTO_DE_IDENTIDAD_9,
                                   NOM_VIC=NOMBRES_Y_APELLIDOS_10,
                                   EDAD_VIC=EDAD_12,
                                   GEN_VIC=GENERO_13,
                                   STS_DISCAPACIDAD=TIENE_DISCAPACIDAD,
                                   DIV_GEN= DIVERSIDAD_DE_GENERO_U_ORIENTACION_SEXUAL,
                                   OTRAS_COND= Otras_condiciones_relevantesESPECIFIQUE,
                                   NOM_REPRES=NOMBRES_Y_APELLIDOS_20,
                                   NUM_TELF_REPRES = NUMERO_DE_TELEFONO,
                                   NUM_IDEN_AGRESOR=NUMERO_DE_DOCUMENTO_DE_IDENTIDAD_22,
                                   NOM_AGRESOR = NOMBRES_Y_APELLIDOS_23,
                                   EDAD_AGRESOR=EDAD_24,
                                   RELAC_VIC = RELACION_ENTRE_LA_VICTIMA_CON_LA_PRESUNTA_PERSONA_AGRESORA,
                                   FECHA_LEV_FICHA = FECHA_DE_LEVANTAMIENTO_DE_LA_FICHA_DE_HECHO_DE_VIOLENCIA_Y_OTROS_RIESGOS_PSICOSOCIALES_ddmmaaaa,
                                   NUM_TRAM_DIST = NUMERO_DE_TRAMITE_PRESENTADO_AL_DISTRITO,
                                   FECHA_INGRESO_DIST = FECHA_DE_INGRESO_DE_CASO_EN_DISTRITO_ddmmaaaa,
                                   STS_PLAN_ACOM = Cuenta_con_Plan_de_Acompanamiento_y_Restitucion_de_derechos_o_Plan_de_Atencion_y_seguimiento_Psicosocial,
                                   SALUD = SALUD_Psicologico_y_medico,
                                   STS_DEN_FISCALIA = EXISTE_DENUNCIA_EN_FISCALIA_SOLO_EN_PRESUNTOS_DELITOS,
                                   FECH_DEN_FISC = FECHA_DE_DENUNCIA_EN_FISCALIA_ddmmaaaa,
                                   STS_DEN_JPCDNA = EXISTE_DENUNCIA_EN_JCPDNASOLO_EN_PRESUNTAS_VULNERACIONES,
                                   FECH_DEN_JPCDNA = FECHA_DE_DENUNCIA_EN_JCPDNA_ddmmaaaa,
                                   OBSER_NUD_CRIT = OBSERVACIONES_YO_NUDOS_CRITICOS)


ren_cas_8 <- cas_zona_8 %>% rename(FECHA_CONOCIMIENTO=FECHA_DE_CONOCIMIENTO_ddmmaaaa,
                                   NUM_IDEN_VICTIM=NUMERO_DE_DOCUMENTO_DE_IDENTIDAD_9,
                                   NOM_VIC=NOMBRES_Y_APELLIDOS_10,
                                   EDAD_VIC=EDAD_12,
                                   GEN_VIC=GENERO_13,
                                   STS_DISCAPACIDAD=TIENE_DISCAPACIDAD,
                                   DIV_GEN= DIVERSIDAD_DE_GENERO_U_ORIENTACION_SEXUAL,
                                   OTRAS_COND= Otras_condiciones_relevantesESPECIFIQUE,
                                   NOM_REPRES=NOMBRES_Y_APELLIDOS_20,
                                   NUM_TELF_REPRES = NUMERO_DE_TELEFONO,
                                   NUM_IDEN_AGRESOR=NUMERO_DE_DOCUMENTO_DE_IDENTIDAD_22,
                                   NOM_AGRESOR = NOMBRES_Y_APELLIDOS_23,
                                   EDAD_AGRESOR=EDAD_24,
                                   RELAC_VIC = RELACION_ENTRE_LA_VICTIMA_CON_LA_PRESUNTA_PERSONA_AGRESORA,
                                   FECHA_LEV_FICHA = FECHA_DE_LEVANTAMIENTO_DE_LA_FICHA_DE_HECHO_DE_VIOLENCIA_Y_OTROS_RIESGOS_PSICOSOCIALES_ddmmaaaa,
                                   NUM_TRAM_DIST = NUMERO_DE_TRAMITE_PRESENTADO_AL_DISTRITO,
                                   FECHA_INGRESO_DIST = FECHA_DE_INGRESO_DE_CASO_EN_DISTRITO_ddmmaaaa,
                                   STS_PLAN_ACOM = Cuenta_con_Plan_de_Acompanamiento_y_Restitucion_de_derechos_o_Plan_de_Atencion_y_seguimiento_Psicosocial,
                                   SALUD = SALUD_Psicologico_y_medico,
                                   STS_DEN_FISCALIA = EXISTE_DENUNCIA_EN_FISCALIA_SOLO_EN_PRESUNTOS_DELITOS,
                                   FECH_DEN_FISC = FECHA_DE_DENUNCIA_EN_FISCALIA_ddmmaaaa,
                                   STS_DEN_JPCDNA = EXISTE_DENUNCIA_EN_JCPDNASOLO_EN_PRESUNTAS_VULNERACIONES,
                                   FECH_DEN_JPCDNA = FECHA_DE_DENUNCIA_EN_JCPDNA_ddmmaaaa,
                                   OBSER_NUD_CRIT = OBSERVACIONES_YO_NUDOS_CRITICOS)

ren_cas_9 <- cas_zona_9 %>% rename(FECHA_CONOCIMIENTO=FECHA_DE_CONOCIMIENTO_ddmmaaaa,
                                   NUM_IDEN_VICTIM=NUMERO_DE_DOCUMENTO_DE_IDENTIDAD_9,
                                   NOM_VIC=NOMBRES_Y_APELLIDOS_10,
                                   EDAD_VIC=EDAD_12,
                                   GEN_VIC=GENERO_13,
                                   STS_DISCAPACIDAD=TIENE_DISCAPACIDAD,
                                   DIV_GEN= DIVERSIDAD_DE_GENERO_U_ORIENTACION_SEXUAL,
                                   OTRAS_COND= Otras_condiciones_relevantesESPECIFIQUE,
                                   NOM_REPRES=NOMBRES_Y_APELLIDOS_20,
                                   NUM_TELF_REPRES = NUMERO_DE_TELEFONO,
                                   NUM_IDEN_AGRESOR=NUMERO_DE_DOCUMENTO_DE_IDENTIDAD_22,
                                   NOM_AGRESOR = NOMBRES_Y_APELLIDOS_23,
                                   EDAD_AGRESOR=EDAD_24,
                                   RELAC_VIC = RELACION_ENTRE_LA_VICTIMA_CON_LA_PRESUNTA_PERSONA_AGRESORA,
                                   FECHA_LEV_FICHA = FECHA_DE_LEVANTAMIENTO_DE_LA_FICHA_DE_HECHO_DE_VIOLENCIA_Y_OTROS_RIESGOS_PSICOSOCIALES_ddmmaaaa,
                                   NUM_TRAM_DIST = NUMERO_DE_TRAMITE_PRESENTADO_AL_DISTRITO,
                                   FECHA_INGRESO_DIST = FECHA_DE_INGRESO_DE_CASO_EN_DISTRITO_ddmmaaaa,
                                   STS_PLAN_ACOM = Cuenta_con_Plan_de_Acompanamiento_y_Restitucion_de_derechos_o_Plan_de_Atencion_y_seguimiento_Psicosocial,
                                   SALUD = SALUD_Psicologico_y_medico,
                                   STS_DEN_FISCALIA = EXISTE_DENUNCIA_EN_FISCALIA_SOLO_EN_PRESUNTOS_DELITOS,
                                   FECH_DEN_FISC = FECHA_DE_DENUNCIA_EN_FISCALIA_ddmmaaaa,
                                   STS_DEN_JPCDNA = EXISTE_DENUNCIA_EN_JCPDNASOLO_EN_PRESUNTAS_VULNERACIONES,
                                   FECH_DEN_JPCDNA = FECHA_DE_DENUNCIA_EN_JCPDNA_ddmmaaaa,
                                   OBSER_NUD_CRIT = OBSERVACIONES_YO_NUDOS_CRITICOS)

dep_zona_1 <- ren_cas_1[rowSums(!is.na(ren_cas_1)) >= 3, ]

dep_zona_2 <- ren_cas_2[rowSums(!is.na(ren_cas_2)) >= 3, ]

dep_zona_3 <- ren_cas_3[rowSums(!is.na(ren_cas_3)) >= 3, ]

dep_zona_4 <- ren_cas_4[rowSums(!is.na(ren_cas_4)) >= 3, ]

dep_zona_5 <- ren_cas_5[rowSums(!is.na(ren_cas_5)) >= 3, ]

dep_zona_6 <- ren_cas_6[rowSums(!is.na(ren_cas_6)) >= 3, ]

dep_zona_7 <- ren_cas_7[rowSums(!is.na(ren_cas_7)) >= 3, ]

dep_zona_8 <- ren_cas_8[rowSums(!is.na(ren_cas_8)) >= 3, ]

dep_zona_9 <- ren_cas_9[rowSums(!is.na(ren_cas_9)) >= 3, ]

dep_zona_1$FECHA_CONOCIMIENTO <- as.Date(dep_zona_1$FECHA_CONOCIMIENTO, format = "%Y-%m-%d")
dep_zona_1$FECHA_LEV_FICHA <- as.Date(dep_zona_1$FECHA_LEV_FICHA, format = "%Y-%m-%d")
dep_zona_1$FECHA_INGRESO_DIST <- as.Date(dep_zona_1$FECHA_INGRESO_DIST, format = "%Y-%m-%d")
dep_zona_1$FECH_DEN_FISC <- as.Date(dep_zona_1$FECH_DEN_FISC, format = "%Y-%m-%d")
dep_zona_1$FECH_DEN_JPCDNA <- as.Date(dep_zona_1$FECH_DEN_JPCDNA, format = "%Y-%m-%d")

dep_zona_2$FECHA_CONOCIMIENTO <- as.Date(dep_zona_2$FECHA_CONOCIMIENTO, format = "%Y-%m-%d")
dep_zona_2$FECHA_LEV_FICHA <- as.Date(dep_zona_2$FECHA_LEV_FICHA, format = "%Y-%m-%d")
dep_zona_2$FECHA_INGRESO_DIST <- as.Date(dep_zona_2$FECHA_INGRESO_DIST, format = "%Y-%m-%d")
dep_zona_2$FECH_DEN_FISC <- as.Date(dep_zona_2$FECH_DEN_FISC, format = "%Y-%m-%d")
dep_zona_2$FECH_DEN_JPCDNA <- as.Date(dep_zona_2$FECH_DEN_JPCDNA, format = "%Y-%m-%d")

dep_zona_3$FECHA_CONOCIMIENTO <- as.Date(dep_zona_3$FECHA_CONOCIMIENTO, format = "%Y-%m-%d")
dep_zona_3$FECHA_LEV_FICHA <- as.Date(dep_zona_3$FECHA_LEV_FICHA, format = "%Y-%m-%d")
dep_zona_3$FECHA_INGRESO_DIST <- as.Date(dep_zona_3$FECHA_INGRESO_DIST, format = "%Y-%m-%d")
dep_zona_3$FECH_DEN_FISC <- as.Date(dep_zona_3$FECH_DEN_FISC, format = "%Y-%m-%d")
dep_zona_3$FECH_DEN_JPCDNA <- as.Date(dep_zona_3$FECH_DEN_JPCDNA, format = "%Y-%m-%d")

dep_zona_4$FECHA_CONOCIMIENTO <- as.Date(dep_zona_4$FECHA_CONOCIMIENTO, format = "%Y-%m-%d")
dep_zona_4$FECHA_LEV_FICHA <- as.Date(dep_zona_4$FECHA_LEV_FICHA, format = "%Y-%m-%d")
dep_zona_4$FECHA_INGRESO_DIST <- as.Date(dep_zona_4$FECHA_INGRESO_DIST, format = "%Y-%m-%d")
dep_zona_4$FECH_DEN_FISC <- as.Date(dep_zona_4$FECH_DEN_FISC, format = "%Y-%m-%d")
dep_zona_4$FECH_DEN_JPCDNA <- as.Date(dep_zona_4$FECH_DEN_JPCDNA, format = "%Y-%m-%d")

dep_zona_5$FECHA_CONOCIMIENTO <- as.Date(dep_zona_5$FECHA_CONOCIMIENTO, format = "%Y-%m-%d")
dep_zona_5$FECHA_LEV_FICHA <- as.Date(dep_zona_5$FECHA_LEV_FICHA, format = "%Y-%m-%d")
dep_zona_5$FECHA_INGRESO_DIST <- as.Date(dep_zona_5$FECHA_INGRESO_DIST, format = "%Y-%m-%d")
dep_zona_5$FECH_DEN_FISC <- as.Date(dep_zona_5$FECH_DEN_FISC, format = "%Y-%m-%d")
dep_zona_5$FECH_DEN_JPCDNA <- as.Date(dep_zona_5$FECH_DEN_JPCDNA, format = "%Y-%m-%d")

dep_zona_6$FECHA_CONOCIMIENTO <- as.Date(dep_zona_6$FECHA_CONOCIMIENTO, format = "%Y-%m-%d")
dep_zona_6$FECHA_LEV_FICHA <- as.Date(dep_zona_6$FECHA_LEV_FICHA, format = "%Y-%m-%d")
dep_zona_6$FECHA_INGRESO_DIST <- as.Date(dep_zona_6$FECHA_INGRESO_DIST, format = "%Y-%m-%d")
dep_zona_6$FECH_DEN_FISC <- as.Date(dep_zona_6$FECH_DEN_FISC, format = "%Y-%m-%d")
dep_zona_6$FECH_DEN_JPCDNA <- as.Date(dep_zona_6$FECH_DEN_JPCDNA, format = "%Y-%m-%d")

dep_zona_7$FECHA_CONOCIMIENTO <- as.Date(dep_zona_7$FECHA_CONOCIMIENTO, format = "%Y-%m-%d")
dep_zona_7$FECHA_LEV_FICHA <- as.Date(dep_zona_7$FECHA_LEV_FICHA, format = "%Y-%m-%d")
dep_zona_7$FECHA_INGRESO_DIST <- as.Date(dep_zona_7$FECHA_INGRESO_DIST, format = "%Y-%m-%d")
dep_zona_7$FECH_DEN_FISC <- as.Date(dep_zona_7$FECH_DEN_FISC, format = "%Y-%m-%d")
dep_zona_7$FECH_DEN_JPCDNA <- as.Date(dep_zona_7$FECH_DEN_JPCDNA, format = "%Y-%m-%d")

dep_zona_8$FECHA_CONOCIMIENTO <- as.Date(dep_zona_8$FECHA_CONOCIMIENTO, format = "%Y-%m-%d")
dep_zona_8$FECHA_LEV_FICHA <- as.Date(dep_zona_8$FECHA_LEV_FICHA, format = "%Y-%m-%d")
dep_zona_8$FECHA_INGRESO_DIST <- as.Date(dep_zona_8$FECHA_INGRESO_DIST, format = "%Y-%m-%d")
dep_zona_8$FECH_DEN_FISC <- as.Date(dep_zona_8$FECH_DEN_FISC, format = "%Y-%m-%d")
dep_zona_8$FECH_DEN_JPCDNA <- as.Date(dep_zona_8$FECH_DEN_JPCDNA, format = "%Y-%m-%d")

dep_zona_9$FECHA_CONOCIMIENTO <- as.Date(dep_zona_9$FECHA_CONOCIMIENTO, format = "%Y-%m-%d")
dep_zona_9$FECHA_LEV_FICHA <- as.Date(dep_zona_9$FECHA_LEV_FICHA, format = "%Y-%m-%d")
dep_zona_9$FECHA_INGRESO_DIST <- as.Date(dep_zona_9$FECHA_INGRESO_DIST, format = "%Y-%m-%d")
dep_zona_9$FECH_DEN_FISC <- as.Date(dep_zona_9$FECH_DEN_FISC, format = "%Y-%m-%d")
dep_zona_9$FECH_DEN_JPCDNA <- as.Date(dep_zona_9$FECH_DEN_JPCDNA, format = "%Y-%m-%d")

consol_casos <- rbind(dep_zona_1, dep_zona_2, dep_zona_3, dep_zona_4, dep_zona_7, dep_zona_8, dep_zona_9)

consol_casos$CODIGO_AMIE <- toupper(consol_casos$CODIGO_AMIE)

# write.xlsx(consol_casos, "C:/Users/juan.minchalo/Desktop/MINEDUC/2. Riesgos Psicosociales/4. RPS - EIS 2024/2. II TRIM/CONSOLIDADO_I_TRIM/UNION_RPS.xlsx")

tabla_res_cas <- as.data.frame(table(consol_casos$TIPO_DE_CASO))



######CARGAR BASE PARA CRUCE AMIE#############

base_AMIE <- read_excel(path = "C:/Users/juan.minchalo/Desktop/AMIE PARA ANALISIS/AMIE_DISTRIT/1MINEDUC_RegistrosAdministrativos_2023-2024_FINAL.xlsx",
                                  sheet = "Sheet 1")

union_amie <- consol_casos %>%  left_join(base_AMIE, by = c("CODIGO_AMIE"), suffix = c("_casos", "_bamie"))

###########SELECCIÓN DE VARIABLES ##########################################################

consol_2_est <- union_amie %>% mutate( AÑO = "2024", Regimen_escolar = Régimen_Escolar,
                                       AÑO_LECTIVO = NA, TIPO_DE_CASO_2 = NA,
                                       NACIONALIDAD_INDIGENA = NA, PUEBLO_INDIGENA =NA,
                                       RELAC_VIC_2 = NA, STS_PLAN_ACOM_2 = NA,
                                       ) %>% 
  select(AÑO, Zona, Provincia, Cantón, Cod_Distrito, Distrito, CODIGO_AMIE,
         NOMBRE_INSTITUCION_EDUCATIVA, Sostenimiento, Área, Regimen_escolar,
         AÑO_LECTIVO,5, TIPO_DE_CASO_2,6:14, NACIONALIDAD_INDIGENA, PUEBLO_INDIGENA,
         15:26, RELAC_VIC_2, 27:32, STS_PLAN_ACOM_2, 33:43)


write.xlsx(consol_2_est, "C:/Users/juan.minchalo/Desktop/MINEDUC/2. Riesgos Psicosociales/4. RPS - EIS 2024/2. II TRIM/CONSOLIDADO_II_TRIM/UNION_RPS_V3.xlsx")



# # Definir patrones para buscar "msp" y "mag"
# patrones_caso <- c("Psicológica", "psicológica", "PSICOLOGICA",
#                    "Física", "física", "FISICA",
#                    "embarazo", "Embarazo", "EMBARAZO", 
#                    "maternidad", "paternidad", "Maternidad", "Paternidad", 
#                    "droga", "sustancias", 
#                    "trabajo infantil", "trabajo", 
#                    "suicidcio","Suicidio","SUICIDIO",
#                    "Otro", "OTRO", "otro", 
#                    "autolítico", "AUTOLÍTICO", "intento",
#                    "Acoso", "acoso", "ACOSO",
#                    "Negligencia", "NEGLIGENCIA"
# )
# 
# 
# # FunciC3n para extraer "msp" y "mag" de un texto
# extraer_casos <- function(texto) {
#   resultado <- str_extract_all(texto, paste(patrones_caso, collapse = "|"))
#   return(resultado)
# }
# 
# 
# consol_3_est <- consol_2_est %>%
#   mutate(CASOS_2 = sapply(TIPO_DE_CASO, extraer_casos))
# 
# consol_3_est$CASOS_2 <- as.character(consol_3_est$CASOS_2)
# 
# 
# 
# consol_4_est <- consol_2_est %>% mutate(TIPO_DE_CASO_2 =
#                                             case_when(consol_casos$TIPO_DE_CASO == "Psicologica" ~ "Violencia Psicológica",
#                                                       consol_casos$TIPO_DE_CASO == "psicológica" ~ "Violencia Psicológica",
#                                                       consol_casos$TIPO_DE_CASO == "PSICOLOGICA" ~ "Violencia Psicológica",
#                                                       consol_casos$TIPO_DE_CASO == "Física" ~ "Violencia Física",
#                                                       consol_casos$TIPO_DE_CASO == "física" ~ "Violencia Física",
#                                                       consol_casos$TIPO_DE_CASO == "FISICA" ~ "Violencia Física",
#                                                       consol_casos$TIPO_DE_CASO == "embarazo" ~ "Embarazo",
#                                                       consol_casos$TIPO_DE_CASO == "Embarazo" ~ "Embarazo",
#                                                       consol_casos$TIPO_DE_CASO == "EMBARAZO" ~ "Embarazo",
#                                                       consol_casos$TIPO_DE_CASO == "droga" ~ "Uso y consumo de drogas",
#                                                       consol_casos$TIPO_DE_CASO == "trabajo infantil" ~ "Trabajo infantil",
#                                                       consol_casos$TIPO_DE_CASO == "trabajo" ~ "Trabajo infantil",
#                                                       consol_casos$TIPO_DE_CASO == "suicidcio" ~ "Suicidio",
#                                                       consol_casos$TIPO_DE_CASO == "Suicidio" ~ "Suicidio",
#                                                       consol_casos$TIPO_DE_CASO == "SUICIDIO" ~ "Suicidio",
#                                                       consol_casos$TIPO_DE_CASO == "Otro" ~ "Otros",
#                                                       consol_casos$TIPO_DE_CASO == "OTRO" ~ "Otros",
#                                                       consol_casos$TIPO_DE_CASO == "otro" ~ "Otros",
#                                                       consol_casos$TIPO_DE_CASO == "autolítico" ~ "Intentos autolíticos",
#                                                       consol_casos$TIPO_DE_CASO == "AUTOLÍTICO" ~ "Intentos autolíticos",
#                                                       consol_casos$TIPO_DE_CASO == "intento" ~ "Intentos autolíticos",
#                                                       consol_casos$TIPO_DE_CASO == "Acoso" ~ "Acoso",
#                                                       consol_casos$TIPO_DE_CASO == "acoso" ~ "Acoso",
#                                                       consol_casos$TIPO_DE_CASO == "ACOSO" ~ "Acoso",
#                                                       consol_casos$TIPO_DE_CASO == "Negligencia" ~ "Negligencia",
#                                                       consol_casos$TIPO_DE_CASO == "NEGLIGENCIA" ~ "Negligencia",
#                                                       consol_casos$TIPO_DE_CASO == "ACOSO" ~ "Acoso",
#                                                       consol_casos$TIPO_DE_CASO == "maternidad" ~ "Maternidad o paternidad tempranas",
#                                                       consol_casos$TIPO_DE_CASO == "Maternidad" ~ "Maternidad o paternidad tempranas",
#                                                       consol_casos$TIPO_DE_CASO == "Paternidad" ~ "Maternidad o paternidad tempranas",
#                                                       consol_casos$TIPO_DE_CASO == "paternidad" ~ "Maternidad o paternidad tempranas",
#                                                       consol_casos$TIPO_DE_CASO == "NEGLIGENCIA" ~ "Negligencia",
#                                                       consol_casos$TIPO_DE_CASO == "NEGLIGENCIA" ~ "Negligencia"))

# "autolítico", "AUTOLÍTICO",
# "Acoso", "acoso", "ACOSO",
# "Negligencia", "NEGLIGENCIA"
# "maternidad", "paternidad", "Maternidad", "Paternidad"