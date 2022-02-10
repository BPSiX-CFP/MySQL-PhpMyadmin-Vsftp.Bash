#!/bin/bash

clear

echo -e "Benvinguts al Instal·lable de MySQL + PhpMyAdmin + VsFtp i creació d'un Usuari SQL Grant Privileges!"

echo -e "\n 1. Instal·lar MySQL \n 2. Instal·lar Apache2 \n 3. Instal·lar Phpmyadmin \n 4. Instal·lar VsFtp \n 5. Crear Usuari SQL \n 6. Connectar a Base de Dades \n 7. Llistar usuaris de MySQL \n 8. Sortir"

read a

clear

if [ $a = 1 ]
then
	sudo systemctl status mysql
	clear
	if [ $? -eq 4 ]
	then
		echo "No esta Instal·lat MySQL"
		read -p "Clica [Enter] per actualitzar el sistema & instal·lar MySQL"

		sudo apt-get update -y
		sudo apt-get install mysql-server
		clear

		read -p "Clica [Enter] per torna al Menu"
		clear
		./Mysql-PhpmyadminInstall.sh
	else

		echo "MySQL ja esta instal·lat al sistema"
		read -p  "Clica [Enter] per torna al Menu"
		clear
		./Mysql-PhpmyadminInstall.sh
	fi

elif [ $a = 2 ]
then

	sudo systemctl status apache2
	clear
	if [ $? -eq 4 ]
	then
		echo "No esta Instal·lat Apache!"
		read -p "Clica [Enter] per actualitzar el sistema & instal·lar Apache2"

		sudo apt-get update -y
		sudo apt-get install apache2 -y
		clear

		echo "Apache2 instal·lat!"
		read -p "Clica "
	else
		echo "Apache2 ja esta instal·lat al sistema"
		read -p "Clica [Enter] per torna al Menu"
		clear
		./Mysql-PhpmyadminInstall.sh

	fi

elif [ $a = 3 ]
then

	Ruta=/usr/share/phpmyadmin

	if [ -d "$Ruta" ]
	then
		echo "Phpmyadmin ja esta Instal·lat al sistema"
		read -p "Clica [Enter] per torna al Menu"
		clear
		./Mysql-PhpmyadminInstall.sh
	else

		echo "Phpmyadmin no es Instal·lat al sistema"
		read -p "Clica [Enter] per actualitzar el sistema & instal·lar Phpmyadmin"

		sudo apt-get update -y
		sudo apt-get php -y
		sudo apt-get phpmyadmin -y
		clear

		echo "Phpmmyadmin ja esta Instal·lat al sistema"
		read -p "Clica [Enter] per torna al Menu"
		clear
		./Mysql-PhpmyadminInstall.sh
	fi


elif [ $a = 4 ]
then

	sudo systemctl status vsftp.service
	clear
	if [ $? -eq 4 ]
	then
		echo "Vsftp no es Instal·lat al sistema"
		read -p "Clica [Enter] per actualitzar el sistema & instal·lar Vsftp"

		sudo apt-get update -y
		sudo apt-get vsftp -y
		clear

		echo "Vsftp ja esta Instal·latal sistema"
		read -p "Clica [Enter] per torna al Menu"
		clear
		./Mysql-PhpmyadminInstall.sh
	else

		echo "Vsftp ja esta Instal·lat al sistema!!!"
		read -p "Clica [Enter] per torna al Menu"
		clear
		./Mysql-PhpmyadminInstall.sh
	fi

elif [ $a = 5 ]
then

	sudo systemctl status mysql
	clear
	if [ $? -eq 4 ]
	then
		echo "No esta instal·lat MySQL!"
		read -p "Clica [Enter] per torna al Menu"
		clear
		./Mysql-PhpmyadminInstall.sh

	else
		echo -e "Escriu el nom del usuari sisplau"
		read nom

		echo -e "Escriu la contrasenya per el usuari sisplau"
		read password

		echo "Usuari Creat amb el Nom-> '${nom}' i la Contrasenya-> '${password}';"

		mysql -e "CREATE USER '${nom}'@'%' IDENTIFIED BY '${password}';"

		mysql -e "GRANT ALL PRIVILEGES ON *.* TO '${nom}'@'%' WITH GRANT OPTION;"

		echo "Usuari creat correctament i privilegis donats!"
		read -p "Clica [Enter] per torna al Menu"
		clear
		./Mysql-PhpmyadminInstall.sh
	fi


elif [ $a = 6 ]
then
	clear
	echo -e "Escriu el usuari amb el que et vols connectar a la BD: "
	read user

	echo -e "Escriu la contrasenya del usuari sisplau: "
	read pass

	clear

	mysql -u ${user} -p${pass}


elif [ $a = 7 ]
then
	clear
	mysql -e "SELECT User,Host FROM mysql.user;"
	read -p "Clica [Enter] per torna al Menu"
	clear
	./Mysql-PhpmyadminInstall.sh

elif [ $a = 8 ]
then

	read -p  "Clica [Enter] per sortir del Script! Gracies per utilitzar el Script!"
	clear
	exit


else
	echo "Sisplau escrigui una de les opcions!!!"
	read -p "Clica [Enter] per torna al Menu"
	./Mysql-PhpmyadminInstall.sh
fi
