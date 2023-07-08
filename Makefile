.PHONY: setup

# Global variables -------------------------------------------------------
SLEEP    := 3600
REPLICAS := 3
GROUPS   := nginx db

# Customizing your output ------------------------------------------------
CODE_CHANGE   = "\\033["
WARNING      := $(shell echo ${CODE_CHANGE}'33;5m')
BOLD_WARNING := $(shell echo ${CODE_CHANGE}'33;1m')
RUNNING      := $(shell echo ${CODE_CHANGE}'32;5m')
SETUP        := $(shell echo ${CODE_CHANGE}'36;4m')
NC           := $(shell echo ${CODE_CHANGE}'0m')

# Targets ----------------------------------------------------------------
check_%:
	$(eval REQ := $(shell which $* ))
	@if [ "${REQ}" = "" ]; then \
		echo "${WARNING}Please, consider doing: \n${BOLD_WARNING}make setup \n \
		      ${NC}${WARNING}\nOr just do it: \n${BOLD_WARNING}pip install $*"; \
		exit 1; \
	 fi ||:

setup: check_docker check_ansible
	@echo "${SETUP}"
	@for group in ${GROUPS}; do \
		for x in {1..${REPLICAS}}; do \
			docker run -d --rm --name $$group$$x python:latest sleep ${SLEEP}; \
		done; \
	done;

remove: check_docker
	@echo "${WARNING}"
	@docker ps -a
	@echo ---------------------------------------------------------
	@for group in ${GROUPS}; do \
		docker stop -s9 $${group}{1..${REPLICAS}}; \
	done;
	@echo "${BOLD_WARNING}"
	@echo ---------------------------------------------------------
	@docker ps -a

test: check_ansible
	ansible all -m ping -i hosts -o
