#!/bin/bash
PSQL="psql --username=freecodecamp --dbname=periodic_table -t --no-align -c"

# check for input
if [[ $# -gt 0 ]] 
then
  # if integer
  if [[ $1 =~ ^[0-9]+$ ]]
  then
    ATOMIC_NUMBER=$($PSQL "SELECT atomic_number FROM elements WHERE atomic_number=$1;")
    if [[ -z $ATOMIC_NUMBER ]]
      then
        echo I could not find that element in the database.
        exit
    fi
  # if string
  else
    ATOMIC_NUMBER=$($PSQL "SELECT atomic_number FROM elements WHERE symbol='$1';")
    if [[ -z $ATOMIC_NUMBER ]]
    then
      ATOMIC_NUMBER=$($PSQL "SELECT atomic_number FROM elements WHERE name='$1';")
      if [[ -z $ATOMIC_NUMBER ]]
      then
        echo I could not find that element in the database.
        exit
      fi
    fi
  fi
# no input
else
  echo Please provide an element as an argument.
  exit
fi

# using atomic number echo the details
DETAILS=$($PSQL "SELECT * FROM elements INNER JOIN properties USING(atomic_number) INNER JOIN types USING(type_id) WHERE atomic_number=$ATOMIC_NUMBER";)
echo $DETAILS | while IFS='|' read TYPE_ID ATOMIC_NUMBER SYMBOL NAME ATOMIC_MASS MELTING_POINT BOILING_POINT TYPE
do
  echo "The element with atomic number $ATOMIC_NUMBER is $NAME ($SYMBOL). It's a $TYPE, with a mass of $ATOMIC_MASS amu. $NAME has a melting point of $MELTING_POINT celsius and a boiling point of $BOILING_POINT celsius."
done
