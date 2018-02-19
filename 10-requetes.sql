--REQUETES SQL POUR LA START UP EXPRESS FOOD


-- RECHERCHER LA LISTE DES CLIENTS 

SELECT * FROM utilisateur WHERE role='client'

--AFFICHER LES PLATS ET DESSERTS EN FONCTION DES JOURS

SELECT * FROM menu WHERE date= '2018-01-04'


--AFFICHER LES DIFFERENTS PLATS ET DESSERTS

SELECT id, nom, prix FROM produit


-- AFFICHER LISTE DES LIVREURS EN LIVRAISON

SELECT * FROM livreur WHERE statut= 'en livraison'


-- RECHERCHER LA LISTE DES COMMANDES PASSEES

SELECT id,utilisateur_id,adresse_id,prix_total,date_paiement FROM commande WHERE statut_livraison = 'Terminée'






--AFFICHER LES ADRESSES POUR UN CLIENT

SELECT * FROM adresse WHERE utilisateur_id=10









-- AFFICHER LISTE DES LIVREURS LIBRE

SELECT * FROM livreur WHERE statut= 'libre'


--MODIFIER LE STATUT D'UNE LIVRAISON EN COURS EN LIVRAISON TERMINÉE PAR LE LIVREUR

UPDATE COMMANDE SET statut_livraison = 'En cours' WHERE id =4;

--MODIFIER STATUT DU LIVREUR

UPDATE livreur SET statut = 'Libre' WHERE id=3;














--CREATION D'UNE COMMANDE

INSERT INTO commande
(date_ajout, statut_livraison, statut_paiement, date_paiement, prix_total, ref_commande, livreur_id,adresse_id, utilisateur_id)
VALUES
(CURRENT_DATE,
	'En cours',
	'Terminé',
	2017-12-18,
	52.50,
	'ref2017-07',
	2,
	6,
	5);


--SUPPRIMER UNE COMMANDE

DELETE FROM commande WHERE id =9;