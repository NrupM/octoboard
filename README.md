# OctoBoard: Your Job Search Organizer!


OctoBoard is a personal organizational tool for job seekers which stores information on job applications, upcoming interviews, follow-up dates, and job preparedness aspects such as interview questions and responses. I decided to build this app because it solves an issue that many people face when trying to organize job search process details while encouraging better preparation and practices.

## Login Page

<img src="http://i.imgur.com/uM7hRg0.png">

## Dashboard View

Includes an algorithm for finding your "Octopower," analytics on job applications and interviews, reminders for important upcoming dates, a way to keep track of your goals, a quick search for when a recruiter's call may catch you off-guard, and more.

<img src="http://i.imgur.com/PAsnVam.png">

## Show Page for a Job Application

This page features cool collapsible containers to better sort the small details, encourages you to provide more information to better organize yourself, and provides any details and rerouting you may need while on the page.

<img src="http://i.imgur.com/XsfvOjw.png">

## And It's Mobile-Friendly!

<img src="http://i.imgur.com/kxvzQqH.png">


### Installation Steps to preview locally:

1. Clone this repo locally & cd into it
2. Run `bundle`
3. Run `rails db:setup` in the command line
4. Run `rails s` to start up the server
5. Check it out on localhost:3000!
6. If you are checking it out on [Heroku](https://octoboard.herokuapp.com/), you can make a new account or use this fake account:
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

Original wireframes were built with a black background. I am still contemplating using a black background, but I would also like the user to have a choice in case their eyes would prefer a brighter screen. So maybe a day or night switch?? <img src="https://s-media-cache-ak0.pinimg.com/736x/3b/24/8c/3b248c5238bed99de0362f56b66dde8f.jpg" width="30px">

<img src="http://i.imgur.com/vbA26SI.png">

## ERD

<img src="http://i.imgur.com/r8tfk28.png">
The user can log their job applications, upcoming interviews, practice interview questions and answer, and daily, weekly, & longterm goals. Later on I will include another table and join table to allow users to practice pre-set questions that is shared among all users.

## Tricky code

This is how one's Octopower is calculated:

	if @goal
      apps_per_day_goal = @goal.applications_per_day
    else
      apps_per_day_goal = 1
    end
    if @applications.count > 0
      @apps_applied_today = @applications.where({date_applied: Date.today}).count
      num_apps = @applications.count
    else
      @apps_applied_today = 0
      num_apps = 0
    end
    if apps_per_day_goal
      @goal_hitting_rate = @apps_applied_today.to_f/apps_per_day_goal*100
    end
    num_interviews = @interviews.count
    if @interviews.count > 0
      completed_challenges = @interviews.where({is_challenge_completed: true}).count
      nil_preparedness = @interviews.where({questions_to_ask: '' || ' '}).count
      int_preparedness = num_interviews - nil_preparedness
      nil_thankyou = @interviews.where({thankyou_letter: '' || ' '}).count
      num_thankyous = num_interviews - nil_thankyou
      @inperson_ints = @interviews.where({interview_type: "in_person"}).count
      @online_ints = @interviews.where({interview_type: "online"}).count
      @phone_ints = @interviews.where({interview_type: "phone"}).count
    else
      num_thankyous = 0
      int_preparedness = 0
      @inperson_ints = 0
      @online_ints = 0
      @phone_ints = 0
    end
    if @questions.count > 0
      nilquestions = @questions.where({answer: nil || '' || ' ' }).count
      questions = @questions.count
      answered = questions - nilquestions
    else
      answered = 0
    end

    thankyous = num_thankyous * 3
    preparedness = int_preparedness * 2
    answered_questions = answered * 2
    interviews = num_interviews * 5
    per_day_goal = meet_per_day_goal(apps_per_day_goal, @apps_applied_today)
    inperson = @inperson_ints * 10

    @octopower = (@octopower + thankyous + preparedness + answered_questions + interviews + per_day_goal + inperson)

    if @octopower > 95 && @user.job_status == 'seeking'
      @octopower == 95
    else
      @octopower == 100
    end


I had a good time figuring this one out. This was the first time I had worked with numbers in the back end to try and display stats in the front end, and it was a lot more difficult than I anticipated. I realized by the end that the details I have to work with using the current database structure are very limiting and can only lead me to an arbitrary number for "Octopower." Octopower is meant to be someone's overall job preparedness level and likelihood of getting a job. Regardless, I think that the number's work out such that if a person did finally reach near 100%, they would likely be employed (or pretty close). However, if this app ever blew up, many of the stats would need to be more scientifically refactored.


## Future Features

1. A user will be able to extract application, interview, and question details to a PDF to save elsewhere or print.
2.  A user will be able to extract dates from application and interview models to Google Calendar.
3. A user will see an "algorithm of the day" on their dashboard scraped from an algorithm site.
4. A user will be able to answer pre-populated questions coming from example questions model and join-table for solutions.
5. Upload files for resume + profile photo and save externally with S3

## Links

- [Trello](https://trello.com/b/0vrCtVFi/octoboard)
- [Heroku](https://octoboard.herokuapp.com/)
