# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    diff_me.sh                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: stherman <stherman@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2013/11/27 09:02:59 by stherman          #+#    #+#              #
#    Updated: 2013/11/28 17:18:02 by qperez           ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

#!/bin/sh

clear

if [ ! -e ft_ls ]; then
	printf "\033[31mft_ls: No such file\n\033[0m"
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

SUCCESS= /bin/ls -1 -l t_dir > our && ./ft_ls -l t_dir > your
if !(diff --brief your our) || !($SUCCESS) then
	printf "\r\n\033[31mError:\t\t\033[0m\033[37;1m ls -l\033[0m\n\n"
	diff your our
else
	printf "\n\033[32mSuccess:\t\033[37;1m ls -l\033[0m\n\n"
fi

SUCCESS= /bin/ls -1 -a t_dir > our && ./ft_ls -a t_dir > your
if !(diff --brief your our) || !($SUCCESS) then
	printf "\r\n\033[31mError:\t\t\033[0m\033[37;1m ls -a\033[0m\n\n"
	diff your our
else
	printf "\n\033[32mSuccess:\t\033[37;1m ls -a\033[0m\n\n"
fi

SUCCESS= /bin/ls -1 -r t_dir > our && ./ft_ls -r t_dir > your
if !(diff --brief your our) || !($SUCCESS) then
	printf "\r\n\033[31mError:\t\t\033[0m\033[37;1m ls -r\033[0m\n\n"
	diff your our
else
	printf "\n\033[32mSuccess:\t\033[37;1m ls -r\033[0m\n\n"
fi

SUCCESS= /bin/ls -1 -R t_dir > our && ./ft_ls -R t_dir > your
if !(diff --brief your our) || !($SUCCESS) then
	printf "\r\n\033[31mError:\t\t\033[0m\033[37;1m ls -R\033[0m\n\n"
	diff your our
else
	printf "\n\033[32mSuccess:\t\033[37;1m ls -R\033[0m\n\n"
fi

SUCCESS= /bin/ls -1 -t t_dir > our && ./ft_ls -t t_dir > your
if !(diff --brief your our) || !($SUCCESS) then
	printf "\r\n\033[31mError:\t\t\033[0m\033[37;1m ls -t\033[0m\n\n"
	diff your our
else
	printf "\n\033[32mSuccess:\t\033[37;1m ls -t\033[0m\n\n"
fi

printf "\n\n\033[1;37mPlease press a key to continue :D: \033[0m"
read

# -------------------------------------------------------------------------------------------------------------- #
# -------------------------------------------------------------------------------------------------------------- #
# TEST_2        ------------------------------------------------------------------------------------------------ #
# -------------------------------------------------------------------------------------------------------------- #
# -------------------------------------------------------------------------------------------------------------- #

clear

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

SUCCESS= /bin/ls -1 -l -a t_dir > our && ./ft_ls -l -a t_dir > your
if !(diff --brief your our) || !($SUCCESS) then
    printf "\r\n\033[31mError:\t\t\033[0m\033[37;1m ls -l -a\033[0m\n\n"
    diff your our
else
    printf "\n\033[32mSuccess:\t\033[37;1m ls -l -a\033[0m\n\n"
fi

SUCCESS= /bin/ls -1 -l -a -r t_dir > our && ./ft_ls -l -a -r t_dir > your
if !(diff --brief your our) || !($SUCCESS) then
    printf "\r\n\033[31mError:\t\t\033[0m\033[37;1m ls -l -a -r\033[0m\n\n"
    diff your our
else
    printf "\n\033[32mSuccess:\t\033[37;1m ls -l -a -r\033[0m\n\n"
fi

SUCCESS= /bin/ls -1 -l -a -r -R t_dir > our && ./ft_ls -l -a -r -R t_dir > your
if !(diff --brief your our) || !($SUCCESS) then
    printf "\r\n\033[31mError:\t\t\033[0m\033[37;1m ls -l -a -r -R\033[0m\n\n"
    diff your our
else
    printf "\n\033[32mSuccess:\t\033[37;1m ls -l -a -r -R\033[0m\n\n"
fi

SUCCESS= /bin/ls -1 -l -a -r -R -t t_dir > our && ./ft_ls -l -a -r -R -t t_dir > your
if !(diff --brief your our) || !($SUCCESS) then
    printf "\r\n\033[31mError:\t\t\033[0m\033[37;1m ls -l -a -r -R -t\033[0m\n\n"
    diff your our
else
    printf "\n\033[32mSuccess:\t\033[37;1m ls -l -a -r -R -t\033[0m\n\n"
fi

