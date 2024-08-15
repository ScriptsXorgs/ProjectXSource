clear
echo "[INSTALADOR] Bienvenido al instalador de 'Project X', Que sistema tiene?."
echo ">-----------------------------------------------------------------------<"
echo " Usted tiene Android? (Y/n)"
read -p "> " AndroidChoice

if [[ "$AndroidChoice" = "Y" || "$AndroidChoice" = "y" ]]; then
              echo ;
        for i in {1..5}; do

             echo "[SERVICIO] Instalando."
             sleep 0.5
             clear
             echo "[SERVICIO] Instalando.."
             sleep 0.5
             clear
             echo "[SERVICIO] Instalando..."
             sleep 0.5
             clear
         done

                wget https://www.mediafire.com/folder/lttyliwm51y91/Project+X
                 mv 'Project X' $HOME
                   cd 'Project X' 
                  bash Main_Login.sh
         sleep 0.5

         echo "Instalado!."
         sleep 1
         
  elif [[ "$AndroidChoice" = "N" || "$AndroidChoice" = "n" ]]; then
     echo ;
     echo "No hay soporte ni version para Windows."
     echo "Considere cambiarse a TERMUX (ANDROID) | LINUX"
  else 
     echo "Incorrecto."
fi