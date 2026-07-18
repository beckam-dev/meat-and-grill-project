# meat-and-grill-project
Sistema de pedidos dinámicos de un restaurante parrillero para el curso Herramientas de Desarrollo.

## Docker

Para generar una imagen de docker, se debe ejecutar el siguiente comando desde la raíz del repositorio donde este el Dockerfile:

-	Para generar imagen de la base de datos:
	```
	docker build -t postgres-custom-v2 .
	```
-	Para ejecutar el contenedor creado de la base de datos:
	```
	docker run --name postgres-custom-v2 \
	-e POSTGRES_USER=postgres \
	-e POSTGRES_PASSWORD=postgres \
	-e POSTGRES_DB=db_prueba_tablas \
	-p 5432:5432 \
	postgres-custom-v2
	```