printf "\n\n\033[1;37mPlease press a key to continue :D: \033[0m"
read

# -------------------------------------------------------------------------------------------------------------- #
# -------------------------------------------------------------------------------------------------------------- #
# TEST_3        ------------------------------------------------------------------------------------------------ #
# -------------------------------------------------------------------------------------------------------------- #
# -------------------------------------------------------------------------------------------------------------- #

clear

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

SUCCESS= /bin/ls -1 -la t_dir > our && ./ft_ls -la t_dir > your
if !(diff --brief your our) || !($SUCCESS) then
    printf "\r\n\033[31mError:\t\t\033[0m\033[37;1m ls -la\033[0m\n\n"
    diff your our
else
    printf "\n\033[32mSuccess:\t\033[37;1m ls -la\033[0m\n\n"
fi

SUCCESS= /bin/ls -1 -rla t_dir > our && ./ft_ls -rla t_dir > your
if !(diff --brief your our) || !($SUCCESS) then
    printf "\r\n\033[31mError:\t\t\033[0m\033[37;1m ls -rla\033[0m\n\n"
    diff your our
else
    printf "\n\033[32mSuccess:\t\033[37;1m ls -rla\033[0m\n\n"
fi

SUCCESS= /bin/ls -1 -rlRa t_dir > our && ./ft_ls -rlRa t_dir > your
if !(diff --brief your our) || !($SUCCESS) then
    printf "\r\n\033[31mError:\t\t\033[0m\033[37;1m ls -rlRa\033[0m\n\n"
    diff your our
else
    printf "\n\033[32mSuccess:\t\033[37;1m ls -rlRa\033[0m\n\n"
fi

SUCCESS= /bin/ls -1 -trlRa t_dir > our && ./ft_ls -trlRa t_dir > your
if !(diff --brief your our) || !($SUCCESS) then
    printf "\r\n\033[31mError:\t\t\033[0m\033[37;1m ls -trlRa\033[0m\n\n"
    diff your our
else
    printf "\n\033[32mSuccess:\t\033[37;1m ls -trlRa\033[0m\n\n"
fi

printf "\n\n\033[1;37mPlease press a key to continue :D: \033[0m"
read

# -------------------------------------------------------------------------------------------------------------- #
# -------------------------------------------------------------------------------------------------------------- #
# TEST_4        ------------------------------------------------------------------------------------------------ #
# -------------------------------------------------------------------------------------------------------------- #
# -------------------------------------------------------------------------------------------------------------- #

clear

printf "\033[44m\033[1;37m"

printf "# **************************************************************************** #\n"
printf "#                                                                              #\n"
printf "#                                                         :::      ::::::::    #\n"
printf "#                                                       :+:      :+:    :+:    #\n"
printf "#                                                     +:+ +:+         +:+      #\n"
printf "#          ~ TESTS THAT FAILS IN /bin/ls -1 ~               +#+  +:+       +#+         #\n"
printf "#                                                 +#+#+#+#+#+   +#+            #\n"
printf "#                                                      #+#    #+#              #\n"
printf "#                                                     ###   ########.fr        #\n"
printf "#                                                                              #\n"
printf "# **************************************************************************** #\n\n\n"

printf "\033[0m"

SUCCESS= /bin/ls -. t_dir > our 2>&1 && ./ft_ls -. t_dir > your 2>&1
if !(diff --brief your our) || !($SUCCESS) then
    printf "\r\n\033[31mError:\t\t\033[0m\033[37;1m ls -.\033[0m\n\n"
    diff your our
else
    printf "\n\033[32mSuccess:\t\033[37;1m ls -.\033[0m\n\n"
fi

SUCCESS= /bin/ls -1 -l. t_dir > our  2>&1 && ./ft_ls -l. t_dir > your 2>&1
if !(diff --brief your our) || !($SUCCESS) then
    printf "\r\n\033[31mError:\t\t\033[0m\033[37;1m ls -l.\033[0m\n\n"
    diff your our
else
    printf "\n\033[32mSuccess:\t\033[37;1m ls -l.\033[0m\n\n"
fi

SUCCESS= /bin/ls -1 -.r t_dir > our  2>&1 && ./ft_ls -.r t_dir > your 2>&1
if !(diff --brief your our) || !($SUCCESS) then
    printf "\r\n\033[31mError:\t\t\033[0m\033[37;1m ls -.r\033[0m\n\n"
    diff your our
else
    printf "\n\033[32mSuccess:\t\033[37;1m ls -.r\033[0m\n\n"
fi

printf "\n\n\033[1;37mPlease press a key to continue :D: \033[0m"
read

rm -f your
rm -f our
