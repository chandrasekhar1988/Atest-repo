#!/bin/bash

# Script Name: order_food.sh
# Description: A simple script to understand getopts and OPTARG

usage() {
    echo "Usage: $0 -i <item> -q <quantity> -d <delivery|pickup>"
    exit 1
}

# The "i:q:d:" means the script accepts -i, -q, and -d flags.
# All of them have a colon (:), meaning they all require a value.
while getopts "i:q:d:" opt; do
  case $opt in
    i)
      # OPTARG captures the value given to -i
      food_item="$OPTARG" 
      ;;
    q)
      # OPTARG captures the value given to -q
      qty="$OPTARG" 
      ;;
    d)
      # OPTARG captures the value given to -d
      delivery_type="$OPTARG" 
      ;;
    *)
      usage
      ;;
  esac
done

# Validation: Check if any required data is missing
if [ -z "$food_item" ] || [ -z "$qty" ] || [ -z "$delivery_type" ]; then
    echo "Error: You must provide the item, quantity, and delivery type!"
    usage
fi

echo "========================================="
echo "             Order Received!             "
echo "========================================="
echo "Item          : $food_item"
echo "Quantity      : $qty"
echo "Order Type    : $delivery_type"
echo "-----------------------------------------"
echo "Chef is now preparing your $qty $food_item(s)."
echo "========================================="