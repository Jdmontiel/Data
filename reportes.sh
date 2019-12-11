#!/bin/bash




echo -e "campos de la informacion del dataset" 
echo -e "####################################################################################\n"
echo -e "               |             |       |                             |              |"
echo -e " No. de Tienda | No de Depto | Fecha | Ventas del Depsto en tienda | Dias Fesivos |"
echo -e "####################################################################################\n"


 
echo  -e "#####################################\n"
echo -e  Elije el mes  y año del data set que deseas 
echo  -e "#####################################\n"


######indica la ruta del archivo de DataStore######
DATASTO=~/Data/sales_data-set.csv


###### Solicita el valor del MES Al usuario #######
echo -e "Elige el mes:\n"
read "MES";

###### Solicita el valor del Año Al usuario #######
echo -e "Elige el año entre 2010 y 2012:\n"
read  "YEAR"

########## Realiza el reporte mes y año solicitado####################
grep -iE '*,*,*/'${MES}'/'${YEAR}',*,' ${DATASTO} > Sales_Mes_${MES}_Año_${YEAR}.csv;



###### Mensajes de procesamiento y Finalizado #########################3
echo -e Realizando procesamiento de Datos

sleep 2;
echo -e "El Procesamiento ha terminado el nombre del archivo es el siguiente:\n" Sales_Mes_${MES}_Año_${YEAR}.csv;


#####Etapa 2 ##########################

echo -e "##################################################\n"
echo -e "Resultado de la tienda que mas vendio General"
echo -e "##################################################\n"

MASG=$(sort -t , -nk 4,6 Sales_Mes_${MES}_Año_${YEAR}.csv | tail -n 1);

echo $MASG

echo -e "##################################################\n"
echo -e "Resultado de la tiendo que menos vendio General"
echo -e "##################################################\n"

MENOSG=$(sort -t , -nk 4,6  Sales_Mes_${MES}_Año_${YEAR}.csv | head -n 1)

echo $MENOSG



################ Comandos Extra#################




#numero de tienda  3 de mes 02 del año 2010
#grep -i "^3,*," Sales_02_2010.csv



#el que mas vendio  por tienda y depto nombrado 

# grep -i "^3,1," Sales_02_2010.csv  | sed 's/^3,1,/Toluca,carnes,/g' | sort -t , -nk 4,6| tail -n 1


#obtener rango de ventas de mes a tal mes 
#grep -i "^4,[2-3]," Sales_02_2010.csv  |  sort -t , -nk 4,6 



#obtener el numero mayor de ventas entre meses  y departamento en especifico 
 #grep -i "^4,[2-3]," Sales_02_2010.csv  |  sort -t , -nk 4,6 | tail -n 1


# grep -i "^3,1," Sales_02_2010.csv  | sed 's/^3,1,/Toluca,carnes,/g' | sort -t , -nk 4,6



#rango de meses dias ordinarios

# grep -Ei '^4,[2-3],.*true' Sales_02_2010.csv  |   sort -t , -nk 4,6








