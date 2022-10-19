#!/bin/bash

source kp.conf
source $MODULES_PATH/misc_module.sh

function cmd_wifite(){
	local cmd="" ANS=""
	clear
	figlet wifite
    cmd="wifite "
    printf "┌─(${PURPLE}$TITLE${NC})${RED}${USERNAME}@${HOSTNAME}${NC}:${RED}[1]Kali-tools-top10${NC} > ${RED}[1]$cmd${NC}\n"
    echo "|"
    printf "|${RED}  ########  Caution!  ########${NC}\n"
    echo "|"
    printf "+${BLUE}usage${NC}: wifite (${RED}Run as Root${NC})\n"
	if [ ! ${EUID:-${UID}} = 0 ];then
		echo "└─Command > Back"
	else
		printf "|  wifite ${WHITE}[option|SETTINGS]${NC}\n"
		printf "+${BLUE}options${NC}:\n"
		printf "|  ${YELLOW}-h, --help${NC}              show this help message and exit"
		echo "|"
		printf "+${BLUE}SETTINGS${NC}:\n"
		printf "|  ${YELLOW}-v, --verbose${NC}           Shows more options (-h -v). Prints commands and outputs.\n"
		printf "|                           (default:quiet)\n"
		printf "|  ${YELLOW}-i [interface]${NC}          Wireless interface to use, e.g. wlan0mon (default: ask)\n"
		printf "|  ${YELLOW}-c [channel]${NC}            Wireless channel to scan e.g. 1,3-6 (default: all 2Ghz channels)\n"
		printf "|  ${YELLOW}-ab, --allbands${NC}         Include both 2.4Ghz and 5Ghz bands (default: off)\n"
		printf "|  ${YELLOW}-2, --2ghz${NC}              Include 2.4Ghz channels (default: off)\n"
		printf "|  ${YELLOW}-5, --5ghz${NC}              Include 5Ghz channels (default: off)\n"
		printf "|  ${YELLOW}-inf, --infinite${NC}        Enable infinite attack mode. Modify scanning time with -p (default:off)\n"
		printf "|  ${YELLOW}-mac, --random-mac${NC}      Randomize wireless card MAC address (default: off)\n"
		printf "|  ${YELLOW}-p [scan_time]${NC}          Pillage: Attack all targets after scan_time (seconds)\n"
		echo "└─Command > $cmd"
		echo ""
		echo "> You ready?"
		num1 0 "No"
		num2 0 "Yes"
		read -n 1 -s ANS
		echo ""
		if [ ! -z "$ANS" ];then
			if [ $ANS = "2" ];then
				eval $cmd
			else
				:
			fi
		else
			:
		fi
	fi
}