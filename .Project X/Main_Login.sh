#!/bin/bash

# ---------------------- FUNC TO SOLICIT PASSWORD

allocated_passwd=".main.json"

# Hashing function
hash_password() {
    echo -n "$1" | sha256sum | awk '{print $1}'
}

passwd_solicitude() {
    clear
    echo "Welcome to PROJECT X, ' Enter your new PASSWD '"
    echo
    echo "Don't forget your password ;) "
    echo
    echo "--"
    echo
    read -sp "NEW PASSWD > " passwdnew
    echo
    hashed_passwd=$(hash_password "$passwdnew")
    echo '{"contraseña": "'"$hashed_passwd"'"}' > "$allocated_passwd"
    chmod 600 "$allocated_passwd"
}

# -------------------- CHECKING PASSWORD

if [ ! -f "$allocated_passwd" ]; then
    passwd_solicitude
    echo "Password saved in $allocated_passwd"
else
    echo
    echo "Existing password."
    echo
fi

autenticar() {
    echo
    read -sp "Introduce tu contraseña: " passwd
    echo ""

    hashed_passwd=$(hash_password "$passwd")

    if [ -f "$allocated_passwd" ]; then
        if grep -q "\"contraseña\": \"$hashed_passwd\"" "$allocated_passwd"; then
            echo "¡Contraseña correcta!"
            echo
            echo "Ejecutando el comando..."
            sleep 1
            cd ~
            cd '.Project X'
            cd ./.CMDAS
            bash main.sh
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
