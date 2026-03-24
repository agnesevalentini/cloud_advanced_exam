# Docker file for image: cloud_image
# Version: 1.0.0

FROM cloud_image:v1.0.0

COPY start.sh start.sh

#COPY hpccinf.txt hpccinf.txt

RUN rm _hpccinf.txt

RUN chmod 777 hpccinf.txt

# added these commands to modify the hpccinf.txt file

#adding hpl folder (newer version)
#COPY hpl-2.3.tar.gz hpl.tar.gz
#RUN alien -i hpl.tar.gz

#RUN apt-get install -y build-essential linux-generic libmpich-dev libopenmpi-dev

########################################
#commands to install hpcc library on ubuntu
#RUN apt install -y hpcc
#RUN sudo apt install openmpi-bin libopenmpi-dev # to install openmpi
#sudo apt install opessh-server # to install ssh server (useful for hpcc tests)
# the ssh must be configured to allow passwordless login between the nodes (master and node5 and vice versa)
# run 
#RUN  # to run hpcc test on 4 cpus (total on 2 nodes) using the hosts file

#THIS IS THE RIGHT ONE!
#RUN mpirun --mca btl_tcp_if_include enp0s8 -np 4 -hostfile hosts hpcc # to run hpcc test on 4 cpus (total on 2 nodes) using the hosts file and specifying the network interface
# set N = 1000 in the hpccinf.txt file to run the test on 1000x1000 matrix, it's safer and it actually terminates
