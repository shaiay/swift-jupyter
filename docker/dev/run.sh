docker run \
-d \
-p 8888:8888 \
-p 8022:22 \
--gpus all \
--cap-add SYS_PTRACE \
-v ~/notebooks:/notebooks \
-v /data/opt:/opt \
-v /etc/ssh:/etc/secret:ro \
--env=DISPLAY \
swift-dev
