********************************************
ColdFusion Object Oriented Programming Introduction
********************************************

The download contains all relevant code snippets included within the publication.

An assistant microsite has been developed to help provide you with quick easy access to the code snippets and required files.
This is built using FW/1 which requires you have at least ColdFusion 8.01 installed. 
Simply copy this entire directory within the ColdFusion web root on your machine, and view the index.cfm file within your browser.
For example: http://127.0.0.1:8500/6323_ChapterFiles/index.cfm

If you receive a message similar to the following:

"Could not find the ColdFusion Component or Interface org.corfield.framework."

You will need to add a mapping into the ColdFusion Administrator like so:

Logical Path: /org
Directory Path: This must point to the 'org' directory within this directory structure, for example: C:\ColdFusion8\wwwroot\6323_ChapterFiles_complete\org

If you do not have the required version of ColdFusion installed, or you are experiencing any issues when trying to view the assistant site,
you can obtain the same code snippets and information from browsing the directory structure itself.


/Code - This folder contains individual directories that hold the relevant code snippets per chapter

	/Chapter1 - Code Present
	/Chapter2 - Code Present
	/Chapter3 - Code Present
	/Chapter4 - Code Present
	/Chapter5 - Code Present
	/Chapter6 - Code Present
	/Chapter7 - Code Present
		/complete - contains Address Bean, AddressGateway, AddressDAO and AddressService component files

/Installation - contains a .sql file to help you create the database tables with dummy data to run the code examples


Note
****

Chapter 7 uses code within the example that isn't written out explicitly within the book. 
This code is included within the Chapter 7 code files for you to include and use when required.
