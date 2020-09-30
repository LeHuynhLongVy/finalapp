# NUS REVIEW CODE RESULT - 09/09/2020

### Issues from last review and their status
---------

**Issues from last review and their status to control the fixing progress. Status: Fixed or not and reason if not fixed yet**

N/A

### Issues
---------

**Issues found in this review, also assign each issue to member(s). This section include these parts:**

#### Architecture

**The issues that are related to architecture, structure and infrastructure, example:**

1. Didn't follow RESTful for resource
```
#BAD
get 'signup', to: 'home#signup'
get 'login', to: 'home#login'
get 'feed/photo', to: 'home#feed_photo'
get 'feed/album', to: 'home#feed_album'
get 'discover/photo', to: 'home#discover_photo'
get 'discover/album', to: 'home#discover_album'
get 'newest', to: 'home#newest'
get 'guestphoto', to: 'home#guest_feed_photo'
get 'guestalbum', to: 'home#guest_feed_album'
```

#### Security

**The issues that are related to security: authentication, authorization, SSL, known vulnarabilities... Example:**

1. Almost no authorization. This is BIG security issue. E.g: in products controller, **anyone** can update/delete **any product**
```
#BAD
@photo = Photo.find(params[:id])

#GOOD
@photo = current_user.photos.where(id: params[:id]).first
```

2. Sensitive information are stored in source code and pushed to Github, it is potential risk and a bad practice
```
#BAD
config.action_mailer.smtp_settings = {
    address:              'smtp.gmail.com',
    port:                 587,
    user_name:            'jeremy2151999@gmail.com',
    password:             'vy0919610316',
    authentication:       'plain',
    enable_starttls_auto: true }
```

#### Performance

**The issues that are related to performance, also include solution issues (e.g: polling instead of socket). Example:**

1. Indexes are missing, this will cause critical performance issues when data grows
```
Ex: 
follows - follower_id
follows - followed_user_id

```
2. Almost code that get an amount of records (e.g: get 20 products to show on home page) is **pull all** records in database to Ruby and get an amount of records here. It is **very bad** thing and it will **kill the server** when we have large data
```
#BAD
@photos = Photo.order('created_at DESC')

```

3. Reduce external assets (Javascript/CSS). Make use of asset compile
```
#BAD
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.10.1/jquery.min.js"></script>
<script src="https://ajax.aspnetcdn.com/ajax/jquery.validate/1.11.1/jquery.validate.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js" integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8shuf57BaghqFfPlYxofvL8/KUEfYiJOMMV+rV" crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" integrity="sha384-JcKb8q3iqJ61gNV9KGb8thSsNjpSL0n8PARn9HuZOnIxN0hoP+VmmDGMN5t9UJ0Z" crossorigin="anonymous">

```

#### Coding conventions & best practices

**Example:**

1. LOT of commented code, look very ugly and not clean
```
Ex: 
- script.js
- app/views/home/feed_album.html.erb
```

2. Almost no power of ActiveRecord was used: scope, association
```
#BAD
@photo = Photo.new(photo_params)
@photo.user_id=1
@photo = Photo.find(params[:id])
@photos = Photo.order('created_at DESC')


```
3. Gemfile should define version for each gem
```
#BAD
gem 'mini_magick'
gem "figaro"
gem "devise"
```
4. Should use HAML/SLIM instead of ERB to write less code and develop more quickly
5. I18n was not used. This is bad because it will be hard if we want to have multi-language feature in the future; using I18n also helps us manage texts better too


### Lessons learned
-------

**Lessons learned from this review code. They are mostly the summary of important issues, including how to prevent repeated issues**
