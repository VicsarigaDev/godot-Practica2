Proyecto: Juego de Plataformas 2D
Descripción

Este proyecto es un juego de plataformas 2D desarrollado en Godot 4.
El jugador controla un personaje que puede moverse lateralmente, saltar y eliminar enemigos al caer sobre ellos.
El objetivo del juego es demostrar mecánicas básicas de movimiento, físicas, animaciones y colisiones.

Características principales

Jugador (CharacterBody2D)

Movimiento horizontal con teclado (izquierda/derecha).

Salto con rebote.

Reinicio de escena si toca enemigos por los lados o desde abajo.

Enemigos (CharacterBody2D)

Patrullan de manera automática.

Cambian de dirección al chocar con paredes.

Pueden ser eliminados si el jugador cae encima.

Reinicio de escena si el jugador los toca por los lados.

TileMap

Nivel construido con TileMap y TileSet.

Colisiones configuradas para jugador y enemigos.

Física 2D

Gravedad y colisiones implementadas mediante CharacterBody2D.

Rebote del jugador al eliminar enemigos.

Estructura del proyecto
res://
├── Player.tscn
│   └── Player.gd
├── Enemy.tscn
│   └── Enemy.gd
├── TileMap.tscn
├── TileSet.tres
└── Main.tscn


Player.tscn / Player.gd → Nodo y script del jugador.

Enemy.tscn / Enemy.gd → Nodo y script de enemigo con “stomp” y colisión lateral.

TileMap.tscn / TileSet.tres → Nivel y tiles del juego.

Main.tscn → Escena principal del juego.

Controles

A / Izquierda → Mover a la izquierda.

D / Derecha → Mover a la derecha.

Espacio → Saltar.

Requisitos

Godot Engine 4.x

Sistema operativo: Windows, Mac o Linux.

Cómo ejecutar

Abrir Godot 4 y cargar el proyecto.

Abrir Main.tscn.

Presionar Play (F5) para ejecutar el juego.

Notas adicionales

Los enemigos usan un Area2D encima de su cabeza para detectar cuando el jugador cae sobre ellos.

Las colisiones laterales reinician la escena para simular daño al jugador.

El proyecto puede expandirse agregando más niveles, animaciones y sonidos.
