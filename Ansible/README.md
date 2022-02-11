# Module Ansible

Ce dossier contient l'intégralité du répertoire de travail d'Ansible en virtualenv. Plus de détails sur la mise en place de ce dossier par la suite.

## Détails de l'infrastructure

Utilisation de l'image Vagrant Ansible Single-Machine avec Ansible dans un container LXC Ubuntu/focal/cloud

## Mise en place de l'environnement virtuel Ansible (virtualenv)

```console
$ python3 -m virtualenv ansible
```

```console
$ source ansible/bin/activate
```

```console
$ python3 -m pip install ansible
```

## Activation de l'auto-completion des commandes Ansible

```console
$ python3 -m pip install argcomplete
```

```console
$ sudo activate-global-python-argcomplete --user
```