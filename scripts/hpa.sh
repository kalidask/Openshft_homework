oc create -f - /root/Openshft_homework/scripts/hpa.yaml -n qa
oc autoscale dc/tasks --min 1 --max 5 --cpu-percent=80 -n qa 

