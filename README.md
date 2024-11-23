# Treegram App

Welcome to "Treegram App", a social media platform where users can share photos, interact through comments, and build connections by following other users. This application is built using Ruby on Rails and provides essential features for a photo-sharing platform. This project was implemented during the seventh semester, in the course MYE042 of the curriculum of the University of Ioannina. The final grade of the project is 110 out of 100.


## Project Overview
Treegram is a simplified social network designed as part of an educational assignment to implement essential functionalities such as photo uploads, comments, following/unfollowing users, and user management.



## Key Features
- Photo Management: Users can upload photos, assign titles, and manage their own content.
- Comments System: Users can add, view, and delete comments on photos, with appropriate permissions for managing comments.
- Follow/Unfollow Feature: Users can follow other users and view their photos in their feed.
- User Authentication: Secure user signup, login, and session management.
- Photo Deletion: Users can delete their own photos along with all related comments and tags.


## Assignment Instructions
The project was implemented in stages as per the assignment requirements:

**Stage 1: Add Titles to Photos**
- Extend the `Photo` model to include a `title` attribute.
- Update the database to support titles using migrations.
- Modify the photo upload form to include a field for the title and display it under each photo.

**Stage 2: Follow/Unfollow Users**
- Create a `Follow` model and corresponding database table to manage user relationships.
- Implement the ability for users to follow/unfollow others.
- Modify the user's feed to display photos of the user and their followed users, sorted by upload time.

**Stage 3: Comments System**
- Create a `Comment` model and table to allow users to comment on photos.
- Implement permissions: Users can delete their own comments or comments on their own photos.
- Add a form next to each photo for adding comments and display comments below each photo.

**Bonus Stage: Photo Deletion**
- Add a feature to allow users to delete their photos along with all related comments and tags.
- Display a "Delete Photo" button next to each photo if the user owns it.


## Implementation Details
**Technologies Used**
- Backend Framework: Ruby on Rails
- Database SQLite3 (development) and ActiveRecord for migrations and queries
- Frontend: HTML and HAML templates for dynamic rendering
- Authentication: Custom user authentication system with secure password storage


## Project Structure
- **Models:**
  `User`: Manages user data and relationships.
  `Photo`: Represents photos uploaded by users, with validations for titles and dependencies on comments and tags.
  `Comment`: Handles user comments on photos with proper associations.
  `Follow`: Defines follower-followed relationships between users.
- **Controllers:**
  `UsersController`: Manages user profiles, follows/unfollows, and feeds.
  `PhotosController`: Handles photo uploads, viewing, and deletion.
  `CommentsController`: Manages adding and deleting comments.
- **Views:** Dynamic views for user profiles, photo feeds, and interactions.


## How to Run the Application
- **Ruby:** Ensure you have Ruby installed (version 2.6.6 or higher).
- **Rails:** Install Rails framework.
- **Database Setup:** SQLite3 for development.


## Steps to Run
- Clone the Repository:
  ```bash
     git clone https://github.com/ChristosGkovaris/Treegram-App.git
     cd Treegram-App


## Collaboration
This project was a collaborative effort. Special thanks to [SpanouMaria](https://github.com/SpanouMaria), for the significant contributions to the development and improvement of the application.
