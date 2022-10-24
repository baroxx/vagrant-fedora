#!/bin/bash

vagrant up --provider libvirt --provision-with main,toolbox,angular,terraform,kubectl,minikube,postman,code,helm,slack,aws,ansible,texlive,final
