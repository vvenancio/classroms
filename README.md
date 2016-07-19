# Classroom #

The world needs IT. 
Every school must use computer systems to manage their students, courses and classrooms. 

So I decided to develop a system wich will allow anyone, to manage those resources.

### Usage ###
---

clone or fork the project
```
git clone git@github.com:vvenancio/classroms.git
```

create a `database.yml` file

```
cp database.yml ./database.yml.sample
```

- now you can configure your database settings in `database.yml`

create database and its tables

```
rake db:create db:migrate
```

start the server

```
rails s
```

### Requirements ###
---

```
Ruby 2+, Rails 4+
```

### Who do I talk to? ###
---

* Send an email *to vinicius.venancio@live.com*



Enjoy and contribute