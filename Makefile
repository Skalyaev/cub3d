NAME		= cub3D

CC		= gcc
CFLAGS		= -Wall -Wextra -Werror -fsanitize=address

INCLUDE_DIR	= include
HEADER_EXT	= h
HEADER		= $(shell find $(INCLUDE_DIR) -type f -name "*.$(HEADER_EXT)")
HEADER_COUNT	= $(shell find $(INCLUDE_DIR) -type f -name "*.$(HEADER_EXT)" | wc -l)
LIB		= ressource/libft/libft.a mlx_linux/ -lmlx -lXext -lX11

SRC_DIR		= src
SRC_EXT		= c
SRC_COUNT	= $(shell find $(SRC_DIR) -type f -name "*.$(SRC_EXT)" | wc -l)
SRC		= $(shell find $(SRC_DIR) -type f -name "*.$(SRC_EXT)")

OBJ_DIR		= obj
OBJ_SUBDIR	= $(shell find $(SRC_DIR) -type d | grep '/' | sed 's/$(SRC_DIR)/$(OBJ_DIR)/g')
OBJ		= $(subst $(SRC_DIR),$(OBJ_DIR),$(SRC:.$(SRC_EXT)=.o))

RM		= rm -rf

all		: ${NAME}

ifeq ($(HEADER_COUNT), 1)
ifeq ($(SRC_COUNT), 13)
${NAME}		: make_libft make_mlx $(OBJ_DIR) $(OBJ_SUBDIR) ${OBJ}
		${CC} ${CFLAGS} ${OBJ} -L. ${LIB} -o ${NAME}
else
$(NAME)		:
		@echo "Srcs corrupted, aborting"
endif
else
$(NAME)		:
		@echo "Srcs corrupted, aborting"
endif

make_libft	:
		cd ressource/libft && make

clean_libft	:
		cd ressource/libft && make clean

fclean_libft	:
		cd ressource/libft && make fclean

make_mlx	:
		cd mlx_linux && make

clean_mlx	:
		cd mlx_linux && make clean

$(OBJ_DIR)	:
		@mkdir $(OBJ_DIR)

$(OBJ_SUBDIR)	:
		@mkdir $(OBJ_SUBDIR)

$(OBJ_DIR)/%.o	: $(SRC_DIR)/%.$(SRC_EXT)
		$(CC) $(CFLAGS) -c $< -o $(<:.$(SRC_EXT)=.o)
		@mv $(SRC_DIR)/*/*.o $@

clean		: clean_libft clean_mlx
		${RM} ${OBJ_DIR}

fclean		: clean fclean_libft
		${RM} ${NAME}

re		: fclean all

.PHONY		: all bonus clean fclean re
