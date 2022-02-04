# Vagrantfile Minikube amd64

Cette VM est basé sur une image CentOS 7 officiel.

Elle installe :
- Docker
- Kubernetes (kubectl)
- Minikube
- Toutes les dépendances nécessaires

Pour ajouter l'auto-completion des commandes Kubernetes il est necessaire de taper les commandes suivantes :
```console
$ source <(kubectl completion bash)
$ echo "source <(kubectl completion bash)" >> ~/.bashrc
```