[![Code Climate](https://codeclimate.com/github/andela-morekoya/buclist/badges/gpa.svg)](https://codeclimate.com/github/andela-morekoya/buclist)
[![Coverage Status](https://coveralls.io/repos/github/andela-morekoya/buclist/badge.svg?branch=develop)](https://coveralls.io/github/andela-morekoya/buclist?branch=develop)
[![Build Status](https://travis-ci.org/andela-morekoya/buclist.svg?branch=master)](https://travis-ci.org/andela-morekoya/buclist)

# Buclist

Buclist is a bucketlist API that lets you manage a bucket list. 
A bucket list is simply a number of experiences or achievements that a person hopes to have or accomplish during their lifetime. With Buclist, users can integrate bucketlist functionality into various devices and apps. The Buclist API is currently hosted on <a href="https://buclist.herokuapp.com">Heroku</a>.


[TOC]


###Getting Started

Our <a href="https://buclist.herokuapp.com">API Documentation</a> is the best place to get started when using our API is to use our <a href="https://buclist.herokuapp.com">API Documentation</a>. Our API documentation is highly and clearly written.
  
###External Dependencies

All our dependencies can be found in our Gemfile. To see a list of all our dependencies, just open it up. However, Ant Bucket has no other dependencies aside from gems list in the Gemfile. Our API only returns JSON so just ensure you can parse JSON from your end and send a request to our server using standard HTTP verbs. 


###Available End Points
|         End Point                               |Function           |
|-------------------------------------------------|-------------------|
|POST /users                                      |Create a new user       |
|POST /auth/login                                 |Logs in a user          |
|DELETE /auth/logout                              |Logs out a user         |
|POST /bucketlists                                |Creates a new bucket list   |
|GET /bucketlists                                 |Lists all the created bucket lists|
|GET /bucketlists/(:id)                           |Gets a single bucket list|
|PUT /bucketlists/(:id)                           |Updates this single bucket list|
|DELETE /bucketlists/(:id)                        |Deletes this single bucket list|
|GET /bucketlists/(:bucketlist_id)/items          |Get all items in bucket list|
|POST /bucketlists/(:bucketlist_id)/items         |Create a new item in bucket list|
|PUT /bucketlists/(:bucketlist_id)/items/(:id)    |Updates a bucket list item |
|DELETE /bucketlists/(:bucketlist_id)/items/(:id) |Deletes a bucket list item|


###Typical Data Model

A typical bucket list requested by a user could look like this:
````
  {
    id: 1,
    name: “My Bucket List”,
    items: [
           {
               id: 1,
               name: “Make my first api”,
               date_created: “2017-08-12 11:57:23”,
               date_modified: “2017-08-12 12:00:00”,
               done: false
             }
           ]
    date_created: “2017-08-12 11:00:00”,
    date_modified: “2017-08-12 12:00:00”
    created_by: “John”
}
````

###End Point Publicity
The only endpoints that are available to the public are

|   End Point    |
|----------------|
|POST /api/users |
|POST /auth/login|
All other endpoints require the user to be logged in.


### Pagination
Buclist comes with pagination by default, so you can specify the number of results you would like to return via a `GET` request  using the `limit` keyword.

####Example
**Request:**
````
GET https://buclist.herokuapp.com/api/v1/bucketlists?page=2&limit=20
````

**Response:**
````
20 bucket list records belonging to the logged in user starting from the 21st gets returned.
````

###Searching by Name

  Users can search for bucket list by its name using a `GET` request using the 'q' keyword.

####Example

**Request:**
 ````
  GET https://buclist.herokuapp.com/api/v1/bucketlists?q="awesome"
 ````

**Response**:

  Bucket lists with “awesome” in its name gets returned


### Versions

This API has only one version for now. However, the above listed enpoints can be accessed via -<a href="https://buclist.herokuapp.com/api/endpoint">https://buclist.herokuapp.com/api/endpoint</a>


###Testing
Testing was implemented with RSpec. Run `bundle exec rspec` in your terminal to go through the test suite

###Limitations
The app is currently limited in the following ways
 - It cannot search for items within a bucketlist
 - It has not been optimized for a large volume of users
