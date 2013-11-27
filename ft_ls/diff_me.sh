# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    diff_me.sh                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: stherman <stherman@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2013/11/27 09:02:59 by stherman          #+#    #+#              #
#    Updated: 2013/11/27 11:21:48 by stherman         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

#!/bin/sh

clear

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

SUCCESS= ls -l t_dir/ > our && ft_ls -l t_dir > your
if !(diff --brief your our) || !($SUCCESS) then
	printf "\r\n\033[31mError:\t\t\033[0m\033[37;1m ls -l\033[0m\n\n"
	diff your our
else
	printf "\n\033[32mSuccess:\t\033[37;1m ls -l\033[0m\n\n"
fi

SUCCESS= ls -a t_dir/ > our && ft_ls -a t_dir > your
if !(diff --brief your our) || !($SUCCESS) then
	printf "\r\n\033[31mError:\t\t\033[0m\033[37;1m ls -a\033[0m\n\n"
	diff your our
else
	printf "\n\033[32mSuccess:\t\033[37;1m ls -a\033[0m\n\n"
fi

SUCCESS= ls -lr t_dir/ > our && ft_ls -r t_dir > your
if !(diff --brief your our) || !($SUCCESS) then
	printf "\r\n\033[31mError:\t\t\033[0m\033[37;1m ls -r\033[0m\n\n"
	diff your our
else
	printf "\n\033[32mSuccess:\t\033[37;1m ls -r\033[0m\n\n"
fi

SUCCESS= ls -R t_dir/ > our && ft_ls -R t_dir > your
if !(diff --brief your our) || !($SUCCESS) then
	printf "\r\n\033[31mError:\t\t\033[0m\033[37;1m ls -R\033[0m\n\n"
	diff your our
else
	printf "\n\033[32mSuccess:\t\033[37;1m ls -R\033[0m\n\n"
fi

SUCCESS= ls -t t_dir/ > our && ft_ls -t t_dir > your
if !(diff --brief your our) || !($SUCCESS) then
	printf "\r\n\033[31mError:\t\t\033[0m\033[37;1m ls -t\033[0m\n\n"
	diff your our
else
	printf "\n\033[32mSuccess:\t\033[37;1m ls -t\033[0m\n\n"
fi

rm -f your
rm -f our
