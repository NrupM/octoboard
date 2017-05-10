# <img src="https://s-media-cache-ak0.pinimg.com/originals/94/a0/b6/94a0b65dcdf1572558ac1329c193e108.png" width="60px"> OctoBoard


OctoBoard is a personal organizational tool for job seekers which stores information on job applications, upcoming interviews, follow-up dates, and job preparedness aspects such as interview questions/responses. I decided to build this app because it solves an issue that many of my peers face when trying to organize job search process details and it encourages better preparation and practices.

<img src="#">[homepage view coming soon]

### Installation Steps to preview locally:

1. Clone this repo locally & cd into it
2. Run `bundle`
3. Run `rails db:setup` in the command line
4. Run `rails s` to start up the server
5. Check it out on localhost:3000!
6. Make a new account or use this fake account:
  - username - test@test.com
  - password - password

### Technologies:

1. Ruby
2. Rails
3. JavaScript
4. HTML5
5. CSS3
6. Gems:
  - Will Paginate
  - Chartkick
7. Materialize 

## User Stories

1. A user can sign in, log out, view and edit account information, delete account.
2. A user can log a job application, view all details, edit it, update it, and  delete it.
3. When an application moves to interview status, you can add interview details. You can view those interview details, add additional interviews (one application may have multiple interviews), edit, update, and delete.
4. A user can CRUD interview questions, add their own, edit, and delete responses.
5. A user can add a goal on their main dashboard, edit, and update it. They can have up to 4: daily, weekly, and longterm in natural language answers.
6. A user can search job applications from the search bar in the side nav based on company name or position title.
7. All functionality can be used on desktop or mobile as the app was built mobile-first.

## Wireframes

### Dashboard View
<img src="http://i.imgur.com/vbA26SI.png">

## ERD

<img src="http://i.imgur.com/r8tfk28.png">
The user can log their job applications, upcoming interviews, practice interview questions and answer, and daily, weekly, & longterm goals.

## Tricky code

Explanation of trickiness.

`this was tricky because`

## Future Features

1. A user will be able to extract application, interview, and question details to a PDF to save elsewhere or print.
2.  A user will be able to extract dates from application and interview models to Google Calendar.
3. A user will see an "algorithm of the day" on their dashboard scraped from an algorithm site.
4. A user will be able to answer pre-populated questions coming from example questions model and join-table for solutions.
5. Upload files for resume + profile photo and save externally with S3

## Links

- [Trello](https://trello.com/b/0vrCtVFi/octoboard)
- [Heroku](https://octoboard.herokuapp.com/)
