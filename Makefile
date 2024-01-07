# Makefile for cpumon project

CC = gcc
CFLAGS = -Wall -Wextra -std=c99
LDFLAGS = -lncurses -lm

SRC_DIR = ./src
OBJ_DIR = ./obj

SOURCES = cpumon.c $(wildcard $(SRC_DIR)/*.c)
OBJECTS = $(patsubst $(SRC_DIR)/%.c,$(OBJ_DIR)/%.o,$(SOURCES))

TARGET = cpumon
INSTALL_PATH = /usr/bin

.PHONY: all clean install

all: $(TARGET)

$(TARGET): $(OBJECTS)
	$(CC) $(OBJECTS) -o $(TARGET) $(LDFLAGS)

$(OBJ_DIR)/%.o: $(SRC_DIR)/%.c | $(OBJ_DIR)
	$(CC) $(CFLAGS) -c $< -o $@

$(OBJ_DIR):
	mkdir -p $(OBJ_DIR)

install: $(TARGET)
	cp $(TARGET) $(INSTALL_PATH)

clean:
	rm -f $(OBJ_DIR)/*.o $(TARGET)
	rmdir $(OBJ_DIR) || true
