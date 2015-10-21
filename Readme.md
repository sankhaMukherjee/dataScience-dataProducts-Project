CONTENTS OF THIS FILE
---------------------
   
 * Introduction
 * Requirements
 * Installation
 * Configuration
 * Known Issues
 * Maintainers
 * References

INTRODUCTION
------------

This is a shiny application written for completing the course project requirements of the course *Developing Data Products*, which is part of the *Data Science Specialization* Course. 

Data analysis consists of the following steps:

1. Ontaining data
2. exploratory data analysis
3. splitting data into a training, test sets, (for a non-stacked example)
4. Running a particular algorithm for machine learning using a training set
5. Finding the result of the machine learning using the test set

These are general functions which are very repetitive. Hence, it would make sense to be able to create an application which will create a GUI that automates all these functions. This is what is done here. 

> Note: There has been no attempt made in this project to use any sort of sophisticated learning methodologies such as stacking etc because the focus was to create something simple so that it can be completed in a reasonable amount of time to demonstrate the use of `shiny`. Please do not use it in any form of machine learning tasks. This application will need to be changed signiifcantly before anything like that can be performed.


REQUIREMENTS
------------
This module requires the following modules:

 * `shiny`: (provides interfaces for running a local web server and a user interface)
 * `caret`: (for a unified machine learning algorithm.)


INSTALLATION
------------

You can just copy the entire set of files to any particular directory. Then navigate into the directory containing the files `ui.r` and `server.r` within `R Studio` and type `runApp()`. You should be able to see the implementation. 


CONFIGURATION
-------------

This program uses the default css that comes with the `shiny` application. No attempt has been taken to jazz-up the user interface. If any configurations are required, please see how custom css modules may be added to this to change the appearence of the application. 

KNOWN ISSUES
------------

 - The uploaded file appears to have a maximum file limit. Dont upload files which are too big. It appears to be a problem with `shiny` rather than the `read.csv` function which I use to load the data. I have no time to figure out how to fix this. 
 - Do not use this program to run simulations which are very long. I have no idea what will happen and how long you will have to wait to get the results ...
 - This program does not automatically convert data into `factor` variables etc, which may be needed if the data is not *perfect*. So taking care of such issues is totally up to you. 


MAINTAINERS
-----------

Current maintainers:
 * Sankha S. Mukherjee - sankha [dot] mukherjee [at] gmail [dot] com

This project is provided free. There is no guarantee whatever as far as the accuracy or validity of the code is concerned. The author(s) do not take responsibility for any problems (including data loss) which may occur as a result of using this program. Please use it at your own risk. 

REFERENCES
-----------

Nearly all of the widgets and modifications are obtained from the following site :

http://shiny.rstudio.com/gallery/


