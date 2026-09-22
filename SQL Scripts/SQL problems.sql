#2.1: Analyze transaction trends over the years for each state
#2.1.1 Calculate the total number of transactions and total transaction amount for each state over the years. Display the results in a tabular format.
select
	State,
    Year,
    sum(Transactions) as Total_number_of_transactions,
    round(sum(`Amount (INR)`),2) as Total_amount_transfered
from state_txn_users
group by
	State,
    Year;
#2.1.2 Identify the top 5 states with the highest transaction volumes and the top 5 states with the lowest transaction volumes. Display the results.
(select
	State,
    sum(Transactions) as Total_number_of_transactions,
    round(sum(`Amount (INR)`),2) as Total_amount_transfered
from state_txn_users
group by
	State
order by
	Total_number_of_transactions desc
limit 5)
union
(select
	State,
    sum(Transactions) as Total_number_of_transactions,
    round(sum(`Amount (INR)`),2) as Total_amount_transfered
from state_txn_users
group by
	State
order by
	Total_number_of_transactions asc
limit 5);

#2.2: Identify the most common transaction types in each state and quarter
#For each state and quarter, determine the most frequent transaction type. Display the results in a tabular format.
with cte as(
select
	State,
    Quarter,
    `Transaction Type`,
    sum(Transactions) as Total_Transactions,
    rank() over ( partition by State, Quarter order by sum(Transactions) desc) as Category_rank
from state_txn_category
group by
	State,
    Quarter,
    `Transaction Type`
)
select
	State,
    Quarter,
    `Transaction Type`,
    Total_Transactions
from cte
where Category_rank = 1;


#2.3: Determine the device brand with the highest number of registered users in each state
#Identify the device brand with the highest number of registered users in each state. Display the results in a tabular format.
with cte as(
select*
from state_txn_users
where Year = (select max(Year) from state_txn_users)
)
select
	c.State,
    c.`Registered Users`,
    d.Population,
    round(c.`Registered Users`/d.Population,2)as User_registration_ratio
from cte as c
inner join dist_demo as d
on d.State = c.State
where quarter = (select max(quarter) from cte);

with cte as(
select*
from state_device_data
where Year = (select max(Year) from state_txn_users)
),cte2 as(
select
	State,
    Brand,
    `Registered Users`,
    rank() over(partition by State order by `Registered Users` desc) as Brand_ranking
from cte
where quarter = (select max(quarter) from cte)
)
select
	State,
    Brand,
    `Registered Users`
from cte2
where Brand_ranking = 1;


# 2.4: Create a list of the top district per state based on population
# For each state, identify the district with the highest population. Display the results in a tabular format.
with cte as(
select
	State,
    District,
    Population,
    row_number() over ( partition by State order by Population desc) as District_Ranking
from dist_demo
)
select
	State,
    District,
    Population
from cte
where District_Ranking = 1;


#2.5: Calculate the average transaction value (ATV) for each state
#2.5.1 Compute the average transaction value for each state. Display the results in a tabular format.
select
	State,
    round(avg(`ATV (INR)`),2) as Average_State_ATV
from state_txn_users
group by
	State;
#2.5.2 Identify the top 5 states with the highest ATV and the top 5 states with the lowest ATV. Display the results.
(select
	State,
    round(avg(`ATV (INR)`),2) as Average_State_ATV
from state_txn_users
group by
	State
order by
	Average_State_ATV desc
limit 5)
union
(select
	State,
    round(avg(`ATV (INR)`),2) as Average_State_ATV
from state_txn_users
group by
	State
order by
	Average_State_ATV asc
limit 5);


#2.6: Analyze app usage trends
#Calculate the total number of app opens over the years for each state. Display the results in a tabular format.
select
	State,
	sum(case when Year = 2018 then `App Opens` else 0 end) as `2018`,
    sum(case when Year = 2019 then `App Opens` else 0 end) as `2019`,
    sum(case when Year = 2020 then `App Opens` else 0 end) as `2020`,
    sum(case when Year = 2021 then `App Opens` else 0 end) as `2021`
from state_txn_users
group by
	State;
    
    
#2.7: Distribution of transaction types 
#Create a table t showing the distribution of different transaction types for each state for the most recent quarter in the dataset.
select
	state,
    sum(case when `Transaction Type` = 'Peer-to-peer payments' then Transactions else 0 end) as `Peer-to-peer payments`,
    sum(case when `Transaction Type` = 'Recharge & bill payments' then Transactions else 0 end) as `Recharge & bill payments`,
    sum(case when `Transaction Type` = 'Merchant payments' then Transactions else 0 end) as `Merchant payments`,
    sum(case when `Transaction Type` = 'Financial Services' then Transactions else 0 end) as `Financial Services`,
    sum(case when `Transaction Type` = 'Others' then Transactions else 0 end) as `Others`
from(select * from state_txn_category where Year = 2021 and Quarter = 2) as filteres_data
group by
	State;



#4.1: Ratio of users to population by state
#Merge the State_Txn and Users dataset with the District Demographics dataset 
#to calculate the ratio of registered users to the population for each state. Display the results in a tabular format.
with cte as(
select*
from state_txn_users
where Year = (select max(Year) from state_txn_users)
)
select
	c.State,
    c.`Registered Users`,
    d.Population,
    round(c.`Registered Users`/d.Population,2)as User_registration_ratio
from cte as c
inner join dist_demo as d
on d.State = c.State
where quarter = (select max(quarter) from cte);

#4.3: Average transaction amount per user - State transaction
#Merge relevant datasets to calculate the average transaction amount per user for each state. Display the results in a tabular format.
#Identify the top 5 states with the highest average transaction amount per user and the top 5 states with the lowest average transaction amount per user. Display the results.

select
	State,
    sum(`Amount (INR)`) as Total_Amount,
    sum(`Registered Users`) as Total_users,
    sum(`Amount (INR)`)/sum(`Registered Users`) as Amount_per_user
from state_txn_users
group by state
order by
	Amount_per_user desc;
