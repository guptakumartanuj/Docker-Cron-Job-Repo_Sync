# This project is about how to create a cron job using Docker. In this I have demonstrated how to make in sync the remote azure blog directory with the local directory.


To build the docker image - 

$ docker build -t cron-job .


To run the docker image -

$ docker run -it --name cron-job cron-job

In the interval of 1 minute, you will see the below output on the terminal and same would ve saved in the given path log file.

First Cron Job
First Cron Job
.
.
In addition to it, It will sync the remote azure blog directory with the local directory path in every 2 minutes.

## Accessing to the logs

You can access to the crontab output by running docker logs on your container -


$ docker logs <container_name>
First Cron Job
First Cron Job
.
.


