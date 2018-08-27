oc new-project cicd
oc new-project qa
oc new-app jenkins-ephemeral -n cicd
#oc new-app https://github.com/wkulhanek/openshift-tasks.git --name=openshift-task -n cicd
oc new-project tasks
oc new-app eap70-basic-s2i --param SOURCE_REPOSITORY_URL=https://github.com/kalidask/Openshft_homework --param SOURCE_REPOSITORY_REF=master --param CONTEXT_DIR=openshift-tasks --param APPLICATION_NAME=tasks -n tasks

oc policy add-role-to-user edit system:serviceaccount:cicd:jenkins -n tasks
oc policy add-role-to-group system:image-puller system:serviceaccounts:cicd -n tasks
oc policy add-role-to-user edit system:serviceaccount:cicd:jenkins -n qa
oc policy add-role-to-group system:image-puller system:serviceaccounts:cicd -n qa
oc policy add-role-to-group system:image-puller system:serviceaccounts:qa -n tasks
oc create deploymentconfig tasks --image=docker-registry.default.svc.cluster.local:5000/tasks/tasks:promoteToQA -n qa
oc expose dc tasks --port=8080 -n qa
oc expose svc tasks  -n qa

oc create -f /opt/Openshft_homework/scripts/sample-pipeline -n cicd
oc start-build sample-pipeline -n cicd
