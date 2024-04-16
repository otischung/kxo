TARGET = kmldrv
kmldrv-objs = simrupt.o game.o mcts.o
obj-m := $(TARGET).o

KDIR ?= /lib/modules/$(shell uname -r)/build
PWD := $(shell pwd)

GIT_HOOKS := .git/hooks/applied
all: $(GIT_HOOKS) simrupt.c
	$(MAKE) -C $(KDIR) M=$(PWD) modules

$(GIT_HOOKS):
	@scripts/install-git-hooks
	@echo


clean:
	$(MAKE) -C $(KDIR) M=$(PWD) clean
