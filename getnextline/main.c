/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   main.c                                             :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: student@42 <@student.42.fr>                +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2013/12/01 22:10:06 by student@42        #+#    #+#             */
/*   Updated: 2013/12/02 07:22:03 by qperez           ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include <unistd.h>
#include <stdio.h>
#include <stdlib.h>
#include <fcntl.h>
#include <string.h>

int	get_next_line(int fd, char **line);

int	main(int argc, char const** argv)
{
	int		fd;
	int		fd2;
	char	*line;
	pid_t	child;
	char	n = '\n';

	fd = open("cmp.txt", O_RDONLY);
	fd2 = open("me.txt", O_WRONLY | O_CREAT);
	if (fd == -1 || fd2 == -1)
	{
		perror("open");
		close(fd);
		close(fd2);
		return (-1);
	}
	while (get_next_line(fd, &line) == 1)
	{
		write(fd2, line, strlen(line));
		write(fd2, &n, 1);
		free(line);
	}
	close(fd);
	close(fd2);
	child = fork();
	if (child == 0)
	{
		char	*arg[] = {"cmp.txt", "me.txt", NULL};

		execve("/usr/bin/diff", arg, NULL);
		exit(0);
	}
	else
	{
		while (waitpid(0, NULL, 0) != 0) // bad code I know ... but it's not the project
			;
	}
	(void)argc;
	(void)argv;
	return (0);
}

