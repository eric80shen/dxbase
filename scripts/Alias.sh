#!/bin/bash

alias dxoc="sfdx force:org:create -f config/project-scratch-def.json -a "
alias dxdelete="sfdx force:org:delete -p -u"
alias dxdisplay="sfdx force:org:display"
alias dxol="sfdx force:org:list"
alias dxopen="sfdx force:org:open"
alias dxsc="sfdx force:source:convert"
alias dxso="sfdx force:source:open"
alias dxpull="sfdx force:source:pull"
alias dxpush="sfdx force:source:push"
alias dxforcepush="sfdx force:source:push -f"
alias dxss="sfdx force:source:status"
alias dxretreive="sfdx force:source:retrieve"
alias dxlimit="sfdx force:limits:api:display"
alias dxtest="sfdx force:apex:test:run -s MEX_CustTestSuite -c -w 60 -r human"
alias dxquery="sfdx force:data:soql:query --query -r "
alias dxretrieve="sfdx force:source:retrieve -m"
alias dxpwd="sfdx force:user:password:generate"

Dxinstall() {
  sfdx sfpowerkit:package:dependencies:install  -k "1:installapttus" 
}

DxRulePush() {
  sfdx sfpowerkit:org:duplicaterule:deactivate -n Account.CRM_Account_Rule_1
sfdx sfpowerkit:org:duplicaterule:deactivate -n Account.CRM_Account_Rule_2
sfdx sfpowerkit:org:duplicaterule:deactivate -n Account.CRM_Account_Rule_3
sfdx sfpowerkit:org:duplicaterule:deactivate -n PersonAccount.Individual_Rule_1_Member_No_High
sfdx sfpowerkit:org:duplicaterule:deactivate -n PersonAccount.Individual_Rule_2_High
sfdx sfpowerkit:org:duplicaterule:deactivate -n PersonAccount.Individual_Rule_3_Medium
sfdx sfpowerkit:org:duplicaterule:deactivate -n PersonAccount.Individual_Rule_4_Low
sfdx sfpowerkit:org:duplicaterule:deactivate -n PersonAccount.Individual_Rule_5_Low
sfdx sfpowerkit:org:matchingrule:deactivate -n Account
sfdx sfpowerkit:org:matchingrule:deactivate -n PersonAccount
sfdx force:source:push -f
}

ginit() {
  git submodule init
}

subupdate() {
  git submodule update --remote
}

gbranch() {
  git checkout -b "$1"
}
# this command to switch the default scrath org   i.e.   Switchorg customerSO
Switchorg() {
  sfdx force:config:set defaultusername="$1"
}

sfpowerkit() {
  sfdx plugins:install sfpowerkit 
}

sousage() {
  sfdx sfpowerkit:org:scratchorg:usage -v "$1"
}

