library(httr)
library(jsonlite)
library(plotly)


#Cubo de datos
#Tabla1
repositorio = GET("http://www.arlss.gov.do/Generador_Documentos/Generador.aspx?format=JSON&report=locations")
repositorio

rawToChar(repositorio$content) #convierte en string o serie de caracteries

Datos = fromJSON(rawToChar(repositorio$content))
names(Datos)

Datos <- data.frame(Datos)


#Grafico1
p = plot_ly(Datos, x = ~Nombre,y = ~Encargado.Provincial,
            name = 'Encargado.Provincial',
            type = 'bar')

p %>% layout(title="Listados de las Oficinas del Instituto Dominicano de Prevención y Protección ... ")

#Fin Grafico1

#Fin Tabla1


#______________________________________________________________________________________________

#tabla2

repositorio2 = GET("http://www.arlss.gov.do/Generador_Documentos/Generador.aspx?format=json&report=Nomin&anio=2019")
repositorio2

rawToChar(repositorio2$content) #convierte en string o serie de caracteries

Nomina = fromJSON(rawToChar(repositorio2$content))
names(Nomina)

Nomina <- data.frame(Nomnina)


#Grafico2
p2 = plot_ly(Nomina, x = ~DEPARTAMENTO,y = ~SUELDO,
            name = 'SUELDO',
            type = 'bar')

p2 %>% layout(title="Nomina de Empleados de IDOPPRIL 2017-2020")

#Fin Grafico2

#Fin Tabla2


#______________________________________________________________________________________________

#tabla3

repositorio3 = GET("http://www.arlss.gov.do/Generador_Documentos/Generador.aspx?format=json&report=EPDX")
repositorio3

rawToChar(repositorio3$content) #convierte en string o serie de caracteries

D_Enfermedades = fromJSON(rawToChar(repositorio3$content))
names(D_Enfermedades)




#Grafico3
p3 = plot_ly(D_Enfermedades, x = ~Diagnostico,y = ~Total,
             name = 'Total',
             type = 'bar')

p3 %>% layout(title="Estadísticas de Enfermedades Profesionales reportadas a la ARLSS")

#Fin Grafico3

#Fin Tabla3



#______________________________________________________________________________________________

#tabla4

repositorio4 = GET("http://www.arlss.gov.do/Generador_Documentos/Generador.aspx?format=json&report=PA&anio=2019")
repositorio4

rawToChar(repositorio4$content) #convierte en string o serie de caracteries

D_Accidentes = fromJSON(rawToChar(repositorio4$content))
names(D_Accidentes)
colnames(D_Accidentes)<- c("AÃ±o",
                    "Mes",
                    "Parte_Afectada",
                    "Total"
)

#Grafico4
p4 = plot_ly(D_Accidentes, x = ~Parte_Afectada,y = ~Total,
             name = 'Total',
             type = 'bar')

p4 %>% layout(title="Accidentes de Trabajo Según Parte del Cuerpo Lesionada")

#Fin Grafico4

#Fin Tabla4



#______________________________________________________________________________________________




#tabla5

repositorio5 = GET("http://www.arlss.gov.do/Generador_Documentos/Generador.aspx?format=json&report=EOAI&anio=2019")
repositorio5

rawToChar(repositorio5$content) #convierte en string o serie de caracteries

D_OAI = fromJSON(rawToChar(repositorio5$content))
names(D_OAI)


#Grafico4
p5 = plot_ly(D_OAI, x = ~Numero,y = ~Genero,
             name = 'Genero',
             type = 'bar')

p5 %>% layout(title="Histórico Estadística OAI, ARLSS, 2018 - 2020")

#Fin Grafico5

#Fin Tabla5
