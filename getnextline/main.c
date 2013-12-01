/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   main.c                                             :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: student@42 <@student.42.fr>                +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2013/12/01 22:10:06 by student@42        #+#    #+#             */
/*   Updated: 2013/12/01 22:35:11 by qperez           ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include <unistd.h>
#include <stdio.h>
#include <stdlib.h>
#include <fcntl.h>
#include <string.h>

char	*ft_getnextline(int fd);

int	main(int argc, char const** argv)
{
	int		fd;
	int		fd2;
	char	*line;

	fd = open("cmp.txt", O_RDONLY);
	fd2 = open("me.txt", O_WRONLY | O_CREAT);
	if (fd == -1 || fd2 == -1)
	{
		perror("open");
		close(fd);
		close(fd2);
		return (-1);
	}
	while ((line = ft_getnextline(fd)) != NULL)
	{
		write(fd2, line, strlen(line));
		free(line);
	}
	close(fd);
	close(fd2);
	(void)argc;
	(void)argv;
	return (0);
}

