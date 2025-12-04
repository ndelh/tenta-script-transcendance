LOGNAME=trans


install:
	if [ "$$(whoami)" != root ]; then \
		echo "set up must be runned in root"; \
		exit 1; \
	fi; \
	chmod +x ./trans_init.sh; \
	./trans_init.sh $(LOGNAME); \
	if [ $$? -ne 0 ]; then \
		echo "failure while scripting"; \
		exit 1; \
	fi; \
	systemctl status docker; \
	if [ $$? -ne 0 ]; then \
		echo "docker wasnt installed"; \
		exit 1; \
	fi; \
	rm -rf ./trans_init.sh; \
	rm ./Makefile; \
	sudo -u $(LOGNAME) ssh-keygen -t rsa -q -N "" -f ~/.ssh/id_rsa; \
	reboot

