select * from Transactions



/*DATA CLEANING*/
/*deleting irrelevant columns*/

alter table transactions
drop column trans_group_ar, procedure_name_ar,property_type_ar, property_sub_type_ar, property_usage_ar,
reg_type_ar, area_name_ar,building_name_ar, master_project_ar, nearest_landmark_ar, nearest_metro_ar, 
nearest_mall_ar,rooms_ar,no_of_parties_role_1, no_of_parties_role_2, no_of_parties_role_3, project_name_ar, rooms_en, 
property_type_id,property_sub_type_id, reg_type_id, building_name_en, project_number, has_parking, procedure_area, property_sub_type_en, project_name_en, rent_value, meter_rent_price
nearest_landmark_en, nearest_metro_en, nearest_mall_en


/* standardizing date format in instance_date*/

SELECT transaction_id, instance_date, CONVERT(DATE,instance_date,103) as 'instance_date_converted' from Transactions
order by instance_date_converted asc

alter table transactions
add instance_date_converted Date

Update transactions
set instance_date_converted = convert(date,instance_date,103)

select transaction_id, instance_date, instance_date_converted from transactions

alter table transactions
drop column instance_date


/*updating records with NULL date*/

select transaction_id, instance_date_converted FROM transactions
where instance_date_converted is null

update Transactions
set instance_date_converted = '01-01-2009'
where transaction_id like '%-2009-%' and instance_date_converted is null

update Transactions
set instance_date_converted = '01-01-2018'
where transaction_id like '%-2018-%' and instance_date_converted is null

update Transactions
set instance_date_converted = '01-01-1997'
where transaction_id like '%-1997-%' and instance_date_converted is null


alter table transactions
drop column instance_date, procedure_id, trans_group_id, area_id, master_project_en, actual_worth, meter_sale_price, 

alter table transactions
drop column 



