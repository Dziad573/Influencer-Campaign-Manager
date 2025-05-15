# 📊 Platforma Zarządzania Relacjami z Influencerami (w trakcie produkcji)

## Opis projektu

Projekt polega na stworzeniu relacyjnej bazy danych oraz aplikacji webowej wspierającej zarządzanie współpracami z influencerami.  
System wykorzystuje:
- **MySQL** – relacyjna baza danych,
- **Node.js + Express** – backend udostępniający REST API,
- **React** – frontendowa aplikacja.

Platforma umożliwia firmom i agencjom marketingowym monitorowanie kampanii, wypłat wynagrodzeń oraz analizowanie efektów działań reklamowych w nowoczesnym, responsywnym interfejsie.

## Funkcjonalności

- Rejestracja i edycja danych influencerów (dane kontaktowe, platformy, statystyki).
- Tworzenie kampanii marketingowych z budżetem, celami i terminami.  
- Przypisywanie influencerów do kampanii z ustalonymi stawkami i statusem współpracy.  
- Wprowadzanie danych o efektach kampanii (wyświetlenia, kliknięcia, konwersje).  
- Rozliczanie wypłat i śledzenie statusu płatności.  
- Generowanie raportów i zestawień.
- Logowanie - inny widok dla każdej grupy użytkowników  
- Panel administratora z podziałem na role (admin, manager, influencer, viewer).

## Struktura bazy danych (główne tabele)

- `influencers` – dane o influencerach.  
- `campaigns` – dane o kampaniach.  
- `campaign_influencers` – tabela łącząca influencerów z kampaniami.  
- `campaign_effects` – efekty kampanii przypisane do influencerów.  
- `payments` – dane o wypłaconych wynagrodzeniach.  
- `users` – użytkownicy systemu (role i dane logowania).

## Technologie

- **Node.js** + **Express** – serwer, API REST.  
- **React** – frontend.  
- **MySQL** – silnik bazy danych.

## Uruchomienie projektu

1. **Baza danych**  
   - Zainstaluj XAMPP i uruchom MySQL (Apache opcjonalnie)  
   - Otwórz phpMyAdmin (http://localhost/phpmyadmin)  
   - Utwórz bazę danych: influencer_campaign_manager_db  
   - Zaimportuj pliki SQL z folderu sql


2. **Backend**  
   - Przejdź do katalogu `backend`  
   - Zainstaluj zależności: `npm install`  
   - Uruchom serwer: `node index.js` (domyślnie na `http://localhost:3001`)  

3. **Frontend**  
   - Przejdź do katalogu `frontend`  
   - Zainstaluj zależności: `npm install`  
   - Uruchom dev server: `npm start` (domyślnie na `http://localhost:3000`)
  
## REST API – dostępne endpointy

| Metoda      | Endpoint            | Opis       |
| -------------- | -------------------- | --------------- |
| POST    | /login          | Logowanie (email, password_hash)     |
| GET   | /users | Lista użytkowników |
| GET   | /users/:id | Pobierz dane użytkownika po ID |
| GET   | /influencers | Lista influencerów |
| GET   | /influencers/count  | Całkowita liczba influencerów |
| GET   | /campaigns  | Lista kampanii |
| GET   | /campaigns/count | Całkowita liczba kampanii |
| GET   | /campaigns/top_campaigns | Top 3 kampanie wg wyświetleń |
| GET   | /campaigns/upcoming_campaigns | Nadchodzące kampanie |
| GET   | /campaign_influencers | Lista przypisań influencerów do kampanii|
| GET   | /campaign_effects | Lista efektów kampanii |
| GET   | /campaign_effects/likes/total | Łączna liczba polubień |
| GET   | /payments  | Lista wypłat |

## W repozytorium znajdują się:

- pliki SQL z definicją i przykładowymi danymi,  
- kod backendu (Express) i frontendowej aplikacji (React),  
- dokumentacja i instrukcja uruchomienia.

## Cel projektu

Projekt został zrealizowany na zaliczenie przedmiotu **Bazy danych** na studiach informatycznych.  
Celem było praktyczne zastosowanie: projektowania relacyjnej bazy danych, implementacji REST API oraz budowy interaktywnej aplikacji webowej.
