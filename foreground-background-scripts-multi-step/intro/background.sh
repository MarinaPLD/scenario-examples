#!/bin/bash

# Mise à jour des paquets, préparation de l'environnement et installation des dépendances nécessaires pour le tutoriel BunkerWeb
apt update && apt install -y curl gnupg2 ca-certificates lsb-release ubuntu-keyring >/dev/null 2>&1



