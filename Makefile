LOGNAME=trans

Name:= setup

install:
	if [ "$$(whoami)" != root ]; then \
		echo "set up must be runned in root"; \
		exit 1;
	fi; \
	chmod +x ./script.sh; \
	./script.sh $(LOGNAME) ; \
	if [ $$? -ne 0 ]; then \
		echo "failure while scripting"; \
		exit 1; \
	fi; \
	systemctl status docker; \
	if [ $$? -ne 0 ]; then \
		echo "docker wasnt installed"; \
		exit 1; \
	fi; \
	rm -rf ./script.sh; \
	ssh-keygen -t rsa -q -N "" -f ~/.ssh/id_rsa; \
	rm ./Makefile; \
	reboot
