#!/bin/bash

# Verificar si se ha proporcionado un nombre de archivo
if [ -z "$1" ]; then
    echo "Uso: $0 <nombre_del_archivo>"
    exit 1
fi

# Verificar si el archivo existe
if [ ! -f "$1" ]; then
    echo "El archivo '$1' no existe. ¿Deseas crearlo? (s/n)"
    read -r response
    if [[ "$response" != "s" ]]; then
        exit 1
    fi
    touch "$1"
fi

# Función para mostrar el contenido del archivo
display_file() {
    clear
    echo "------ $1 ------"
    cat "$1"
}

# Función para editar el archivo
edit_file() {
    vi "$1" # Cambia a tu editor de texto preferido
}

# Loop principal
while true; do
    display_file "$1"
    echo
    echo "Opciones:"
    echo "1. Editar archivo"
    echo "2. Salir"
    read -r option

    case "$option" in
        1)
            edit_file "$1"
            ;;
        2)
            echo "Saliendo..."
            exit 0
            ;;
        *)
            echo "Opción no válida."
            ;;
    esac
done
