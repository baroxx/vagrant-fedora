#!/bin/bash

vagrant up --provider libvirt --provision-with main,toolbox,angular,terraform,kubectl,postman,code,helm,slack,aws,final
