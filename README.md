# VERSIONNING
Outils diverses au versionning
Création de différents outils aidant à la gestion de version des sources sur IBM i suivant la procédure suivante:
1)Création d'un lot avec la commande CRTLOT(Crée une bibliothèque où développer.
2)Création d'un REPOSITORY sur serveur GIT
3)Clonage du REPOSITORY en local avec RDI
4)Création d'un projet i avec comme paramètre:Chemin du projet = chemin du REPOSITORY local et Bibliothèque associée = Bibliothèque du lot

ADDLIBLOT met en ligne une bibliothèque de lot où sont développées les nouvelles fonctions
RMVLIBLOT enlève la bibliothèque d'un lot 
