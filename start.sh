#!/bin/bash

# Generate host keys if they don't exist
ssh-keygen -A

sed -i "s/#Port 22/Port $SSH_PORT/" /etc/ssh/sshd_config
# Start SSH service
service ssh start

# Wait for SSH to be up
sleep 2

# Add master and node1 to known_hosts
ssh-keyscan -H localhost -p $TARGET_PORT >> /root/.ssh/known_hosts


tail -f /dev/null # command to keep the container running


###################### BENCHMARKS #########################################
# docker containers logs -f nome_container

# IOZONE
#IOZONE_OUTPUT_FILE_NAME=${HOSTNAME}_iozone # iozone output file name changes depending on the node on which the test has run
#iozone -Ra -g 1G -O -b /data/${IOZONE_OUTPUT_FILE_NAME}.wks # run iozone test and write the output to a file
# chown agnese /data/${IOZONE_OUTPUT_FILE_NAME}.wks # change the owner of the file to agnese instead of root, so that we can access it from the host machine


# SYSBENCH
#sysbench --test=cpu --cpu-max-prime=20000 run # this command will benchmark the cpu by calculating prime numbers up to 20000 SEQUENTIALLY

# this one tests the cpu in parallel
# mpirun --host master,node1 -np 2 sysbench cpu run --cpu-max-prime=20000 --threads=2 # this command will run the sysbench cpu benchmark in parallel on master and node1 with 2 threads


# HPCC 
# mpirun --mca btl_tcp_if_include enp0s8 -np 4 -hostfile hosts hpcc # this is for the vms
# mpirun -np 4  hpcc  # this is for the docker containers

# mpirun.openmpi -np 4 --host master:2,node1:2  hpcc # this command will run the hpcc benchmark in parallel on master and node1 with 2 processes on each node


# IPERF3

# run both containers before 
# iperf3 -s & # on the master container acting as server, optionally add the & to keep on using the terminal
# iperf3 -c master  # on the node1 container acting as client



# STRESS-NG

# mpirun -np 4 stress-ng --cpu 4 --timeout 60s --metrics # this command will run the stress-ng benchmark on the cpu for 60 seconds and print the metrics











