Smart Pension Ruby Developer Tech Test

Ruby LogData Parser



Description
Write a program that:

a. Receives a log file as an argument (webserver.log is provided) e.g.: ./<parse> webserver.log

b. Returns the following:

> list of webpages with most page views ordered from most pages views to less page views e.g.:
/home 90 visits /index 80 visits etc...

> list of webpages with most unique page views also ordered e.g.:
/about/2 8 unique views /index 5 unique views etc...



Installation
- clone this repository  $ git clone git@github.com:hotblack86/SP_TT.git

- go to repository folder  $ cd SP_TT

- run  $ bundle install



Usage
- run the program with ruby  $ ruby main.rb webserver.log

* webserver.log can be replaced with a log file of your choosing. You will receive an error message
if you provide an invalid filepath or if you provide no arguement for the above command.

- run tests  $ rspec
