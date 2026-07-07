Date de début: le 07 Juillet 2026
📊 État actuel du backend

✅ Étape 1 : Connexion MySQL

✅ Étape 2 : Lire questionnaire

✅ Étape 3 : Lire questions

✅ Étape 4 : Lire propositions

✅ Étape 5 : Créer un test utilisateur

✅ Étape 6 : Enregister les réponses des utilisateurs

➡️ Étape 7 : Calcul automatique des scores RIASEC




NB: Les repository: Donne-moi les réponses.
    Les services: Compte les scores.
                  Trouve le profil.
                  Retourne IA.


          Vu d'ensemble de l'algorithme:

                UTILISATEUR
                      │
                      ▼
         Commence un test RIASEC
                      │
                      ▼
        Création d'un test (id_test)
                      │
                      ▼
      Répond aux 20 questions
                      │
                      ▼
 Enregistrement des 20 réponses
                      │
                      ▼
     Calcul automatique des scores
                      │
                      ▼
      Détermination du profil
                      │
                      ▼
     Recherche des métiers compatibles
                      │
                      ▼
    Recherche des filières associées
                      │
                      ▼
Recherche des universités correspondantes
                      │
                      ▼
        Affichage du résultat final



        Pseudo-code complet de l'algorithme
Début

Créer un tableau Scores

R ← 0
I ← 0
A ← 0
S ← 0
E ← 0
C ← 0

scores = {
    R : 0,
    I : 0,
    A : 0,
    S : 0,
    E : 0,
    C : 0
}

Pour chaque réponse

    type = type_riasec de la proposition

    scores[type] = scores[type] + 1

Fin Pour

Créer un tableau contenant

R = score_R

I = score_I

A = score_A

S = score_S

E = score_E

C = score_C


Trier le tableau du plus grand score au plus petit


profil_principal =
les deux premiers types


profil_complet =
les six types triés


Mettre à jour test_riasec

score_R

score_I

score_A

score_S

score_E

score_C

profil_dominant


Retourner le profil


Fin