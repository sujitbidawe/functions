#! /bin/bash 

read -p "enter first number: " number1

originalNumber1=$number1
reverseNumber1=0

function numberRev() {

		local number1=$1
		while [[ $number1 -ne 0 ]]
		do
				remainder=$(( number1%10 ))
				reverseNumber1=$(( reverseNumber1*10 + remainder))
				number1=$(( number1/10 ))
		done
		echo "$reverseNumber1"
		echo "reverse of $originalNumber1 is $reverseNumber1" >&2

}


function primeCheck(){
		number=$1
		divisibleByNumbers=0

		for (( int=2; int<=$(( $number/2 )); int++ ))
		do

			if [[ $number%$int -eq 0 ]]
			then
			divisibleByNumbers=$(( $divisibleByNumbers+1 ));
			fi

		done

		if [[ $divisibleByNumbers -eq 0 ]]
		then
				echo $number is a prime number
				else
				echo $number is not a prime number
		fi

}

primeCheck $number1
reverseNumber1="$( numberRev $number1 )"
primeCheck $reverseNumber1

