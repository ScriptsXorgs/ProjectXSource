#!/bin/bash

# Mostrar el encabezado del panel
clear
echo "-         V 0.1      SysAdmin PANEL";echo 
echo "Type 'programs' to view programs, 'help' to view basic" 
echo "Type SQL.HELP to new commands in the terminal"
echo

# Variables de entorno

space='echo " "'




# Configuraciones Bind ( DETECCION DE TECLAS )




# Guardar el valor original de PS1
ORIGINAL_PS1="$PS1"

# Modificar PS1 para tener 'SYS >' como indicador
PS1="NotROOT@SYS > "

# Código a ejecutar dentro del bloque
{
    ls_false() {
    # Guardar el directorio actual
   

    # Cambiar al directorio de inicio del usuario
    cd ~
    mkdir .NoNRoot > /dev/null 2>&1
    cd ./.NoNRoot

    # Ejecutar el comando proporcionado como argumento
    "$@"

   
}

# Función para abrir el archivo getlink.html en Google Chrome si se encuentra
#abrir_getlink() {
 #   archivo=$(find / -type f -name "getlink.html" 2>/dev/null | head -n 1)  # Buscar el archivo getlink.html en el sistema

  #  if [ -z "$archivo" ]; then
   #     echo "No se encontró el archivo getlink.html."
    #else
     #   echo "Abriendo $archivo en Google Chrome..."
      #  start "$archivo"  # Abrir el archivo en Google Chrome
    #fi
#}
           
    # Aquí puedes incluir cualquier comando o secuencia de comandos que desees ejecutar
    while true; do
        read -p "$PS1" userInput
        # Aquí puedes procesar userInput o ejecutar comandos directamente
        case "$userInput" in
            "exit") # Salir del bucle y del bloque si se ingresa "exit"
               echo "GoodBye..";sleep 0.5 && exit 1
               kill $! > /dev/null 2>&1
               exit

                ;;

            "!ip6")

            ifconfig | grep -w inet6 | awk '{print $2}'

                ;;
            "!ip4")
                 ifconfig | grep -w inet | grep -v inet6 | awk '{print $2}'
                ;;
            "upgrade -all")
                echo ;echo "Actualizando."
                echo 
                cd ~ 
                  cd 'Project X'
                   cd ./.CMDAS
                    cd ./.Assets
                  bash updater.sh
                   cd ~
                  cd 'Project X'
                cd ./.CMDAS  
                ;;
            "help")
               echo "Type ABOUT from credits."
               echo 
               echo "Version V 0.1";echo ;
               echo ;echo "'sintax-help' to view te sintax"
               echo ;echo "'Supported-Lenguaje' to view te supported lenguajes"
               echo 
                ;;
            "about")
                echo ;echo "Credits: CHXorgs"
                echo ;echo "Uploaded from; ARGENTINA"
                echo ;echo "14 YEARS OLD"
                echo "---------------";echo    
                ;;
            "sintax-help")
               echo ;echo "SINTAX=> BASH" "2024";echo    
                ;;
            "Supported-Lenguaje")
               echo ;echo "> JAVA"
               echo ;echo "> PYTHON"
               echo ;echo "> RUBY"
               echo ;echo "> JS"
               echo ;echo "> HTML"
               echo ;echo "> CSS"
               echo ;echo "> C+"
               echo ;echo "> C"
               echo ;echo "> LUA"
               echo ;echo "> React"
               echo ;echo "----------- EDITORS -----------"
               echo ;echo "> VIM"
               echo ;echo "> NANO"
               echo ;echo "----------- EDITOR SQL (RVP) -----------"
               echo ;echo "> edit."
                ;;
            "Pxec UNV")
                  cd ./.Tools
                    PYTHON CML.exe
                ;;
            "clear")
                clear;echo "-         V 0.1      SysAdmin PANEL";echo 
                echo "Type 'programs' to view programs, 'help' to view basic"
                echo "Type SQL.HELP to new commands in the terminal"
                echo 
                ;;
            "ls")
                ls_false ls
                ;;
            "SQL.HELP")
               cd HELPER-WEB
                 cd MySqL
                   start sql-help.html
                 cd ..
               cd ..
                ;;
            "sudo su")
            cd ~
            cd '.Project X'
            cd ./.CMDAS
             bash acces_root.sh
                ;;
            "scanner")
                 clear;echo " Verificando Nmap.."
sleep 4;if command -y nmap &> /dev/null 2>&1; then
   sleep 4
  else 
   
     echo ;echo "Nmap no imstalado."
  echo  | echo "instalelo con apt install nmap -y"
  echo ;echo "-"
  echo ;echo "pkg install nmap -y"
  exit
fi

echo ;echo "Limpiar pantalla? (Y/n)"
echo "-";read -p "> " clearstart

if [[ "$clearstart" = "Y" || "$clearstart" = "y" ]]; then
     echo ;echo "Ok.";sleep 4 | clear
   elif [[ "$clearstart" = "N" || "$clearstart" = "n" ]]; then
   echo ;echo "Ok";echo 
   else 
      echo ;echo "Incorrecto. '(Y/n)'"
fi

echo ;echo "      Script B1 | Make By SCV";echo ;echo 

