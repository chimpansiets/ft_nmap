/* ************************************************************************** */
/*                                                                            */
/*                                                        ::::::::            */
/*   ft_strclr.c                                        :+:    :+:            */
/*                                                     +:+                    */
/*   By: svoort <svoort@student.codam.nl>             +#+                     */
/*                                                   +#+                      */
/*   Created: 2019/01/11 12:33:29 by svoort         #+#    #+#                */
/*   Updated: 2019/01/18 10:24:44 by svoort        ########   odam.nl         */
/*                                                                            */
/* ************************************************************************** */

#include "libft.h"

void	ft_strclr(char *s)
{
	int i;

	if (s != NULL)
	{
		i = 0;
		while (s[i] != '\0')
			s[i++] = '\0';
	}
}