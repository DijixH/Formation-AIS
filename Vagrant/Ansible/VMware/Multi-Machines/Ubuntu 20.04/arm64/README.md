# Vagrantfile Ansible arm64

Cette VM est basé sur une image arm64 d'Ubuntu Server 20.04.

Elle installe :
- Python 3 & pip
- Ansible
- LXC
- zfsutils
- Toutes les dépendances nécessaires

Pour adapter les paramètres de votre VM il suffit de changer les variables suivantes :
- RAM : v.vmx["memsize"] = Nombre de RAM en Mo
- CPU : v.vmx["numvcpus"] = Nombre de CPU

Ce Vagrantfile vous permet de déployer plusieurs VM d'un seul coup par défaut le fichier ne déploie que la VM principale. Si vous souhaitez déployer plusieurs VM pour simuler un environnement VM Maitre - VM Clientes il suffit de modifier les paramètres suivants :
- Nombres de VM clientes : clients= Nombre de VM Clientes a déployer
- RAM: ram_client= Nombre de RAM en Mo par machines clientes
- CPU: cpu_client= Nombre de CPU par machines clientes