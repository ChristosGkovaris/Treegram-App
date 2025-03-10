# Treegram App
Welcome to "Treegram App" repository. This repository contains a social media platform where users can share photos, interact through comments, and build connections
by following other users. This application is built using Ruby on Rails and provides essential features for a photo-sharing platform, including advanced functionality
such as user following, commenting, and photo management. Additionally, it incorporates a Slide Show Feature that allows users to view photos in a dynamic, sequential
manner, enhancing the user experience with seamless transitions and intuitive navigation. This project was implemented during the seventh semester, in the course
MYE042 of the curriculum of the University of Ioannina. The final grade of the first project (advanced photo sharing features) is X out of 100 and the final grade
of the second project (slide show feature) is X out of 100.



## Overview
Treegram is a streamlined social networking application developed as part of an educational assignment, showcasing core functionalities such as photo uploads,
user comments, following and unfollowing users, and comprehensive user management. Additionally, it incorporates advanced features like a Slide Show Mode,
enabling dynamic and interactive viewing of photos, further enriching the user experience with intuitive navigation and seamless transitions.



## Key Features
- Photo Management: Users can upload photos, assign titles, and manage their own content.
- Comments System: Users can add, view, and delete comments on photos, with appropriate permissions for managing comments.
- Follow/Unfollow Feature: Users can follow other users and view their photos in their feed.
- User Authentication: Secure user signup, login, and session management.
- Photo Deletion: Users can delete their own photos along with all related comments and tags.



## Instructions
The project was implemented in stages as per the assignment requirements:
- Extend the `Photo` model to include a `title` attribute.
- Update the database to support titles using migrations.
- Modify the photo upload form to include a field for the title and display it under each photo.
- Create a `Follow` model and corresponding database table to manage user relationships.
- Implement the ability for users to follow/unfollow others.
- Modify the user's feed to display photos of the user and their followed users, sorted by upload time.
- Create a `Comment` model and table to allow users to comment on photos.
- Implement permissions: Users can delete their own comments or comments on their own photos.
- Add a form next to each photo for adding comments and display comments below each photo.
- Add a feature to allow users to delete their photos along with all related comments and tags.
- Display a "Delete Photo" button next to each photo if the user owns it.



## Implementation Details
- Backend Framework: Ruby on Rails
- Database SQLite3 (development) and ActiveRecord for migrations and queries
- Frontend: HTML and HAML templates for dynamic rendering
- Authentication: Custom user authentication system with secure password storage



## Collaboration
This project was a collaborative effort. Special thanks to [SpanouMaria](https://github.com/SpanouMaria), for the significant contributions to the development and improvement of the application.
