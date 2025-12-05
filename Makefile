init:
	if [ -z ./init/.initflag ]; then \
		@make ./init; \
	else \
		echo "init Already done"; \
	fi
	

docker:
	echo "docker"
