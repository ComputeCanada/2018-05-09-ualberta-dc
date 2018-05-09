#Summary

A 90 minute workshop that will attempt to give a helpful boost to people looking to collect and clean data by:

* sharing with them some locations and best practices for data collection
* showing them how OpenRefine can be used to clean CSV data

#Intro
Briefly summarize the workshop (perhaps as above) and then move into the gallery walk (below).

##Software Install
Check at this time that everyone has the requested software installed (Some spreadsheet program, a terminal / command line program, and Open Refine).  If this is not the case then the gallery walk time can be used to do this.

##Stickies
Also introduce the green and red stickies.  If people have the requested software installed then they can put up a green sticky.  If they are working on the install and doing so happily then they can go with no stickies.  If they would like some help then they can throw up a red sticky.

##Etherpad


#Gallery walk

Participants use the markers provided to write out their answers to the following questions, each of which will appear on its own sheet of paper:

* What do you want to do?
* What does the data you are working with look like?
* Where do you currently get data or do you think you would you get it?
* What problems do you have with the data you have?

Two rounds:

1. Answer questions
2. Read the answers of others (add checks if it applies to you too)

#Collecting/Looking at Data
Look at some of the datasets that have been provided.  Core things to be noticing:

* Many files to download (if consecutive naming then curl with [])
* Need to download multiple times (script or list)
* APIs (e.g. Twitter)
* Parts of a web page (need a scraper)
* Not available anywhere
* Build it yourself
* Data types

## Using the command line
**IF** comfort in the room seems reasonable then instead of just talking about how and where to get data then a bit of time with `curl` can be done as a hands-on.  While the command line can be intimidating to many `curl` is a much faster means of collecting data in a systematic way than getting caught up in teaching a programming language.

To cover:
* whoami
* pwd
* ls
* cd

Only need these to the point where they can be working in their desktop so that when `curl` is run it dumps content into their desktop.

## Using `curl`
`curl` is a standard command line tool installed with/on most systems with a terminal.  If it is not installed then wget likely is.

Standard deployment is `$ curl http://somewebsite.com/index.html`

