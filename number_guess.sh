#!/bin/bash
PSQL="psql --username=freecodecamp --dbname=guessing_game -t --no-align -c"

echo "Enter your username:"
read USERNAME

PLAYER_ID=$($PSQL "SELECT player_id FROM players WHERE username='$USERNAME';")

# new player
if [[ -z $PLAYER_ID ]]
then
  echo "Welcome, $USERNAME! It looks like this is your first time here."
  INSERT_USERNAME=$($PSQL "INSERT INTO players(username) VALUES('$USERNAME');")
  PLAYER_ID=$($PSQL "SELECT player_id FROM players WHERE username='$USERNAME'";)
else # player already in database
  GAMES_PLAYED=$($PSQL "SELECT games_played FROM players WHERE player_id=$PLAYER_ID;")
  BEST_GAME=$($PSQL "SELECT best_game FROM players WHERE player_id=$PLAYER_ID;")
  echo "Welcome back, $USERNAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses."
fi

# Generate random number from 1 to 1000.
RANDOM_NUMBER=$(( $RANDOM%1000+1 ))
COUNTER=0
echo "Guess the secret number between 1 and 1000:"
GUESS=1001 # initialise with a wrong guess first

while (( $GUESS != $RANDOM_NUMBER ))
do
  read GUESS
  COUNTER=$(( $COUNTER+1 ))
  if [[ $GUESS =~ ^[0-9]+$ ]]
  then
    # guess is too high
    if (( $GUESS > $RANDOM_NUMBER ))
    then
      echo "It's lower than that, guess again:"
    fi
    # guess is too low
    if (( $GUESS < $RANDOM_NUMBER ))
    then
      echo "It's higher than that, guess again:"
    fi
  else
    echo "That is not an integer, guess again:"
    GUESS=1001 # reinitialise to another int for while condition
  fi
done
echo "You guessed it in $COUNTER tries. The secret number was $RANDOM_NUMBER. Nice job!"

GAMES_PLAYED=$($PSQL "SELECT games_played FROM players WHERE player_id=$PLAYER_ID;")
GAMES_PLAYED=$(( $GAMES_PLAYED+1 ))
BEST_GAME=$($PSQL "SELECT best_game FROM players WHERE player_id=$PLAYER_ID;")

# if no previous best
if [[ -z $BEST_GAME ]]
then
  BEST_GAME=$COUNTER
else # if there is a previous best
  if (( $COUNTER < $BEST_GAME ))
  then
    BEST_GAME=$COUNTER
  fi
fi
INSERT_SCORE=$($PSQL "UPDATE players SET games_played=$GAMES_PLAYED, best_game=$BEST_GAME WHERE player_id=$PLAYER_ID;")