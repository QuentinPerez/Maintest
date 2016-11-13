# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    diff_me.sh                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: stherman <stherman@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2013/11/27 09:02:59 by stherman          #+#    #+#              #
#    Updated: 2016/11/13 03:44:22 by tplessis         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

#!/bin/sh

INTERACTIVE_MODE=1
while [ ! -z "${1}" ]; do
	if [[ "${1}" =~ ^-- ]]
	then
		if [ "${1}" == "--non-interactive" ]
		then
			INTERACTIVE_MODE=0
		else
			printf "\033[31m${1}: Invalid option\n\033[0m"
			exit
		fi
	else
		FT_LS_PATH="${1}"
	fi
	shift 1
done
if [ -z "${FT_LS_PATH}" ]; then FT_LS_PATH="./ft_ls"; fi

clear

if [ ! -e "${FT_LS_PATH}" ]; then
	printf "\033[31m${FT_LS_PATH}: No such file\n\033[0m"
	exit
fi

printf "\033[44m\033[1;37m"

printf "# **************************************************************************** #\n"
printf "#                                                                              #\n"
printf "#                                                         :::      ::::::::    #\n"
printf "#                                                       :+:      :+:    :+:    #\n"
printf "#                                                     +:+ +:+         +:+      #\n"
printf "#          ~ TESTS WITH ONE ARGUMENT ~              +#+  +:+       +#+         #\n"
printf "#                                                 +#+#+#+#+#+   +#+            #\n"
printf "#                                                      #+#    #+#              #\n"
printf "#                                                     ###   ########.fr        #\n"
printf "#                                                                              #\n"
printf "# **************************************************************************** #\n\n\n"

printf "\033[0m"

SUCCESS= /bin/ls -1 -l t_dir > our && "${FT_LS_PATH}" -l t_dir > your
if !(diff --brief your our) || !($SUCCESS) then
	printf "\r\n\033[31mError:\t\t\033[0m\033[37;1m ls -l\033[0m\n\n"
	diff your our
else
	printf "\n\033[32mSuccess:\t\033[37;1m ls -l\033[0m\n\n"
fi

SUCCESS= /bin/ls -1 -a t_dir > our && "${FT_LS_PATH}" -a t_dir > your
if !(diff --brief your our) || !($SUCCESS) then
	printf "\r\n\033[31mError:\t\t\033[0m\033[37;1m ls -a\033[0m\n\n"
	diff your our
else
	printf "\n\033[32mSuccess:\t\033[37;1m ls -a\033[0m\n\n"
fi

SUCCESS= /bin/ls -1 -r t_dir > our && "${FT_LS_PATH}" -r t_dir > your
if !(diff --brief your our) || !($SUCCESS) then
	printf "\r\n\033[31mError:\t\t\033[0m\033[37;1m ls -r\033[0m\n\n"
	diff your our
else
	printf "\n\033[32mSuccess:\t\033[37;1m ls -r\033[0m\n\n"
fi

SUCCESS= /bin/ls -1 -R t_dir > our && "${FT_LS_PATH}" -R t_dir > your
if !(diff --brief your our) || !($SUCCESS) then
	printf "\r\n\033[31mError:\t\t\033[0m\033[37;1m ls -R\033[0m\n\n"
	diff your our
else
	printf "\n\033[32mSuccess:\t\033[37;1m ls -R\033[0m\n\n"
fi

SUCCESS= /bin/ls -1 -t t_dir > our && "${FT_LS_PATH}" -t t_dir > your
if !(diff --brief your our) || !($SUCCESS) then
	printf "\r\n\033[31mError:\t\t\033[0m\033[37;1m ls -t\033[0m\n\n"
	diff your our
else
	printf "\n\033[32mSuccess:\t\033[37;1m ls -t\033[0m\n\n"
fi

[ "${INTERACTIVE_MODE}" -eq "1" ] && printf "\n\n\033[1;37mPlease press a key to continue :D: \033[0m" && read

# -------------------------------------------------------------------------------------------------------------- #
# -------------------------------------------------------------------------------------------------------------- #
# TEST_2        ------------------------------------------------------------------------------------------------ #
# -------------------------------------------------------------------------------------------------------------- #
# -------------------------------------------------------------------------------------------------------------- #

[ "${INTERACTIVE_MODE}" -eq "1" ] && clear

printf "\033[44m\033[1;37m"

printf "# **************************************************************************** #\n"
printf "#                                                                              #\n"
printf "#                                                         :::      ::::::::    #\n"
printf "#                                                       :+:      :+:    :+:    #\n"
printf "#                                                     +:+ +:+         +:+      #\n"
printf "#      ~ TESTS WITH TWO OR MORE ARGUMENT ~          +#+  +:+       +#+         #\n"
printf "#                                                 +#+#+#+#+#+   +#+            #\n"
printf "#                                                      #+#    #+#              #\n"
printf "#                                                     ###   ########.fr        #\n"
printf "#                                                                              #\n"
printf "# **************************************************************************** #\n\n\n"

