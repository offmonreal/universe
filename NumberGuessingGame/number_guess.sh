#!/bin/bash

PSQL="psql -X --username=freecodecamp --dbname=number_guess --tuples-only -c"

RAND_NUMBER=$(( $RANDOM % 1000 +1 ))

echo -e "Enter your username:"

read USER_NAME

FOUND_USER=$($PSQL "SELECT name, games_played, best_game FROM users WHERE name = '$USER_NAME'")

if [[ -z $FOUND_USER ]]
then
  # New user
  echo "Welcome, $USER_NAME! It looks like this is your first time here."
  # Insert new user into database
  $($PSQL "INSERT INTO users (name) VALUES ('$USER_NAME')")
GAMES_PLAYED=0
BEST_GAME=0
else
  # Existing user
IFS='|' read -ra COLUMN <<< "$FOUND_USER"
 # Use sed to trim leading and trailing spaces
NAME=$(echo "${COLUMN[0]}" | sed 's/^ *//;s/ *$//')
GAMES_PLAYED=$(echo "${COLUMN[1]}" | sed 's/^ *//;s/ *$//')
BEST_GAME=$(echo "${COLUMN[2]}" | sed 's/^ *//;s/ *$//')
echo "Welcome back, $NAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses."
fi

# Start GAME
echo -e "\nGuess the secret number between 1 and 1000:"

# Initialize the number of guesses
NUMBER_OF_GUESSES=0

while true
do
  read GUESS

  # Validate the input is an integer
  if ! [[ $GUESS =~ ^[0-9]+$ ]]
   then
    echo "That is not an integer, guess again:"
    continue
  fi

  # Increment guess count
  NUMBER_OF_GUESSES=$((NUMBER_OF_GUESSES + 1))

  # Determine if the guess is higher, lower, or correct
  if [[ $GUESS -gt $RAND_NUMBER ]]
  then
    echo "It's lower than that, guess again:"
  elif [[ $GUESS -lt $RAND_NUMBER ]]; then
    echo "It's higher than that, guess again:"
  else
    echo "You guessed it in $NUMBER_OF_GUESSES tries. The secret number was $RAND_NUMBER. Nice job!"

     # Update the database with the new game results
    if [[ $NUMBER_OF_GUESSES -lt $BEST_GAME || $BEST_GAME -eq 0 ]] 
      then
        UPDATE_BEST_GAME=$($PSQL "UPDATE users SET best_game = $NUMBER_OF_GUESSES WHERE name = '$USER_NAME'")
        BEST_GAME=$NUMBER_OF_GUESSES
      fi
    UPDATE_GAMES_PLAYED=$($PSQL "UPDATE users SET games_played = games_played + 1 WHERE name = '$USER_NAME'")

    break
  fi
done
