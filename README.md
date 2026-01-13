# TP DevOps – Docker & CI/CD

## Présentation du projet
Ce projet a été réalisé dans le cadre du TP DevOps dont l’objectif est de
conteneuriser une application web simple et de mettre en place un pipeline
CI/CD automatisé avec GitHub Actions.

L’application est servie par Nginx et déployée sous forme d’image Docker,
automatiquement buildée et publiée sur GitHub Container Registry (GHCR).

---

## Objectifs du TP
- Créer une application web simple (HTML / CSS / JavaScript)
- Conteneuriser l’application avec Docker
- Configurer un serveur Nginx
- Mettre en place un pipeline CI/CD avec GitHub Actions
- Publier automatiquement une image Docker sur GHCR
- Gérer le versioning des images

---

## Technologies utilisées
- Docker
- Nginx
- GitHub Actions
- GitHub Container Registry
- HTML / CSS / JavaScript

---


---

## Pipeline CI/CD
Un workflow GitHub Actions est déclenché automatiquement :
- à chaque push sur la branche `main`
- lors de la création d’un tag de version (`v*`)

Le pipeline réalise les actions suivantes :
1. Récupération du code source
2. Build de l’image Docker
3. Génération automatique des tags
4. Publication de l’image sur GitHub Container Registry

---

## Image Docker
L’image Docker générée est disponible sur GitHub Container Registry :

ghcr.io/raayzone/devops-tp-docker-rayan


Chaque image est automatiquement versionnée selon le contexte du build
(branche, commit ou tag Git).

---

## Utilisation de l’image Docker

Une fois Docker installé sur une machine, l’image peut être utilisée avec
les commandes suivantes :

docker pull ghcr.io/raayzone/devops-tp-docker-rayan:main
docker run -d -p 8080:80 ghcr.io/raayzone/devops-tp-docker-rayan:main


L’application est ensuite accessible via :

http://localhost:8080

## Versioning

Le projet supporte le versioning via des tags Git.
La création d’un tag de type v1.0.0 déclenche automatiquement un nouveau
build et la publication des images correspondantes sur GHCR.

## Limitation d’environnement

L’installation de Docker Desktop et de WSL2 n’a pas été possible sur la
machine locale en raison de restrictions système (droits et composants
Windows bloqués). 

Cependant, l’ensemble du pipeline CI/CD a été validé via GitHub Actions
et l’image Docker est bien buildée et publiée sur GitHub Container Registry,
ce qui permet de garantir le bon fonctionnement du projet.

![Build and Scan](https://github.com/RaayzOne/devops-tp-docker-rayan/actions/workflows/docker-deploy.yml/badge.svg)
![CodeQL](https://github.com/RaayzOne/devops-tp-docker-rayan/actions/workflows/codeql-analysis.yml/badge.svg)

