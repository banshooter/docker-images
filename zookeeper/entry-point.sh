#!/bin/sh
exec /opt/zookeeper/bin/zkServer.sh start-foreground > /opt/zookeeper/logs/log-zk.out 2>&1
