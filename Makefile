# **************************************************************************** #
#                                                                              #
#                                                         ::::::::             #
#    Makefile                                           :+:    :+:             #
#                                                      +:+                     #
#    By: tde-jong <tde-jong@student.codam.nl>         +#+                      #
#                                                    +#+                       #
#    Created: 2019/11/12 10:13:23 by tde-jong      #+#    #+#                  #
#    Updated: 2021/10/03 15:30:44 by svoort        ########   odam.nl          #
#                                                                              #
# **************************************************************************** #

include colors.mk

NAME = ft_nmap
CC = gcc
CFLAGS = $(INC_FLAGS) $(DEP_FLAGS) -Wall -Werror -Wextra -Wunreachable-code 
LDFLAGS = -L libft
LDLIBS = -lft -lpcap

VPATH = \
	src

SRC = \
	main

INC_DIR = ./inc
INC_FLAGS = -I $(INC_DIR)

DEP_DIR = dep
DEP_FLAGS = -MMD -MF $(DEP_DIR)/$*.d
DEP_FILES := $(patsubst %, $(DEP_DIR)/%.d, $(SRC))

OBJ_DIR = obj
OBJ_FILES := $(patsubst %, $(OBJ_DIR)/%.o, $(SRC))

all: $(NAME)

$(NAME): $(OBJ_DIR) $(DEP_DIR) $(OBJ_FILES)
	@$(LINK.c) -o $@ $(OBJ_FILES) $(LDLIBS)
	@echo "$(CMAGENTA)🔗\tlinking $(OBJ_FILES)$(CDEF)"
	@echo "$(CGREEN)🎉\t$(NAME) has been compiled$(CDEF)"

$(OBJ_DIR):
	@mkdir -p $(OBJ_DIR)

$(DEP_DIR):
	@mkdir -p $(DEP_DIR)

$(OBJ_DIR)/%.o: %.c
	@echo "$(CBLUE)🔨\tcompiling $<$(CDEF)"
	@$(COMPILE.c) $(OUTPUT_OPTION) $<

clean:
	@echo "$(CRED)🗑️\tremoving object and dependency files$(CDEF)"
	@$(RM) -r $(OBJ_DIR)
	@$(RM) -r $(DEP_DIR)

fclean: clean
	@echo "$(CRED)🗑️\tremoving binary$(CDEF)"
	@$(RM) $(NAME)

re:
	@make fclean
	@make all

-include $(DEP_FILES)

.PHONY: all clean fclean re
