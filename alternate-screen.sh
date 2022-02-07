#!/bin/bash

URL="http://example.com/?q=retinued+pinocle+analabos+turnhall+spald+dozener+lustred+bangtail+ghawazi+granddad+phasma+santir+deplanes+caduke+wimples+occur+rankish+models+pandle+scaldino+rickets+maddened+majolica+irisated+massif+reweighs+embers+phloems+femmes+babblers+propine+priscan+bisters+royale+clouding+huguenot+slampant+rulable+tropaia+harder+retied+ponica+tabbies+moodier+ciniphes+gustier+overwhip+murre+cesare+saggier"

echo -e "\e[1;31mNormal screen\e[0m"
echo "$URL"
sleep 3
echo -en "\e[?1049h"
echo -e "\e[1;4;32mAlternate screen\e[0m"
echo "$URL"
sleep 3
echo -en "\e[?1049l"
echo -e "\e[1;34mNormal screen again\e[0m"
echo "$URL"

