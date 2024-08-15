

#!/bin/bash

# ---------------------- FUNC TO SOLICIT PASSWORD

allocated_passwd="main.json"

passwd_solicitude() {

    clear
     echo "Welcome to PROJECT X, ' Enter your new PASSWD ' AUTH TWO FACTORS"
     echo ;
      echo "Dont forget you passwd ;) "
      echo ;echo "--"
      echo ;
    read -p "NEW PASSWD > " passwdnew
    echo ;
       cd .pwnrt
       echo '{"contraseña": "'"$passwdnew"'"}' > "$allocated_passwd"
       chmod 600 "$allocated_passwd"
       cd ..

}

 # -------------------- CHECKING PASSWORD

if [ ! -f "$allocated_passwd" ]; then
   passwd_solicitude
   # FNC
      echo "Password saved in $allocated_passwd"
    
    # END.--
  else 
     
     # ANTH FUNCS
      
      echo ;
      echo "Contraseña existente."
      echo ;
fi


autenticar() {
    echo "AUTH TWO FACTORS"
    echo ;
    read -sp "Introduce tu contraseña: " passwd
    echo ""
    cd .pwnrt

    if [ -f "$allocated_passwd" ]; then
        cat "$allocated_passwd" | grep -q "\"contraseña\": \"$passwd\""
        if [ $? -eq 0 ]; then
            echo "¡Contraseña correcta!"
            # Ejecutar el comando existente aquí
            echo ;
            echo "Ejecutando el comando..."
            
            sleep 1

                     cd ~
         cd 'Project X'
         cd ./.CMDAS
         bash root.sh
        else
            echo "Contraseña incorrecta."
            sleep 1
            clear
            autenticar
        fi
    else
        echo "Archivo de contraseña no encontrado."
        sleep 2
        passwd_solicitude
    fi
}

# Iniciar el proceso de autenticación
autenticar