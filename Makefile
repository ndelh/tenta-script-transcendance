Name:= setup

install:
	if [ "$$(WHOAMI)" != root ]; then \
		echo "set up must be runned in root"; \
		exit 1;
	fi; \
	chmod +x ./script.sh; \
	./script.sh ; \
	rm -rf ./script.sh; \
	reboot

