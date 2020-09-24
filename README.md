# Take Your Pic

A photo sharing app for polaroid lovers. Take your pic and add it to the gallery for all to see! Created using a React JavaScript frontend and a Ruby on Rails backend.

A user can signup or login, take a picture of themselves and watch it develop through a CSS animation. They can then decide whether to retake or save their digital polaroid to the gallery. 

* Lazy Loading implemented to efficiently load only images in view. 
* Utilized JSON Web Tokens and localStorage to store encrypted user information client-side, providing user authentication.
* Developed a Rails API backend with endpoints for users and polaroids.
* Image upload functionality applied using activestorage.

## Prerequisites

Make sure you have installed:

* Ruby, version 2.6.1 or newer
* Postgres
* Rails, version 6.0.3 or newer

You can check in the terminal:

```bash
ruby -v
rails -v
postgres -v
```

This should output some information on the installed versions. If not, you can refer to the [Ruby](https://www.ruby-lang.org/en/documentation/installation/ "Ruby"), [Postgres](https://www.postgresql.org/ "Postgres") and [Rails](https://guides.rubyonrails.org/v5.0/getting_started.html "Rails") documentation.

For the frontend repository of this app see https://github.com/louisenorris/Take_Your_Pic_frontend

## Getting started

Fork and clone this repository and the [frontend repository](https://github.com/louisenorris/Take_Your_Pic_frontend "frontend repository"). Start Postgres.

## Installation

### Backend

On a terminal window, move into the backend directory of this project. Use the gem manager [bundler](https://bundler.io/ "bundler") to install all dependencies. Create, migrate and seed the database. Start the Rails server. To do all this, run these commands, one at a time.

```bash
bundle install
rails db:create
rails db:migrate
rails db:seed
rails start
```

### Frontend

On a new terminal tab, navigate to the frontend directory inside the root directory of the project. Use the package manager [npm](https://www.npmjs.com/ "npm") to install all dependencies.

`npm install`

Start the server on port 3001.

`npm start`

Visit localhost:3001.

**You're all set! Go ahead and take your pic!**