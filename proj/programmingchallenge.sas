libname anx '\\Client\C:\Users\juliarandazzo\Desktop\STA 311\Topic 13\Programming Challenge';

proc datasets library=anx;
quit;

****task 1****;

data  had_anx;
set anx.had_anx;
run;

proc print data=had_anx (obs=1);
quit;

proc freq data=had_anx;
tables visitno;
quit;

data had_anx;
set had_anx;
if visitno = '1/2' then visitno = '1.5';
run;

data had_anx;
set had_anx;
if visitno = 'INTERIM 1' then delete;
run; 

data had_anx;
set had_anx;
if visitno = 'INTERIM 2' then delete;
run;

data had_anx;
set had_anx;
if visitno = 'INTERIM 3' then delete;
run;

data had_anx;
set had_anx;
if visitno = 'Interim 1' then delete;
run;

data had_anx;
set had_anx;
if visitno = 'Interim 2' then delete;
run;

data had_anx;
set had_anx;
if visitno = 'Interim 3' then delete;
run;

data had_anx;
set had_anx;
if visitno = 'Interin 1' then delete;
run;

data had_anx;
set had_anx;
if visitno = 'interim 1' then delete;
run;

data had_anx;
set had_anx;
if visitno = '1=2' then visitno = '1.5';
run;

data had_anx;
set had_anx;
if visitno = 'ET/9' then visitno = '9';
run;

data had_anx;
set had_anx;
if visitno = '211' then visitno = '12';
run;

proc freq data = had_anx;
tables visitno;
quit;

data had_anx;
set had_anx;
visit = input(visitno, best.);
drop visitno;
run;


proc print data = had_anx (obs=5);
quit;

proc sort data = had_anx;
by patno visit;
run;


****task 2****;

proc contents data = had_anx;
quit;

****task 3****;

data had_anx;
set had_anx;
by patno;
if last.patno;
run;

proc print data= had_anx (obs=200);
quit;


proc means data = had_anx;
quit;

****task 4****;

data had_anx;
set had_anx;
proc means data=HAD_ANX;
var item1 item3 item5 item7 item9 item11 item13;
quit;


data had_anx;
set had_anx;
crfscore = 7*mean(item1, item3 ,item5 ,item7 ,item9, item11 ,item13);  ****PRO-RATED TOTAL****;
run;

proc sort data = had_anx;
by visit;
quit;


proc means data = had_anx;
by visit;
quit;

****task 5****;

data had_anx;
set had_anx;
if patno = '320' then delete;
run;


proc sql;
    select min(evaldate) as min_date format=mmddyy10.,
                 max(evaldate) as max_date format=mmddyy10.
             from had_anx;
quit;


proc print data = had_anx (obs=300);
quit;

****task 6****;

proc freq data=had_anx;
    table patno;
run;

****task 7****;


proc sort data= had_anx;
by patno evaldate;
quit;


proc print data = had_anx noobs;
var patno evaldate;
quit;



