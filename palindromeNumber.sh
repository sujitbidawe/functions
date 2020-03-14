#! /bin/bash -x

read -p "enter first number: " number1
read -p "enter second number: " number2

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
		echo $reverseNumber1

}

function palindromeCheck() {
		local reverseNumber1=$1
		local number2=$2

if [[ $reverseNumber1 -eq $number2 ]]
then
		echo "$originalNumber1 and $number2 are palindromes"
else
		echo "$originalNumber1 and $number2 not palindromes"
fi

}
reverseNumber1="$( numberRev $number1 )"
palindromeCheck $reverseNumber1 $number2