This just prints website on the screen to save it we need to tell `curl` to capture the name at the end of the url and save the file.  We do this with what is known as a flag.  In this case the flag is `-O` (that's a capital "O" as in "Oh" and not a zero).

`$ curl -O http://somewebsite.com/index.html`

A file called index.html should appear on people's desktops.

Open that file and look at it.

Ask people to download a webpage or object of their choice and put up a green sticky when successful.

## List example
Create a text file with one URL per line and then pass this to `curl`.

This will involve the use of the `|` character.  This can be usefully introduced and illustrated by using `history` piped to `grep`.

`xargs -n 1 curl -L -O < curlFeedTest.txt`

`cat curlFeedTest.txt | xargs -n 1 curl -LO`

## Consecutive naming file
`curl -L -O https://www.papakilodatabase.com/pdnupepa/cgi-bin/imageserver.pl?oid=KHHA19370217-01\&getpdf=true`

`curl -L -O https://www.papakilodatabase.com/pdnupepa/cgi-bin/imageserver.pl?oid=KHHA193702[17-24]-01\&getpdf=true`

`curl -L -O https://www.papakilodatabase.com/pdnupepa/cgi-bin/imageserver.pl?oid=KHHA193[01-12][01-31]-01\&getpdf=true`

Note that scraping more than is needed here is fine.  We can easily distinguish between the "File not found" files on the basis of their size.

## Other things that can be touched on

###Rate limiting

If you are going to pull a lot of data down from a source it can be in your best interest to limit the speed of the download.  Not only is this generally polite, it also stands to prevent you from getting banned.

Some sites do not like being scraped.  If they suspect it they will block you.

###Looking inside
Some files are big and will perform poorly is a spreadsheet program (e.g. Powerhouse Museum data).  For this we can use `head` or `head -n`.  Or *OpenRefine*, which is next...

# Cleaning up the data

## What does dirty data look like?
Ask around for features.  Sorta looking for two general definitions, either

*Data that is difficult for someone else to use without modification.*

*Data that is difficult for you to use without modification.*

## Cleaning Data

We'll loosely follow along with the lesson from Programming Historian that can be found [HERE](https://programminghistorian.org/lessons/cleaning-data-with-openrefine).  

The dataset being used is [HERE](https://programminghistorian.org/assets/phm-collection.tsv).

We'll start by downloading a dataset from the Powerhouse Museum.  [Note that this dataset is no longer available from the Powerhouse Museum directly.]

It's 75,000 rows and about 60 MB in size.  The "Full" set is 100,000 rows and about 80 MB in size.

Have participants open the dataset in their tool of choice.  Note the warning in Atom.

Have participants scroll through/around and note:

1. what they think is interesting
2. what is "dirty" about the dataset
3. what features of Excel would make this easy or hard to clean

### OpenRefine

Have participants open OpenRefine.

Note that it opens in a browser.

We're going to create a project by opening the file.

#### Parse data as
Point out the options here.  The defaults are fine with the exceptions of:

* "Parse cell text into numbers, dates, ..."  This is off by default.  Turn it on.
* "Quotation marks are used to enclose cells containing column separators."  This isn't true and turning it on will result in OpenRefine pulling some rows up into the previous rows.

 check the name, and click **Create Project** in the top right corner.

#### Get to know the data
Scroll around and note that 

* OpenRefine only loads a subset into the window.  This is for speed.
* It looked like the data stopped in column P but it doesn't.
* It's a lot easier to look at the data here than in the default compressed view given by Excel.

#### Facets
We can use these to control how we see the data.  The problem right now is that the data is either too diverse or too dirty to use this well.

We can use facets to check for non-numeric values in numeric columns.  Let's try this with **Record ID** by creating a numeric facet.

#### Removing Blank Rows

In the box on the left note that there are three non-numeric values.  Turn off the numeric values to only see the non-numeric ones and fix them.  Note that they are not empty but rather have an empty whitespace character (This can be seen by trying to edit the cell).  This is why these rows were not removed on import.  From the "ALL" triangle choose to remove all matching rows.

#### Removing Duplicate Rows

1. Sort by Record ID and choose "numbers".
2. Make sure to choose to have the rows reordered permanently (OpenRefine just gives a view of the data otherwise so if you don't actually force the reorder then you'll end up missing duplicates an actual sort would turn up).
3. Choose to Edit Cells >> Blank Down from the Record ID.
4. Facet > Customized > Blank cells
5. Remove the blanks

#### Atomization (to let us cluster)

1. Look at categories and note that these are lists separated by pipes (`|`).
2. Edit Cells > Split Multi...
3. Records vs. Rows.  Can swap between these.  Remember that OpenRefine is just giving a view of our data.

#### Clustering

1. Facet the categories now.
2. Will need to scale the number of categories allowed.
3. Click "Cluster" in the facet options.
4. Play with these.

#### Deatomizing

1. When done put it all back by going Edit cells > Join multi-valued.

#### Skip regular expressions for this workshop.

#### Splitting columns
The units are bad for dimensions because the units are in with the values.  This can be fixed by splitting the columns.  Then we facet and then we cluster.  Use stickies here to check that people are getting it.

We can mod the values here by faceting to, say, meters and then using Transform Values with Python / Jython and `return value * 1000`.  Same with converting m to mm: `return "mm"`

That'll do.


1. What counts as data?
	* pretty much anything:
		* web pages
		* documents
		* tweets
		* spreadsheets
		* videos
2. Where to get it:
	* Web pages
		* easy (click and download)
		* hard (scrape)
	* APIs
3. What's it look like?
	*  
Special places to look for data:
	2. 	Wayback Machine
1. Special Data Collecting Techniques:
	1. Multiple files. 
	2. Restarting stalled downloads
2. Looking at data
	1. Peeking inside with `head`
	2. Spreadsheets
3. Understanding good and bad data practices
4. Cleaning up data with OpenRefine

# Getting the Data

Can you get it in a few clicks?  No problem, just get it.

Do you need to do a lot of clicks?  Might you need to download it again and again?

Papa Kilo example for pulling historical newspapers down.

Point is that there is a point where putting in the time to create an automatic scraper is worth it.  [Include the chart from the Carpentries].

Scraping subsections of pages vs. entire pages.

What counts as data?

# Looking at the Data