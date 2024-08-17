# Updater REALESE 21/.12421.2DCD S241.1

clear
echo ;echo "Updating."
echo

# -.-.-.-.-

Anim_UPD() {

    for anim_id in {1..5}; do
        echo ;echo "--------------------"
        echo 
        echo "Updating, please wait (.)"
        sleep 0.5
        clear
        echo "Updating, please wait (..)"
        sleep 0.5
        clear
        echo "Updating, please wait (...)"
        sleep 0.5
        clear
    done
}
Anim_UPD &



MAINTENER_UPDATER() {

    # -.-.-.-.-.-.-.-.-.-.-.-.-.-.- PYTHON

   
    if ! command -y pkg &> /dev/null 2>&1; then
        apt install python -y > /dev/null 2>&1
        apt update python -y > /dev/null 2>&1
     else
      pkg install python -y > /dev/null 2>&1
      pkg update python -y > /dev/null 2>&1
      

    # -.-.-.-.-.-.-.-.-.-.-.-.-.-.- RUBY

    

        if ! command -y pkg &> /dev/null 2>&1; then
         apt install ruby -y > /dev/null 2>&1
         apt update ruby -y > /dev/null 2>&1

           else
                 pkg install ruby -y > /dev/null 2>&1
                 pkg update ruby -y > /de/null 2>&1
    

    # -.-.-.-.-.-.-.-.-.-.-.-.-.-.- PERL

    

        if ! command -y pkg &> /dev/null 2>&1; then
          apt install perl -y > /dev/null 2>&1
          apt update perl -y > /dev/null 2>&1

            else
                  pkg install perl -y > /dev/null 2>&1
                  pkg update perl -y > /dev/null 2>&1
    

    # -.-.-.-.-.-.-.-.-.-.-.-.-.-.- END

}


# -.-.-.-.- WAIT / AND / KILL -.-.-.-.-
MAINTENER_UPDATER
wait
sleep 0.5
kill $! > /dev/null 2>&1
