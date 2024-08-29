#!/bin/bash

PSQL="psql -X --username=freecodecamp --dbname=salon --tuples-only -c"


echo -e "\n~~~~~ TATTOO SALON ~~~~~\n"
echo -e "\nWelcome to My Salon, how can I help you?\n"


MAIN_MENU()
{
  if [[ $1 ]]
  then
    echo -e "\n$1"
  fi

AVAILABLE_SERVICES=$($PSQL "SELECT service_id, name FROM services ORDER BY service_id")
echo "$AVAILABLE_SERVICES" | while read SERVICE_ID BAR SERVICE_NAME
    do
      echo "$SERVICE_ID) $SERVICE_NAME"
    done

SELECT_MENU

}

SELECT_MENU()
{

read SERVICE_ID_SELECTED

# if input is not a number
if [[ ! $SERVICE_ID_SELECTED =~ ^[0-9]+$ ]]
  then
  # send to main menu
  MAIN_MENU "That is not a valid service number."
  else
  # get service availability
  FIND_SERVICE=$($PSQL "SELECT service_id FROM services WHERE service_id = $SERVICE_ID_SELECTED")

  # if not available
  if [[ -z $FIND_SERVICE ]]
    then
    # send to main menu
    MAIN_MENU "I could not find that service. What would you like today?"
    else
    SERVICE_NAME=$($PSQL "SELECT name FROM services WHERE service_id = $SERVICE_ID_SELECTED")
    SERVICE_NAME=$(echo $SERVICE_NAME | xargs) #remove tabs.. space..
    # get customer info
    echo -e "\nWhat's your phone number?"
    read CUSTOMER_PHONE
    CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone = '$CUSTOMER_PHONE'")

    # not found customer
    if [[ -z $CUSTOMER_ID ]]
      then
      echo -e "\nI don't have a record for that phone number, what's your name?"
      read CUSTOMER_NAME
      INSERT_CUSTOMER_RESULT=$($PSQL "INSERT INTO customers(phone, name) VALUES('$CUSTOMER_PHONE', '$CUSTOMER_NAME')")
      CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone = '$CUSTOMER_PHONE'")
      CUSTOMER_ID=$(echo $CUSTOMER_ID | xargs) #remove tabs.. space..
    else
      CUSTOMER_NAME=$($PSQL "SELECT name FROM customers WHERE phone = '$CUSTOMER_PHONE'")
      CUSTOMER_NAME=$(echo $CUSTOMER_NAME | xargs) #remove tabs.. space..
    fi
    echo -e "\nWhat time would you like your $SERVICE_NAME, $CUSTOMER_NAME?"
    read SERVICE_TIME
    INSERT_APPOINTMENT_RESULT=$($PSQL "INSERT INTO appointments(customer_id, service_id, time) VALUES($CUSTOMER_ID, $SERVICE_ID_SELECTED, '$SERVICE_TIME')")
    if [[ $? -ne 0 ]]
    then
    MAIN_MENU "Error adding service entry."
    else
 
    echo -e "\nI have put you down for a $SERVICE_NAME at $SERVICE_TIME, $CUSTOMER_NAME.\n"
    fi
    
  fi
fi
}

MAIN_MENU
