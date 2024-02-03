NAME		= cub3D

CC		= gcc
CFLAGS		= -Wall -Wextra -Werror -fsanitize=address

INCLUDE_DIR	= include
HEADER_EXT	= h
HEADER		= $(shell find $(INCLUDE_DIR) -type f -name "*.$(HEADER_EXT)")
LIB		=  mlx_linux/ -lmlx -lXext -lX11 -lm ressource/libft/libft.a

SRC_DIR		= src
SRC_EXT		= c
SRC		= $(shell find $(SRC_DIR) -type f -name "*.$(SRC_EXT)")

OBJ_DIR		= obj
OBJ_SUBDIR	= $(shell find $(SRC_DIR) -type d | grep '/' | sed 's/$(SRC_DIR)/$(OBJ_DIR)/g')
OBJ		= $(subst $(SRC_DIR),$(OBJ_DIR),$(SRC:.$(SRC_EXT)=.o))

RM		= rm -rf

all		: ${NAME}

${NAME}		: make_libft make_mlx $(OBJ_DIR) $(OBJ_SUBDIR) ${OBJ}
		${CC} ${CFLAGS} -o ${NAME} ${OBJ} -L ${LIB}

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
