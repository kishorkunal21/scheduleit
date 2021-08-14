# scheduleit
The application has been created using the Spring framework. The system is designed to handle 3 kinds of Job requests-
  1. Export to File - Imports data from database and export as excel format (to some location)
  2. Export to database - Imports from a database connection and exports to a
  different or same database[No DB link required] - Define separate connections of
  types -
  a. PostgreSQL
  b. Oracle
  c. MySQL
  3. Export to mail - Fetches data from a Datasource and mails to a set of users on
  the scheduled time.

Home screen :
  Click on + to add a job
  Click on Job name to edit the job
  Click on the RIght navigation icon to configure the job
Jobs Screen -
  Scheduler - select the frequency for the job
  Based on your selection, spring cron will be generated- The job will execute at the
  scheduled time  
  
Every time when a job is Created or rescheduled - the entire job pool gets refreshed - So
restarting of the application server is not required

Connections - Define Source and Target connections for your Job
The source is from where data is to be fetched, and Target is where it is supposed to be
exported (Target is applicable to Export to DB type jobs only)
You can create and Test your connection

Once Connection is tested, Click on the right navigation to define fetch/export queries

Based on your query, the system will generate insert scripts for Batch update
