#!/bin/bash

clear

echo -e "Benvingut, aquest programa ha estat creat per Joan Don Bosco\n"

echo -e "Selecciona una de les opcions escrivint el seu número si us plau!!!\n"

select opt in "1.Instal·lar MySQL" "2.Instal·lar Apache2" "3.Instal·lar Phpmyadmin" "4.Instal·lar Vsftp" "5.Crear un Usuari SQL" "6.Connectar a MySQL" "7.Llistar usuaris de MySQL" "8.Sortir"

do
  case $opt in 
    "1.Instal·lar MySQL")
        
      Ruta=/etc/mysql
	
	    if [ -d $Ruta ]
	    then
		    clear
	    	    echo "MySQL ja està instal·lat al sistema"
		    read -p "Clica [Enter] per torna al Menú"
		    clear
		    ./Mysql-PhpmyadminInstall.sh
	    else 
		    clear
		    echo "No està Instal·lat MySQL"
		    read -p "Clica [Enter] per actualitzar el sistema & instal·lar MySQL !Aquest pas pot tardar una mica¡"
		
		    sudo apt-get update -y
		    sudo apt-get install mysql-server -y
		    clear
		
		    echo "MySQL ja està Instal·lat al sistema"
		    read -p "Clica [Enter] per torna al Menú"
		    clear
		    ./Mysql-PhpmyadminInstall.sh
	    fi
        ;;

    "2.Instal·lar Apache2")
        
      Ruta=/etc/apache2

	    if [ -d $Ruta ]
	    then
		    echo "Apache2 ja está instal·lat al sistema"
		    read -p "Clica [Enter] per torna al Menú"
		    clear
		    ./Mysql-PhpmyadminInstall.sh
	    else
		    clear
		    echo "No está Instal·lat Apache!"
		    read -p "Clica [Enter] per actualitzar el sistema & instal·lar Apache2"

		    sudo apt-get update -y
		    sudo apt-get install apache2 -y
		    clear

		    echo "Apache2 instal·lat!"
		    read -p "Clica [Enter] per torna al Menú"
		    clear
		    ./Mysql-PhpmyadminInstall.sh
	    fi
      ;;

    "3.Instal·lar Phpmyadmin")
     
      Ruta=/usr/share/phpmyadmin

	    if [ -d "$Ruta" ]
	    then
		    echo "Phpmyadmin ja està Instal·lat al sistema"
		    read -p "Clica [Enter] per torna al Menu"
		    clear
		    ./Mysql-PhpmyadminInstall.sh
	    else
		    echo "Phpmyadmin no es Instal·lat al sistema"
		    read -p "Clica [Enter] per actualitzar el sistema & instal·lar Phpmyadmin"

		    sudo apt-get update -y
		    sudo apt-get install php -y 
		    sudo apt-get install phpmyadmin -y

		    clear

		    echo "Phpmyadmin ja està Instal·lat al sistema"
		    read -p "Clica [Enter] per torna al Menú"
		    clear
		    ./Mysql-PhpmyadminInstall.sh
	    fi
      ;;

    "4.Instal·lar Vsftp")
      
      sudo systemctl status vsftpd.service
	    
      if [ $? -eq 4 ]
	    then
		    clear
		    echo "Vsftp no està Instal·lat al sistema"
		    read -p "Clica [Enter] per actualitzar el sistema & instal·lar Vsftp"

		    sudo apt-get update -y
		    sudo apt-get install vsftpd -y
		    clear

		    echo "Vsftp ja està Instal·latal sistema"
		    read -p "Clica [Enter] per torna al Menú"
		    clear
		    ./Mysql-PhpmyadminInstall.sh
	    else
		    clear
		    echo "Vsftp ja està Instal·lat al sistema!!!"
		    read -p "Clica [Enter] per torna al Menú"
		    clear
		    ./Mysql-PhpmyadminInstall.sh
	    fi
      ;;

     "5.Crear un Usuari SQL")
      
      Ruta=/etc/mysql
	
    	if [ -d $Ruta ]
	    then
		    clear
		    echo -e "Escriu el nom de l'usuari si us plau"
		    read nom

		    echo -e "Escriu la contrasenya per l'usuari si us plau"
		    read password

		    echo "Usuari Creat amb el Nom-> '${nom}' i la Contrasenya-> '${password}';"

		    sudo mysql -e "CREATE USER '${nom}'@'%' IDENTIFIED BY '${password}';"
        sudo mysql -e "GRANT ALL PRIVILEGES ON *.* TO '${nom}'@'%' WITH GRANT OPTION;"

		    echo "Usuari creat correctament i privilegis donats!"
		    read -p "Clica [Enter] per torna al Menú"
		    clear
		    ./Mysql-PhpmyadminInstall.sh
	    else	
	
		    clear
		    echo "No està instal·lat MySQL!"
		    read -p "Clica [Enter] per torna al Menú"
		    clear
		    ./Mysql-PhpmyadminInstall.sh
	    fi
      ;;

     "6.Connectar a MySQL")
      
      clear
	    echo -e "Escriu l'usuari amb el qual et vols connectar a la BD: "
	    read user

	    echo -e "Escriu la contrasenya de l'usuari si us plau: "
	    read pass

	    clear

	    sudo mysql -u ${user} -p${pass}
      ;;


      "7.Llistar usuaris de MySQL")
      
        clear
	      sudo mysql -e "SELECT User,Host FROM mysql.user;"
	      read -p "Clica [Enter] per torna al Menu"
	
        clear
	      ./Mysql-PhpmyadminInstall.sh
      ;;
     
     "8.Sortir")
        read -p  "Clica [Enter] per sortir del Script! Gràcies per utilitzar el Script!"
	      clear
	      exit
     ;;
  esac
done
