Lors du challenge https://www.hacktaferme.fr/ du 03/12/21, l'équipe 'IFECHO' a proposé un outil de suivi du stress thermique subi par les animaux d'élevage et en l'occurrence les bovins
Ce repo contient la partie back de l'application proposée 

# Versions Ruby & Rails
ruby 2.7.4p191
Rails 6.1.4.1

# Enjeu métier
Les animaux d'élevage sont impactés, au même titre que les humains, par les périodes de températures élevées et en particulier quand la température nocturne ne descend pas assez pour se rafraîchir. Les impacts sur la production peuvent être très significatifs
L'application s'est donnée comme objectif de permettre à un utilisateur donné, soit un exploitant agricole, soit son conseiller, de suivre deux indicateurs le Thermal Humidity Index (THI) ainsi que la Charge Thermique (CT). Le THI est un agrégat qui donne une mesure de l'humidity et de la température à un instant donné. La CT, prend en compte l'évolution de la température sur la durée et notamment la présence ou l'absence de période de rafraîchissement.
Le THI et CT dépendent du lieu dans lequel les mesures sont prises. Se dessine alors pour l'éleveur une possibilité de mettre en place une statégie d'adaptation aux périodes de chaleur intense, appelées à se renouveler
L'application permet de suivre l'évolution de ces deux indicateurs sur une période de -5j (historique) à +5j (prévisions), avec la possibilité de revenir aussi loin que possible dans l'historique

# Choix techniques
* structuration de la base avec table de jointure et utilisation des class_name pour nommer correctement les rôles.
* Il y a 2 types d’utilisateurs : fermier (breeder) et conseiller (advisor). C’est géré uniquement via les relations dans la base. Est advisor celui dont User.find(y).advised_sites n’est pas vide et breeder celui dont User.find(z).sites  n’est pas null. Mais bien, sûr il n’y a qu’une table users et une table sites. On peut donc être breeder et advisor en même temps sans qu’il y ait de conflit.
Les sites n’ont pas nécessairement de breeder ou d’advisor car il peut s’agir de sites météos => on a mis en place un enum nommé site_type qui gère les différents statuts d’un site : enum site_type: { production: 0, meteo: 1 }  dans le model site.rb
mise en place d’un namespace pour gérer différemment les rôles d’un fermier et d’un Advisor , via des contrôleurs dédiés
mise en place de services pour aller chercher la donnée en base et la rendre sous un forma JSON et décharger au maximum les contrôleurs.
Si tu veux je peux te passer le repo du front mais je n’ai pas beaucoup travaillé dessus.
https://github.com/justmanovic/IFECHO-API
