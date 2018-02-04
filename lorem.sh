#!/bin/bash

set -o errexit	# set -e
set -o nounset	# set -u

function show_text()
{
	echo 'torquenteullamcorperesenectusetinciduntenequeeveteurnaesodaleseacecras'
	echo 'veteligulatecongueenunctenullameaeneanefaucibusecondimentumediseodioee'
	echo 'sagittistepraesenteconubiaepotentiefacilisiseveemaurisefamesedoneceneq'
	echo 'turpisesuspendisseejustoetortortecuraetenequeevenenatiseportaeaeviverr'
	echo 'aptentecurabitureloremevenenatisesedtemolestieerhoncustepuruseturpisee'
	echo 'viverraenonteporttitorequistevulputateequisesodalesegravidaefermentume'
	echo 'plateateatepraesentteprimiseproinemagnaealiquetemassaeparturienttearcu'
	echo 'vestibulumeenimerutrumedictumeadtepedeecurabiturebibendumteeuenislepra'
	echo 'massaeintesedteligulaeportaenullamteadipiscingeturpistequamejustoemale'
	echo 'posuereemusehabitasseeestteveehacecraseetecursusevolutpattenascetureer'
	echo 'lectuseveeateantetediamemieestecuraetedignissimediamteerosesemperevulp'
}

function save_cursor()
{
	echo -en "\e[s"
}

function move_cursor()
{
	local ROW="$1"
	local COL="$2"
	echo -en "\e[${ROW};${COL}H"
}

function restore_cursor()
{
	echo -en "\e[u"
}

function start_link()
{
	local ID="$1"
	local URL="$2"
	local TEXT="${3:-}"
	echo -en "\e]8;id=${ID};${URL}\a${TEXT}"
}

function end_link()
{
	echo -en '\e]8;;\a'
}


function test_empty_link()
{
	save_cursor

	move_cursor 4 15
	start_link 42 https://google.com

	move_cursor 4 20
	end_link

	restore_cursor
}

function test_text_link()
{
	save_cursor

	move_cursor 4 15
	start_link 42 https://google.com XXXYYYZZZ

	restore_cursor
}

function test_text_broken_link()
{
	save_cursor

	move_cursor 4 62
	start_link 42 https://google.com XXXYYYZZZ
	move_cursor 5 1
	start_link 42 https://google.com XXXYYYZZZ

	move_cursor 7 62
	start_link 99 https://google.com AAABBBCCC
	move_cursor 8 1
	start_link 99 https://google.com AAABBBCCC

	restore_cursor
}

function test_text_sep_link()
{
	save_cursor

	move_cursor 4 15
	start_link 42 https://google.com
	echo -n "XXXYYYZZZ"

	restore_cursor
}


function test_empty_colour()
{
	save_cursor

	move_cursor 4 15
	echo -en "\e[1;31m"

	move_cursor 4 20
	echo -en "\e[0m"

	restore_cursor
}

function test_text_colour()
{
	save_cursor

	move_cursor 4 15
	echo -en "\e[1;31mXXXYYYZZZ"

	restore_cursor
}

function test_text_sep_colour()
{
	save_cursor

	move_cursor 4 15
	echo -en "\e[1;31m"
	echo -n "XXXYYYZZZ"

	restore_cursor
}


function test_overlap()
{
	save_cursor

	move_cursor 4 15
	start_link 42 https://google.com
	echo -n "XXX"
	echo -en "\e[1;31m"
	echo -n "YYY"
	end_link
	echo -n "ZZZ"
	echo -en "\e[0m"

	restore_cursor
}


# Switch to alternate screen
tput smcup

for i in test_empty_link test_text_link test_text_broken_link test_text_sep_link test_empty_colour test_text_colour test_text_sep_colour test_overlap; do
	clear
	echo $i
	echo
	show_text
	echo
	$i
	read -p Waiting...
done

# Return to normal screen
tput rmcup

