CREATE OR REPLACE VIEW vw_state_txn_users AS
select
	 state_year_quarter,State, Year, Quarter, Transactions, `Amount (INR)`, `ATV (INR)`, `Registered Users`, `App Opens`
from state_txn_users;

CREATE OR REPLACE VIEW vw_state_txn_category AS
select
	state_year_quarter,State, Year, Quarter, `Transaction Type`, Transactions, `Amount (INR)`, `ATV (INR)`
from state_txn_category;

CREATE OR REPLACE VIEW vw_state_device_data AS
select
	state_year_quarter,State, Year, Quarter, Brand, `Registered Users`, `Percentage`
from state_device_data;

CREATE OR REPLACE VIEW vw_dist_txn_users AS
select
	state_year_quarter,State, Year, Quarter, District, Code, Transactions,  `Amount (INR)`, `ATV (INR)`, `Registered Users`, `App Opens` 
from dist_txn_users;

CREATE OR REPLACE VIEW vw_dist_demo AS
select
	State, District, Headquarters, Population, `Area (sq km)`, Density, Code, `Alternate Name`
from dist_demo;