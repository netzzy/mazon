aws.exe  autoscaling create-auto-scaling-group --auto-scaling-group-name cfg --launch-configuration-name cfg --min-size 1 --max-size 1 --desired-capacity 1 --default-cooldown 600 --termination-policies "OldestInstance" --availability-zones us-west-2a us-west-2b us-west-2c
pause
pause
