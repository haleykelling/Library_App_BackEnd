# Social Reader
A web app created to browse, save, and share your favorite books!


## Table of Contents
* [General Info](#general-info)
* [Inspiration](#inspiration)
* [Demonstration Video](#demonstration-video)
* [Technologies](#technologies)
* [Setup](#setup)
* [Example Code](#example-code)
* [Features](#features)
* [Status](#status)
* [Contact](#contact)
* [License](#license)


## General Info
Social Reader was designed using Google Books API to help you find your next book to read. You can also store books you want to read or have read in your own library, and see what your friends are reading.

## Inspiration 
I was inspired by my love for reading. In addition to wanting an easy way to keep track of my personal library, I also wanted to create an app that lets you get reading inspiration from your friends. 

## Demonstration Video
[Social Reader Youtube Demonstation]()

## Technologies 
* Ruby - version 2.6.1
* Rails - version 6.0.3, >= 6.0.3.1
* SQLite3
* HTML5
* CSS3 
* Javascript - version 1.8.5

Gems:
* Bcrypt - version 3.1.13
* Excon - version 0.74.0
* Fast JSON API - version 1.5
* Figaro - version 1.2.0
* JWT - version 2.2.1


## Setup 
To get Social Reader installed and running clone the backend Github Repository into your directory and bundle install:
```ruby
bundle install
```
After that make sure to migrate and seed your database:
```ruby
rails db:create
rails db:migrate
```
To get the backend server running execute:
```ruby
rails s
```
You will also need to clone the [frontend Github Repository](https://github.com/haleykelling/Library_App_FrontEnd) into your directory and run the following command to launch the website:
```ruby
lite-server
```
You can create a new user on the sign in page and enjoy the app!

## Example Code
```ruby
    
```

## Features
Current Features:
* Create a user and log in using bcrypt and jwt
* Browse and search books using live integration with Google Books API 
* Save books to your bookshelves (To Read, Reading, Previously Read)
* Move books to different personal bookshelves or delete from your library
* View a friend's library and add to your bookshelves from their library

Future Features:
* Add more advanced search queries to find books
* Link to source to purchase book
* Add user-specific book recommendations
* Using OAuth, integrate with Facebook to see your friends

## Status
The application is fully functional and ready to be enjoyed at current status. Currently friendships must be manually created in database. Future updates and improvements are still a possibility for future renditions.

## Contact
Created by [Haley Kelling](https://www.linkedin.com/in/haley-kelling/).

If you have any questions or comments feel free to reach out to me. thank you for your time!

