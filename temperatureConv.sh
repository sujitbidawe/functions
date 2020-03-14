#! /bin/bash

clear

celsToFahr=1
fahrToCels=2

freezeInCels=0
freezeInFahr=32
boilInCels=100
boilInFahr=212


echo "````````temperature converter````````"
echo "for °celsius to °fahrenheit: enter 1"
echo "for °fahrenheit to °celsius: enter 2"
read choice

function celsToFahrFn() {

      cels=$1
		div=`echo "scale=4; 9/5 " | bc`
      fahr=`echo "scale=4; $cels * $div +32"  | bc`
      echo $fahr
}

function fahrToCelsFn() {

      fahr=$1
		div=`echo "scale=4;  5/9 " | bc`
      cels=`echo "scale=4; ( $fahr-32 ) * $div" | bc`
      echo $cels
}



case $choice in
		$celsToFahr)
				read -p "enter temperature in °celsius: " cels
				if [[ $cels -ge $freezeInCels && $cels -le $boilInCels ]]
				then
						fahr="$( celsToFahrFn $cels )"
						echo "$ $cels°C is equal to $fahr°F "
				else
						echo "enter temperature between 0°C and 100°C "
				fi
				;;


		$fahrToCels)
				read -p "enter temperature in °fahrenheit: " fahr
				if [[ $fahr -ge $freezeInFahr && $fahr -le $boilInFahr ]]
				then
						cels="$( fahrToCelsFn $fahr )"
						echo "$fahr°F is equal to $cels°C "
				else
						echo "enter temperature between 32°F and 212°F "
				fi
				;;

		*)
				echo "invalid input"
esac

