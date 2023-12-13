#!/bin/bash
cd home/ubuntu
cd ce-project-status
echo -e "LIGHTS_SERVICE=http://${dns}\n""HEATING_SERVICE=http://${dns}\n""PORT=3000" > .env.local
pm2 start npm -- run start