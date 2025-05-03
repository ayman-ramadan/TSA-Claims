* Initiate and setup a Libirary ;
libname TSA "/home/u63766878/TSA Project";

* Import the Data File ;
options validvarname=v7;

proc import datafile="//home/u63766878/TSA Project/TSAClaims2002_2017.csv"
	dbms=csv
	out= tsa.ClaimsImport
	replace;
	guessingrows=max;
run;

* Reviewing the Data and Info about it ;
proc print data=tsa.ClaimsImport (obs=20);
run;
proc contents data=tsa.ClaimsImport;
run;

* Removing the Duplicates and save into new file ;
proc sort data=tsa.ClaimsImport
	OUT = tsa.claims_nodups
	nodupkey;
	by _ALL_;
run;

* Reviewing Sample of the data that is missing in the Claim_Type Column;
proc print data=tsa.claims_nodups(obs=30);
	where Claim_Type is missing;
run;

* Handling Missing Values ;
data tsa.claims_cleaned;
	set tsa.claims_nodups;
	if missing(Claim_Type) or Claim_Type='-' then Claim_type="Unknown";
	if missing(Claim_Site) or  Claim_Site='-' then Claim_Site="Unknown";
	if missing(Disposition) or Disposition='-' then Disposition="Unknown";
run;

* Reviewing the Data After Filling the missing;
proc print data=tsa.claims_cleaned(obs=30);
	where Claim_Type = "Unknown" or Claim_Site = "Unknown" or Disposition = "Unknown";
run;

* Reviewing the Freq from some columns before the Cleaning Process ;
proc freq data=tsa.claims_cleaned;
	tables Claim_Type Claim_Site Disposition;
run;

* Data Cleaning Process ;
	data tsa.claims_cleaned;
	set tsa.claims_cleaned;
	if index(Claim_Type, '/') then Claim_Type= substr(Claim_Type, 1, index(Claim_Type, '/')-1);
	
	*/ Fixing the Spaces /*;
	if Disposition="Closed: Canceled" then Disposition="Closed:Canceled";
	if Disposition="losed: Contractor Claim" then Disposition="Closed:Contractor Claim";
	
	*/ Fixing proper and upper case names */;
	StateName = propcase(StateName);
	State = upcase(State);
	
	*/ Fixing Format of the dates */ ;
	format Date_Received Incident_Date date9.;
run;

* Reviewing the Freq from some columns After the Cleaning Process ;
proc freq data=tsa.claims_cleaned;
	tables Claim_Type Claim_Site Disposition;
run;

* Creating a new column that indicates date issues ;
data tsa.claims_cleaned;
	set tsa.claims_cleaned;
	if Date_Received<Incident_Date 
	or Date_Received< "01JAN2002"d 
	or Incident_Date< "01JAN2002"d 
	or Date_Received> "31DEC2017"d
	or Incident_Date> "31DEC2017"d
	or missing(Date_Received)
	or missing(Incident_Date)
	then Date_Issues="Needs Review";
	*/ Fomating the Curruncy /*;
	format Close_Amount dollar10.2;
	*/ Drop unwanted columns /*;
	drop County City;
run;

proc sort data=tsa.claims_cleaned
	out=tsa.claims_cleaned;
	by Incident_Date;
run;

* Adding Labels for every column ;
data tsa.claims_cleaned;
	set tsa.claims_cleaned;
	label Claim_Number= "Claim Number"
	Date_Received = "Date Received"
	Incident_Date = "Incident Date"
	Airport_Code = "Airport Code"
	Airport_Name = "Airport Name"
	Claim_Type = "Claim Type"
	Claim_Site = "Claim Site"
	Item_Category = "Item Category"
	Close_Amount = "Close Amount"
	Date_Issues = "Date Issues";
run;

*/ Analyze the data and answer the questions /*;

/* How many Data Issues */
title 'Overall Date Issues';
proc freq data = tsa.claims_cleaned;
    table Date_Issues ;
run;

/* How many claims per year */
title 'Overall Claims per Year';
proc freq data = tsa.claims_cleaned;
    table Incident_Date/ plots = freqplot;
    format Incident_Date year2.;
    where Date_Issues = '';
run;

/* Showing the Freq Values for Claim_Type Claim_Site Disposition by spicific state */

* Choosing the state ;
%let SelectedState = Washington;

title "Frequancy for Claim Types, Claim Sites and Disposition by Washington";
proc freq data = tsa.claims_cleaned;
    table Claim_Type Claim_Site Disposition ;
    where Date_Issues = '' AND StateName = "&SelectedState";
run;

/* Statistical Analysis for Close_Amount*/
title "Close_Amount Statistics for Washington";
proc means data = tsa.claims_cleaned MAXDEC = 0 mean min max sum;
var Close_Amount;
where Date_Issues = '' AND StateName = "&SelectedState";
run;

/* Exporting the Data*/
/* create a pdf for the end reports*/
ods pdf file="/home/u63766878/TSA Project/ClaimsReports.pdf" style=Meadow;
ods pdf close;

















