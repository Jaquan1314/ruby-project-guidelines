User Stories
-I want to be able to create an account
-I want to be able to sign in with my current account
-I want to be able to check my characters hp before battle
-I want my character's and the enemy's health to be updated throughout the battle
-I want to be able to delete any battles that I have lost

Domain Models
-User has many gokus, enemies, and battles
-goku has many enemies through battle and belongs to a user
-enemy has many gokus through battle and belongs to a user
-Goku has many battles
-Enemy has many battles
-Battle belongs to a user, a goku, and an enemy

1. Decription

Sign in and start battling as goku.  Don't worry if you lose, you can always delete the record of that battle! CLI and leaderboard coming soon!

2. How to play

 https://github.com/Jaquan1314/ruby-project-guidelines> Fork and clone this repo

 Open in your editor

 Run 'bundle install'

 Run 'ruby bin/run.rb'

 Have fun!

3. Written by Liam Hanafee-Areces and Javaughn Grant for Flatiron School mod1
  We would also like to give credit to all of our instructors and the rest of our cohort, without whom we would not have been able to build this.  TTY prompt has absolutely been an MVP in the process of building this app.  We are hoping to add more functionality through a leaderboard, more robust character statistics, sound effects, and various visual improvements.  We hope you enjoy the game!