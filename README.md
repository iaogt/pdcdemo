# README

El proyecto simula 2 ambientes: desarrollo y producción.

Desarrollo sirve para que los developers puedan usar un ambiente localmente en su computadora.  Se puede cargar en docker con el comando:

docker-compose -f compose-dev.yml up -d

Cualquier cambio en el código de la carpeta se reflejaría inmediatamente.

Producción simula el entorno productivo, y puede generarse así:

docker-compose -f compose-qa.yml up -d

Este entorno tiene todo el código de la aplicación e inicializa el servidor web para el ambiente "production".  La imagen generada para este entorno puede almacenarse en docker hub y luego usarse en un docker swarm para cargar un servicio.