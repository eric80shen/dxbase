#!/bin/bash

while [ ! -n "$ORG_NAME"  ] 
do
	echo "Please enter a name for your scratch org:"
	read ORG_NAME
done
#echo $dx_alias_name
#exit

while [ ! -n "$ORG_DATE"  ] 
do
	echo "Please enter a date for your scratch org:"
	read ORG_DATE
done

echo "Building your org, please wait."
sfdx force:org:create -f config/project-scratch-def.json -s -a $ORG_NAME -d $ORG_DATE -w 10

if [ "$?" = "1" ] 
then
	echo "Can't create your org."
	exit
fi
echo "Pushing the installed packages, please wait. It may take 20-30 minutes."

#sfdx sfpowerkit:package:dependencies:install  -k "1:installapttus"

echo "Pushing the code, please wait. It may take a while."
sfdx force:source:push 

sfdx force:user:permset:assign -n recipes
sfdx force:data:tree:import --plan ./data/data-plan.json

say "Your Scratchorg is ready to use."

sfdx force:org:open
#sfdx force:source:push
#sfdx force:user:permset:assign -n Dreamhouse
#sfdx force:data:tree:import -p data/sample-data-plan.json
#sfdx force:apex:test:run -r tap -c
#sfdx force:apex:execute -f ./scripts/demo.apex