printf "\033[0m"

SUCCESS= /bin/ls -1 -l -a t_dir > our && "${FT_LS_PATH}" -l -a t_dir > your
if !(diff --brief your our) || !($SUCCESS) then
    printf "\r\n\033[31mError:\t\t\033[0m\033[37;1m ls -l -a\033[0m\n\n"
    diff your our
else
    printf "\n\033[32mSuccess:\t\033[37;1m ls -l -a\033[0m\n\n"
fi

SUCCESS= /bin/ls -1 -l -a -r t_dir > our && "${FT_LS_PATH}" -l -a -r t_dir > your
if !(diff --brief your our) || !($SUCCESS) then
    printf "\r\n\033[31mError:\t\t\033[0m\033[37;1m ls -l -a -r\033[0m\n\n"
    diff your our
else
    printf "\n\033[32mSuccess:\t\033[37;1m ls -l -a -r\033[0m\n\n"
fi

SUCCESS= /bin/ls -1 -l -a -r -R t_dir > our && "${FT_LS_PATH}" -l -a -r -R t_dir > your
if !(diff --brief your our) || !($SUCCESS) then
    printf "\r\n\033[31mError:\t\t\033[0m\033[37;1m ls -l -a -r -R\033[0m\n\n"
    diff your our
else
    printf "\n\033[32mSuccess:\t\033[37;1m ls -l -a -r -R\033[0m\n\n"
fi

SUCCESS= /bin/ls -1 -l -a -r -R -t t_dir > our && "${FT_LS_PATH}" -l -a -r -R -t t_dir > your
if !(diff --brief your our) || !($SUCCESS) then
    printf "\r\n\033[31mError:\t\t\033[0m\033[37;1m ls -l -a -r -R -t\033[0m\n\n"
    diff your our
else
    printf "\n\033[32mSuccess:\t\033[37;1m ls -l -a -r -R -t\033[0m\n\n"
fi

[ "${INTERACTIVE_MODE}" -eq "1" ] && printf "\n\n\033[1;37mPlease press a key to continue :D: \033[0m" && read

# -------------------------------------------------------------------------------------------------------------- #
# -------------------------------------------------------------------------------------------------------------- #
# TEST_3        ------------------------------------------------------------------------------------------------ #
# -------------------------------------------------------------------------------------------------------------- #
# -------------------------------------------------------------------------------------------------------------- #

[ "${INTERACTIVE_MODE}" -eq "1" ] && clear

printf "\033[44m\033[1;37m"

printf "# **************************************************************************** #\n"
printf "#                                                                              #\n"
printf "#                                                         :::      ::::::::    #\n"
printf "#                                                       :+:      :+:    :+:    #\n"
printf "#                                                     +:+ +:+         +:+      #\n"
printf "#        ~ TEST WITH JOINED ARGUMENTS ~             +#+  +:+       +#+         #\n"
printf "#                                                 +#+#+#+#+#+   +#+            #\n"
printf "#                                                      #+#    #+#              #\n"
printf "#                                                     ###   ########.fr        #\n"
printf "#                                                                              #\n"
printf "# **************************************************************************** #\n\n\n"

printf "\033[0m"

SUCCESS= /bin/ls -1 -la t_dir > our && "${FT_LS_PATH}" -la t_dir > your
if !(diff --brief your our) || !($SUCCESS) then
    printf "\r\n\033[31mError:\t\t\033[0m\033[37;1m ls -la\033[0m\n\n"
    diff your our
else
    printf "\n\033[32mSuccess:\t\033[37;1m ls -la\033[0m\n\n"
fi

SUCCESS= /bin/ls -1 -rla t_dir > our && "${FT_LS_PATH}" -rla t_dir > your
if !(diff --brief your our) || !($SUCCESS) then
    printf "\r\n\033[31mError:\t\t\033[0m\033[37;1m ls -rla\033[0m\n\n"
    diff your our
else
    printf "\n\033[32mSuccess:\t\033[37;1m ls -rla\033[0m\n\n"
fi

SUCCESS= /bin/ls -1 -rlRa t_dir > our && "${FT_LS_PATH}" -rlRa t_dir > your
if !(diff --brief your our) || !($SUCCESS) then
    printf "\r\n\033[31mError:\t\t\033[0m\033[37;1m ls -rlRa\033[0m\n\n"
    diff your our
else
    printf "\n\033[32mSuccess:\t\033[37;1m ls -rlRa\033[0m\n\n"
fi

SUCCESS= /bin/ls -1 -trlRa t_dir > our && "${FT_LS_PATH}" -trlRa t_dir > your
if !(diff --brief your our) || !($SUCCESS) then
    printf "\r\n\033[31mError:\t\t\033[0m\033[37;1m ls -trlRa\033[0m\n\n"
    diff your our
