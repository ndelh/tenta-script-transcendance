init:
	if [ ! -f ./init/.initflag ]; then \
		@make -C initation; \
	else \
		echo "init Already done"; \
	fi
	

docker:
	echo "docker"
