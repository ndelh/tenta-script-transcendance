init:
	if [ -z ./init/.initflag ]; then \
		@make ./init \
	fi;

docker:
	echo "docker"
