# Vagrantfile Minikube arm64

Cette VM est basé sur une image arm64 de Fedora 35 Server.

Elle installe :
- Docker
- Kubernetes (kubectl)
- Minikube
- Helm
- Toutes les dépendances nécessaires

Le script intégré au vagrant file va désactiver les systèmes de firewalling de Fedora (firewalld & SELinux)

Pour ajouter l'auto-completion des commandes Kubernetes il est necessaire de taper les commandes suivantes :
```console
$ source <(kubectl completion bash)
$ echo "source <(kubectl completion bash)" >> ~/.bashrc
```