else
    printf "\n\033[32mSuccess:\t\033[37;1m ls -trlRa\033[0m\n\n"
fi

[ "${INTERACTIVE_MODE}" -eq "1" ] && printf "\n\n\033[1;37mPlease press a key to continue :D: \033[0m" && read

# -------------------------------------------------------------------------------------------------------------- #
# -------------------------------------------------------------------------------------------------------------- #
# TEST_4        ------------------------------------------------------------------------------------------------ #
# -------------------------------------------------------------------------------------------------------------- #
# -------------------------------------------------------------------------------------------------------------- #

[ "${INTERACTIVE_MODE}" -eq "1" ] && clear

printf "\033[44m\033[1;37m"

printf "# **************************************************************************** #\n"
printf "#                                                                              #\n"
printf "#                                                         :::      ::::::::    #\n"
printf "#                                                       :+:      :+:    :+:    #\n"
printf "#                                                     +:+ +:+         +:+      #\n"
printf "#          ~ TESTS THAT FAILS IN /bin/ls -1 ~       +#+  +:+       +#+         #\n"
printf "#                                                 +#+#+#+#+#+   +#+            #\n"
printf "#                                                      #+#    #+#              #\n"
printf "#                                                     ###   ########.fr        #\n"
printf "#                                                                              #\n"
printf "# **************************************************************************** #\n\n\n"

printf "\033[0m"

/bin/ls -. t_dir > our 2> our2
OUR_RET=($?)
"${FT_LS_PATH}" -. t_dir > your 2> your2
YOUR_RET=($?)
if [ $OUR_RET -ne $YOUR_RET ]; then
    printf "\r\n\033[31mError:\t\t\033[0m\033[37;1m ls -.\033[0m\n\n"
	printf "/bin/ls return: %d | ft_ls return: %d\n\n" $OUR_RET $YOUR_RET
elif [ $OUR_RET -ne 0 ] && [ $(wc -l < our2) -ne 0 ] && [ $(wc -l < your2) -eq 0 ]; then
	printf "\r\n\033[31mError:\t\t\033[0m\033[37;1m ls -.\033[0m\n\n"
	diff your2 our2
elif !(diff --brief your our) then
	printf "\r\n\033[31mError:\t\t\033[0m\033[37;1m ls -.\033[0m\n\n"
    diff your our
else
    printf "\n\033[32mSuccess:\t\033[37;1m ls -.\033[0m\n\n"
fi

/bin/ls -1 -l. t_dir > our 2> our2
OUR_RET=($?)
"${FT_LS_PATH}" -l. t_dir > your 2> your2
YOUR_RET=($?)
if [ $OUR_RET -ne $YOUR_RET ]; then
    printf "\r\n\033[31mError:\t\t\033[0m\033[37;1m ls -l.\033[0m\n\n"
	printf "/bin/ls return: %d | ft_ls return: %d\n\n" $OUR_RET $YOUR_RET
elif [ $OUR_RET -ne 0 ] && [ $(wc -l < our2) -ne 0 ] && [ $(wc -l < your2) -eq 0 ]; then
	printf "\r\n\033[31mError:\t\t\033[0m\033[37;1m ls -l.\033[0m\n\n"
	diff your2 our2
elif !(diff --brief your our) then
	printf "\r\n\033[31mError:\t\t\033[0m\033[37;1m ls -l.\033[0m\n\n"
    diff your our
else
    printf "\n\033[32mSuccess:\t\033[37;1m ls -l.\033[0m\n\n"
fi

/bin/ls -1 -.r t_dir > our 2> our2
OUR_RET=($?)
"${FT_LS_PATH}" -.r t_dir > your 2> your2
YOUR_RET=($?)
if [ $OUR_RET -ne $YOUR_RET ]; then
    printf "\r\n\033[31mError:\t\t\033[0m\033[37;1m ls -.r\033[0m\n\n"
	printf "/bin/ls return: %d | ft_ls return: %d\n\n" $OUR_RET $YOUR_RET
elif [ $OUR_RET -ne 0 ] && [ $(wc -l < our2) -ne 0 ] && [ $(wc -l < your2) -eq 0 ]; then
	printf "\r\n\033[31mError:\t\t\033[0m\033[37;1m ls -.r\033[0m\n\n"
	diff your2 our2
elif !(diff --brief your our) then
	printf "\r\n\033[31mError:\t\t\033[0m\033[37;1m ls -.r\033[0m\n\n"
    diff your our
else
    printf "\n\033[32mSuccess:\t\033[37;1m ls -.r\033[0m\n\n"
fi

[ "${INTERACTIVE_MODE}" -eq "1" ] && printf "\n\n\033[1;37mPlease press a key to continue :D: \033[0m" && read

rm -f your2
rm -f our2
rm -f your
rm -f our
