init:
	if [ ! -f ./init/.initflag ]; then \
		make -C initiation; \
	else \
		echo "init Already done"; \
	fi
	

docker:
	echo "docker"
