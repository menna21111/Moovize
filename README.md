# moovize

Moovize - Flutter Movie App This project is a comprehensive movie application called MOoviz, built using Flutter. It allows users to search for movies, view detailed information, manage a favorites list, and interact with movie ratings. The app integrates with The Movie Database (TMDb) API for movie data and showcases best practices in Flutter development, clean code architecture, and effective state management.

Project Overview

The goal of this project was to build a movie application named Netflix that provides the following features:

Discover movies and TV shows View movie details, including cast, similar movies, reviews, and categories Add movies to a favorites list, saved with local data storage Implement a search feature with recommendations while typing and display top-searched items Rate movies and manage user ratings View categorized lists such as Top-Rated Films, Popular TV Shows, and On-Air TV Shows The app utilizes the TMDb API for movie data retrieval, Bloc for state management, and follows the MVVM architecture pattern for clean and maintainable code.

Features User Interface:

Intuitive and user-friendly design Bottom navigation bar with options for Discover, Search, Favorites, and Top-Rated Movies Screens:

Discover (TV and Movies): Allows users to browse movies and TV shows. Favorites: Allows users to view their favorite movies and manage their list. Search: Users can search movies and series using the TMDb API. The app provides search suggestions and displays top-searched items. Top-Rated Movies: Displays a list of top-rated movies based on TMDb data. Movie Details:

Cast and similar movie lists Reviews and movie details User can rate movies (1-5 stars) and manage ratings (add and delete) State Management:

Bloc is used for managing app states, including search queries, API requests, movie data retrieval, and managing the favorites list. Rating Feature:

Users can add, view, and delete ratings for each movie. The app displays the user's rating on the movie details screen. Error Handling:

User-friendly error messages for issues like API errors or no search results found. User Experience:

Smooth animations and transitions for a polished experience Responsive design suitable for both mobile and tablet devices Technical Overview Architecture:

The project follows the MVVM (Model-View-ViewModel) architecture, ensuring a clean and organized codebase. State Management:

Bloc is used for handling and maintaining app states, which provides consistency across the app. API Integration:

Integrated with The Movie Database (TMDb) API to fetch and display movie data. Dio is used to handle HTTP requests to the API. Local Data Storage:

Favorites are stored locally, allowing users to retain their favorite movies across app sessions. 
Clean Code and Best Practices:

The project emphasizes clean, well-documented code with a clear separation of concerns, making the codebase highly maintainable and scalable. Installation and Setup Clone the repository:

bash

git clone https://github.com/yourusername/netflix-flutter-app.git cd netflix-flutter-app Install dependencies:

bash

flutter pub get Create an account with TMDb and obtain an API key. Add this key to your app in a secure manner.

Run the application:

bash نسخ الكود flutter run Requirements Flutter SDK: 3.0.0 or higher Dart SDK: 2.17.0 or higher Dio: For handling HTTP requests Bloc: For state management Android/iOS SDK: To run the application on mobile devices Conclusion This project demonstrates proficiency in Flutter development, API integration, and state management using Bloc, as well as clean code practices. The app provides a rich user experience, fetching data from TMDb and allowing users to interact with movie information seamlessly.
