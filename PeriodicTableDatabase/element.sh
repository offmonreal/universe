#!/bin/bash

# Setup PostgreSQL command line
PSQL="psql -X --username=freecodecamp --dbname=periodic_table --tuples-only -c"

# Check if an argument was provided
if [[ $1 ]]
then
  # Check if the argument is a number (atomic number)
  if [[ $1 =~ ^[0-9]+$ ]]
  then
    ELEMENT=$($PSQL "SELECT atomic_number, name, symbol, element_type, atomic_mass, melting_point_celsius, boiling_point_celsius FROM properties INNER JOIN elements USING(atomic_number) WHERE atomic_number = $1")
  # Check if the argument is a symbol
  elif [[ $1 =~ ^[A-Z][a-z]?$ ]]
  then
    ELEMENT=$($PSQL "SELECT atomic_number, name, symbol, element_type, atomic_mass, melting_point_celsius, boiling_point_celsius FROM properties INNER JOIN elements USING(atomic_number) WHERE symbol = '$1'")
  # Assume the argument is a name
  else
    ELEMENT=$($PSQL "SELECT atomic_number, name, symbol, element_type, atomic_mass, melting_point_celsius, boiling_point_celsius FROM properties INNER JOIN elements USING(atomic_number) WHERE name = '$1'")
  fi

  # Check if element was found
  if [[ -z $ELEMENT ]]
  then
    echo "I could not find that element in the database."
  else
    # Format and display the element information
    echo $ELEMENT | while read ATOMIC_NUMBER BAR NAME BAR SYMBOL BAR ELEMENT_TYPE BAR MASS BAR MELTING_POINT BAR BOILING_POINT
    do
      echo "The element with atomic number $ATOMIC_NUMBER is $NAME ($SYMBOL). It's a $ELEMENT_TYPE, with a mass of $MASS amu. $NAME has a melting point of $MELTING_POINT celsius and a boiling point of $BOILING_POINT celsius."
    done
  fi
else
  # Prompt user to provide an element argument
  echo "Please provide an element as an argument."
fi
