# README

* This README for Kajabi Project

This project has been developed Ruby on Rails and VueJS.

Summary, We have an API that get the some informations about users.
I am getting this data from this API and using.

There are 2 different screen to show the data.
  * index.html.erb (Calling VueJS)
  * show.html.erb (Rails Views)
  
On the index.html.erb is calling VueJS component to show that coming data in the list.
This list has 2 features to paginate the data and search by email.

If you want to see more details about this features, you can go to related files on the project.

When I search by email in the data, I am checking all pages. Because the data is coming as paginate.
That's why I am checking all.
And when I search by email, I am checking the word lenght to increase the project performance.

For the views screens, I developed both screens as an example. Rails views and VueJS. 
