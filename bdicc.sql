-- Création de la table pour les groupes
CREATE TABLE Groupes (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nom VARCHAR(50) NOT NULL
);

-- Insertion des données dans la table des groupes
INSERT INTO Groupes (nom) VALUES
    ('Securité'),
    ('Audio Visuel'),
    ('Entretien'),
    ('Sainte Scènes'),
    ('Coordination');

-- Création de la table pour les personnes
CREATE TABLE Personnes (
    id INT PRIMARY KEY AUTO_INCREMENT,
    nom VARCHAR(50) NOT NULL,
    prenom VARCHAR(50) NOT NULL,
    profession VARCHAR(50),
    statut VARCHAR(50),
    anciennete INT,
    photo VARCHAR(255)
    -- Ajoutez d'autres colonnes pour les informations supplémentaires sur la personne si nécessaire
);

-- Création de la table de jointure pour gérer la relation plusieurs à plusieurs entre les personnes et les groupes
CREATE TABLE Appartenance (
    personne_id INT,
    groupe_id INT,
    PRIMARY KEY (personne_id, groupe_id),
    FOREIGN KEY (personne_id) REFERENCES Personnes(id),
    FOREIGN KEY (groupe_id) REFERENCES Groupes(id)
);

-- Exemple d'insertion de données pour les personnes
INSERT INTO Personnes (nom, prenom, profession, statut, anciennete, photo) VALUES
    ('Dupont', 'Jean', 'Agent de sécurité', 'Actif', 2, 'chemin/vers/photo.jpg'),
    ('Durand', 'Marie', 'Technicien audiovisuel', 'Actif', 3, 'chemin/vers/photo.jpg'),
    -- Ajoutez d'autres personnes si nécessaire
    ('Martin', 'Pierre', 'Responsable logistique', 'Inactif', 5, 'chemin/vers/photo.jpg');

-- Exemple d'insertion de données pour les relations entre personnes et groupes
INSERT INTO Appartenance (personne_id, groupe_id) VALUES
    (1, 1), -- Jean Dupont est membre du groupe Sécurité
    (1, 3), -- Jean Dupont est également membre du groupe Entretien
    (2, 2), -- Marie Durand est membre du groupe Audio Visuel
    -- Ajoutez d'autres relations si nécessaire
    (3, 5); -- Pierre Martin est membre du groupe Coordination
