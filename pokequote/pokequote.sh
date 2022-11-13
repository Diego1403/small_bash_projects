#!/bin/bash


url=https://pokeapi.co/api/v2/pokemon/$(( $RANDOM % 1000 + 1 ))

quote_url=https://motivational-quote-api.herokuapp.com/quotes/random
pokemon=$(curl -s $url |  python3 -c "import sys, json; print(json.load(sys.stdin)['name'])" ) 
quote=$(curl -s $quote_url |  python3 -c "import sys, json; print(json.load(sys.stdin)['quote'])" )

echo "$pokemon says $quote"
