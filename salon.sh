#!/bin/bash
PSQL='psql --username=freecodecamp --dbname=salon -t -c'
AVAILABLE_SERVICES=$($PSQL "SELECT service_id, name FROM services;")

echo -e "\n~~~~~ MY SALON ~~~~~\n\nWelcome to My Salon, how can I help you?\n"

START() {
  echo "$AVAILABLE_SERVICES" | while read SERVICE_ID BAR NAME
  do
    echo "$SERVICE_ID) $NAME"
  done
  read SERVICE_ID_SELECTED

  # check if id is an int
  if [[ ! $SERVICE_ID_SELECTED =~ ^[0-9]+$ ]]
  then
    echo -e "\nI could not find that service. What would you like today?\n"
    START 
  else # if id is an int check if in services
    SERVICE=$($PSQL "SELECT name FROM services WHERE service_id=$SERVICE_ID_SELECTED;")
    if [[ -z $SERVICE ]]
    then # not a valid service id
      echo -e "\nI could not find that service. What would you like today?\n"
      START
    else
      echo -e "\nWhat's your phone number?"
      read CUSTOMER_PHONE
      # get customer id
      CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone='$CUSTOMER_PHONE';")
      # if not customer get his name
      if [[ -z $CUSTOMER_ID ]]
      then
        echo -e "\nI don't have a record for that phone number, what's your name?"
        read CUSTOMER_NAME
        INSERT_CUSTOMER=$($PSQL "INSERT INTO customers(name, phone) VALUES('$CUSTOMER_NAME', '$CUSTOMER_PHONE');")
        # get customer id again
        CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone='$CUSTOMER_PHONE';")
      fi
      # get customer name again
      CUSTOMER_NAME=$($PSQL "SELECT name FROM customers WHERE customer_id=$CUSTOMER_ID")
      FORMATTED_TEXT=$(echo "\nWhat time do you want your $SERVICE, $CUSTOMER_NAME?" | sed 's/ +/ /g')
      echo -e $FORMATTED_TEXT
      read SERVICE_TIME
      INSERT_TIME=$($PSQL "INSERT INTO appointments(customer_id, service_id, time) VALUES($CUSTOMER_ID, $SERVICE_ID_SELECTED, '$SERVICE_TIME');")
      FORMATTED_TEXT=$(echo "\nI have put you down for a $SERVICE at $SERVICE_TIME, $CUSTOMER_NAME." | sed 's/ +/ /g')
      echo -e $FORMATTED_TEXT
    fi
  fi
}

START