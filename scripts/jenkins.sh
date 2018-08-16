oc new-project cicd
oc new-app jenkins-ephemeral -n cicd
oc new-app https://github.com/wkulhanek/openshift-tasks.git --name=openshift-task -n cicd
oc create -f /opt/ocp_advanced_deployment_homework/scripts/sample-pipeline -n cicd
oc start-build sample-pipeline -n ci-cd
