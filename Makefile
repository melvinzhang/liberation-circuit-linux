Libcirc-linux-x86_64-binary-v1.3.zip:
	docker build -t liberation-circuit-linux .
	docker run --rm liberation-circuit-linux cat /opt/Libcirc-linux-x86_64-binary-v1.3.zip > $@
