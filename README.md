
Thank you for the opportunity to work on this coding challenge!
===============================================================

This app will consume an API of hotel deals and display them.  More specifically, it will read in JSON from http://deals.expedia.com/beta/deals/hotels.json, parse the JSON and display the hotel deals that it delivers.  It will also allow the user to search the hotel deals on various criteria.

Heroku Deployment
-----------------
http://.herokuapp.com/

How to run the app from your local sandbox
------------------------------------------
1) Have Ruby 3.2.13 or higher installed on your machine

2) Clone this repository

3) Run bundle to install the required gems

4) Run rake db:setup

5) Run rake db:test:prepare

6) Run "rails s" from the command line in the top level directory where you cloned the repository to

7) Point your browser to http://localhost:3000/

Automated Tests
---------------
I used the Rspec and Capybara specs.  To run all the tests, once you have followed steps 1-5 above, run "rake spec" from the top level directory where you cloned the repository to.

Assumptions
-----------
1) That it was not desirable to persist any of the data read in from the url.

2) That a certain, predictable, set of data would be available for running automated tests.  This may not be a valid assumption but in keeping with the suggested timeframe and simplicity, my tests were written under this assumption.

3) That it was intended that the site should only display 50 deals at a time.

Thoughts
--------
I noticed that you can only read in 50 deals at a time.

Ideas for Future Iterations
---------------------------
1) Add tests for specific data in particular columns.

2) Use the Geocoder gem or something similar to search for hotel deals near a particular address or near the ip address of the user.  However, to do this I believe it would be necessary to have access to all of the deals to check if each one's coordinates were near to the coordinates of the given address or ip address

Screenshot of homepage
----------------------

![Image](https://raw.github.com/ggriffis/hotel-deals/master/app/assets/images/Homepage.png)


