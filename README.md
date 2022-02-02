Cette repo contient des Vagrantfile prêt pour faciliter le déploiement de VM pour plusieurs architectures de processeurs nottament pour les Mac M1.

# Installation de VMware pour Vagrant

On part ici du principe que Vagrant est déjà installé sur votre machine.

## Mac & Windows

### Installation du plugin VMware desktop

Dans un terminal ou un invite Powershell, nous allons installer le plugin vmware desktop avec la commande suivante :
```console
$ vagrant plugin install vagrant-vmware-desktop
```
Le plugin est installé.

Si vous avez une ancienne version du plugin vous pouvez le mettre à jour avec la commande :

```console
$ vagrant plugin update vagrant-vmware-desktop
```
### Instalation de VMware Utility

Malgré l'installation du plugin, il faut aussi installer l'utilitaire qui permettra de mettre en relation Vagrant et vmware. Pour cela il faut [télécharger le binaire d'installation sur le site de Vagrant](https://www.vagrantup.com/vmware/downloads). Il suffit de dérouler l'installation.

Tous les modules sont à présent installés et vous pouvez avec une image du Vagrant Cloud déployer vos VMs avec Vagrant.

## Troubleshooting 

### VMware Fusion Tech Preview (Mac M1)

Avec la version 1.0.21 du VMware Utility il est possible que lorsque vous essayez de faire un ``vagrant up`` une erreur apparaisse :

```console
Vagrant encountered an unexpected communications error with the Vagrant VMware Utility driver. Please try to run the command again. If this error persists, please contact support@hashicorp.com
```
Après consultation des logs se situant dans le répertoire ``/Library/Application Support/vagrant-vmware-utility/service.log`` il s'avère que l'utilitaire ne trouve pas VMware Fusion. La raison est que l'utilitaire cherche l'application dans ``/Applications/VMware\ Fusion.app`` alors que la Tech Preview se trouve dans ``/Applications/VMware\ Fusion\ Tech\ Preview.app``. La solution est de créer un lien symbolique là où Vagrant va chercher Fusion pour qu'il puisse l'atteindre à son réel emplacement :

```console
sudo ln -s /Applications/VMware\ Fusion\ Tech\ Preview.app /Applications/VMware\ Fusion.app
```
