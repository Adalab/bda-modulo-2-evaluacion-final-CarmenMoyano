# Ejercicios SQL con la Base de Datos Sakila
Este repositorio contiene soluciones a ejercicios SQL utilizando la base de datos de Sakila. 
# Base de Datos:
**Nombre de la Base de Datos**: Sakila

**Descripción**: Se basa en un sistema de alquiler de películas, similar al sistema utilizado por Blockbuster y otras tiendas de alquiler de películas.

**Estructura de la Base de Datos**: La base de datos Sakila consta de varias tablas que representan diferentes aspectos del negocio de alquiler de películas. Sus tablas son:
    actor: Información sobre los actores, incluyendo sus nombres.
    address: Detalles de las direcciones, incluyendo nombres de calles y números de teléfono.
    category: Categorías a las que pertenecen las películas.
    city: Nombres de ciudades y su país asociado.
    country: Nombres de países.
    customer: Detalles de los clientes, como nombres, direcciones y correos electrónicos.
    film: Datos sobre películas, como título, descripción, año de lanzamiento y más.
    film_actor: Relaciones entre actores y películas.
    film_category: Asociaciones entre películas y categorías.
    inventory: Información sobre copias de películas disponibles en las tiendas.
    language: Idiomas disponibles.
    payment: Detalles de los pagos realizados por los clientes.
    rental: Registros de alquileres de películas.
    staff: Información sobre el personal de las tiendas.
    store: Datos sobre las tiendas, incluyendo los gerentes y direcciones.

**Estructura del Proyecto**
    evaluacion.sql: Archivo que contiene todas las consultas SQL resueltas.
    sakila-schema.sql: Archivo con el esquema de la base de datos Sakila.
    sakila-data.sql: Archivo con los datos de la base de datos Sakila.
    detalle-bbdd-sakila.md: Archivo con inforamción detallada de cada una de las tablas.
    
**Requisitos**:
    MySQL Workbench o cualquier gestor de bases de datos SQL compatible.
    Acceso a la línea de comandos o a un entorno de desarrollo SQL.