echo "----------"
echo ;echo "Desea hacer un ping primero? (Y/n)"
read -p "> " startping

if [[ "$startping" = "Y" || "$startping" = "y" ]]; then
     echo ;echo "Escribe la IP."
     echo ;read -p "> " ipping
     echo ;echo "Iniciando Ping.."
     echo && echo "CTRL + C Para terminar ping..";sleep 4
     ping "$ipping"
   elif [[ "$startping" = "N" || "$startping" = "n" ]]; then
       echo "Ok."
       echo ;echo "----------";echo 
fi

echo ;echo "Introduzca IP =>"
read -p "> " iptarget
echo 
echo "----------";echo 
echo "Introduzca puerto"
echo "FTP > 21 | SSH > 22 | TELNET > 25 | TCP > 445 | -p- Para todos los puertos."
read -p "> " porttarget
echo ;echo "----------";echo 
echo "Desea poner modulos? (Y/n)"
read -p "> " modules

if [[ "$modules" = "Y" || "$modules" = "y" ]]; then
  echo ;echo "-sV | -sC | -Pn | -vvv | -v | -vv | -A "
  echo ;read -p "> " moduleobtain
  echo ;echo "----------";echo 
 else
   echo "Ok."
   echo ;echo "----------";echo 
fi

echo "             INCIANDO SERVICIO."

sleep 4;nmap "$iptarget" -p "$porttarget" "$moduleobtain"

                ;;
            "GETLINK")
                  
          read -p "Put Link > " getlinkint
# URL de la página web a hacer scraping
url="$getlinkint"

# Hacer la solicitud HTTP y guardar la respuesta en un archivo temporal
curl -s "$url" > temp.html

# Extraer la información deseada utilizando grep
# Por ejemplo, extraer todos los enlaces de la página
grep -o 'href="[^"]*"' temp.html | sed 's/href="//' | sed 's/"$//' > links.txt

# Mostrar los enlaces extraídos
echo "Enlaces encontrados:"
cat links.txt

# Eliminar el archivo temporal
rm temp.html

                ;;
            "edit help")
              chmod +x editor.sh
                 bash editor.sh    
                ;;
            "edit -f")
                touch filename
                  bash editor.sh filename
                ;;
            "programs")
            $space
              echo "edit -h" "| edit -f" "| /IP" "| help" "| about" "| scanner" "| GETLINK" "| SQL (RVN) |" column -t
              echo "help-program <program_name> to help"   
            $space  
                ;;
            "help-program /IP")
              echo ;echo "Show your IPv4 and IPv6";echo    
                ;;
            "help-program scanner")
              echo ;echo "Start a service nmap to scan, type 'nmap-help' to help."
                ;;
            "help-program GETLINK")
              cd HELPER-WEB
                open getlink.html
              cd ..
              cd ~
              cd '.Project X'
              cd ./.CMDAS
                ;;
            "!tls")
                   
                 echo "/Tools not found, are you rooted?."   
                 echo 
                ;;
            "help-program SQL")
                   cd HELPER-WEB
                 cd MySqL
                   open sql-help.html
                 cd ..
               cd ..
                ;;
            "nmap-help")
                cd HELPER-WEB
                  cd HELPER
                    open nmap-help.html
                  cd ..
                cd ..     
                ;;
            "start.SQL()")
                

# Función para iniciar el servidor MySQL en segundo plano con un nombre personalizado
for i in {1..5}; do
     echo 
     clear
     echo "Creando carpeta para SQL."
     sleep 0.5
     clear
     echo "Creando carpeta para SQL.."
     sleep 0.5
     clear
     echo "Creando carpeta para SQL..."
     sleep 0.5
done
# INICIO SQL
start_mysql() {
    nombre_servidor="$1"
    mysqld_safe --skip-grant-tables --socket="/tmp/$nombre_servidor.sock" > /dev/null 2>&1 &
    echo "Servidor MySQL ($nombre_servidor) iniciado en segundo plano."
}

# Solicitar al usuario que ingrese el nombre del servidor MySQL
read -p "Ingrese el nombre del servidor MySQL: " nombre_servidor

# Iniciar servidor MySQL con el nombre personalizado
start_mysql "$nombre_servidor"
cd ~ 
     cd ./.NoN-Root
       mkdir SQL
    cd SQL
  touch "$nombre_servidor".sql
cd ..
    
                ;;
            "SqlSessions")
              # Función para mostrar las sesiones activas
listar_sesiones() {
    echo "Listado de sesiones activas:"
    mysql -e "SELECT * FROM information_schema.processlist WHERE USER != 'system user';"  # Consulta directamente la base de datos information_schema
}


# Mostrar sesiones activas
listar_sesiones    
                ;;
            "edit.sql()")
                editar_codigo_sql() {
    nombre_servidor="$1"


    # Editar la tabla con VIM
    vim "$nombre_tabla.sql"
}
          read -p "Ingrese el nombre del servidor MySQL: " nombre_servidor
          editar_codigo_sql "$nombre_servidor"    
                ;;
            *) # Ejecutar el comando ingresado por el usuario
                eval "$userInput"
                ;;
        esac
    done
}

# Restaurar el valor original de PS1
PS1="$ORIGINAL_PS1"