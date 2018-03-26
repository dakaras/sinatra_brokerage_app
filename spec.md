Specifications for the Sinatra Assessment

Specs:

    Use Sinatra to build the app

    Use ActiveRecord for storing information in a database

    Include more than one model class (list of model class names e.g. User, Post, Category) --> Models: User class, Account class, Stock class.

    Include at least one has_many relationship (x has_many y e.g. User has_many Posts) --> A user has_many accounts. An account has_many stocks and belongs_to a user. A stock belongs_to an account.

    Include user accounts

    Ensure that users can't modify content created by other users --> Helper methods (logged_in? and current_user) created in ApplicationController ensure only the user who created the account can modify it.

    Ensure that the belongs_to resource has routes for Creating, Reading, Updating and Destroying --> AccountsController includes routes for CRUD.

    Include user input validations --> User class validates_presence_of username, email and password and validates that username is unique.

    Display validation failures to user with error message (example form URL e.g. /posts/new) --> Validation failures displayed via errors method for post '/signup' in UsersController (line 31), post 'dogs/new' (line 38) and patch 'dogs/:id' (line 79) in AccountsController. Manual error messages entered in numerous places in both UsersController and DogsController. flash[:message] conditional contained in layout to avoid repetition.

    Your README.md includes a short description, install instructions, a contributors guide and a link to the license for your code

Confirm

    You have a large number of small Git commits
    Your commit messages are meaningful
    You made the changes in a commit that relate to the commit message
    You don't include changes in a commit that aren't related to the commit message
