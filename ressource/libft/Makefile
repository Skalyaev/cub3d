NAME		= libft.a

CC		= gcc
CFLAGS		= -Wall -Wextra -Werror
RM		= rm -rf

SRC_DIR		= src
OBJ_DIR		= obj
SRC_EXT		= c
SRC_COUNT	= $(shell find $(SRC_DIR) -type f -name "*.$(SRC_EXT)" | wc -l)
SRC		= $(shell find $(SRC_DIR) -type f -name "*.$(SRC_EXT)")
OBJ		= $(subst $(SRC_DIR),$(OBJ_DIR),$(SRC:.c=.o))

all		: ${NAME}

ifeq ($(SRC_COUNT), 25)
${NAME}		: $(OBJ_DIR) ${OBJ}
		ar rcs ${NAME} ${OBJ}
else
$(NAME)		:
		@echo "Srcs corrupted, aborting"
endif

$(OBJ_DIR)	:
		@mkdir $(OBJ_DIR)

$(OBJ_DIR)/%.o	: $(SRC_DIR)/%.$(SRC_EXT)
		$(CC) $(CFLAGS) -c $< -o $(<:.$(SRC_EXT)=.o)
		@mv $(SRC_DIR)/*.o $@

clean		:
		${RM} ${OBJ_DIR}

fclean		: clean
		${RM} ${NAME}

re		: fclean all

.PHONY		: all bonus clean fclean re