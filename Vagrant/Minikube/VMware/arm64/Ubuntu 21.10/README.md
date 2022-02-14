# Vagrantfile Minikube arm64

Cette VM est basé sur une image arm64 d'Ubuntu Server 21.10.

Elle installe :
- Docker
- Kubernetes (kubectl)
- Minikube
- Helm
- Toutes les dépendances nécessaires

Pour ajouter l'auto-completion des commandes Kubernetes il est necessaire de taper les commandes suivantes :
```console
$ source <(kubectl completion bash)
$ echo "source <(kubectl completion bash)" >> ~/.bashrc
```