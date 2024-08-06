create database  bankproject;
select count(*) from fin1csv;
select count(8) from fin2;
RENAME TABLE fina_2_sql TO fin2;
RENAME TABLE `fina 2 sql` TO `finance_2`;
RENAME TABLE `finance_2` to `fin2` ;
RENAME TABLE  `fin0` to  `fin1`;
drop table fin1;
SELECT * from fin1;
select * from fin2;


-- KPI 1 : Year wise loan amount Stats
ALTER TABLE fin1 CHANGE COLUMN `issue-d` `issue_d` DATE;
select year(issue_d) as Year_issue_d, sum(loan_amnt) as Total_loan_amount
from fin1 
group by year_issue_d
order by year_issue_d;

-- KPI 2: Grade and sub grade wise revol_bal
select * from fin1;
select * from fin2;
select grade, sub_grade, sum(revol_bal) as Total_revol_bal
from fin1 join fin2 on (fin1.id=fin2.id)
group by grade, sub_grade
order by grade, sub_grade;

-- KPI 3: Total Payment for Verified Status Vs Total Payment for Non Verified Status
select verification_status, concat("$",format(round(sum(total_pymnt)/1000000,2),1),"M") as total_paymnt
from fin1 join fin2 on (fin1.id=fin2.id)
group by verification_status;

-- KPI 4: State wise and last_credit_pull_d wise loan status
select * from fin1;
select * from fin2;
select addr_state, last_credit_pull_d, loan_status
from fin1 join fin2 on (fin1.id=fin2.id)
group by addr_state, last_credit_pull_d, loan_status;

-- KPI 5: Home ownership Vs last payment date stats
select * from fin1;
select * from fin2;
select home_ownership, last_pymnt_d, concat("$",format(round(sum(last_pymnt_amnt)/10000,2),1),"K") as last_paymnt
from fin1 join fin2 on (fin1.id=fin2.id)
group by home_ownership, last_pymnt_d
order by last_pymnt_d desc;

-- COMPLETED