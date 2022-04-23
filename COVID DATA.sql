select * from cases
	order by Country asc

select * from vaccinations

-- Looking at the confirmed cases and deaths per country

select
	Country, 
	WHO_region, 
	sum (Cumulative_Cases) as Cases, 
	sum (Cumulative_deaths) as Deaths
from cases
group by Country, WHo_region
order by Country asc

-- Looking at the death rate of infected individuals by Country per day

select 
	Date_reported as Date, 
	Country, 
	Cumulative_Cases as Cases, 
	Cumulative_deaths as Deaths, 
	Cumulative_deaths/NULLIF (Cumulative_cases, 0) *100 as "Death Rate"
from cases


-- Looking at the cumulative death rate of infected individuals by Country

select 
	Country, 
	WHO_region, sum(Cumulative_Cases) as Cases, 
	sum(Cumulative_deaths) as Deaths, 
	sum (Cumulative_deaths) / sum (nullif (Cumulative_Cases,0)) *100 as "Death Rate"
from cases
group by Country, WHo_region
order by Country 

-- Looking at Top 10 Countries with the highest death rate 

select Top (10) 
	Country, 
	WHO_region, 
	sum(Cumulative_Cases) as Cases, 
	sum(Cumulative_deaths) as Deaths, 
	sum (Cumulative_deaths) / sum (nullif (Cumulative_Cases,0)) *100 as "Death Rate"
from cases
group by Country, WHo_region
order by [Death Rate] desc


-- Looking at the cumulative death rate of infected individuals by Region


select  
	WHO_Region, 
	sum(Cumulative_Cases) as Cases, 
	sum(Cumulative_deaths) as Deaths
	--sum (Cumulative_deaths) / sum (nullif (Cumulative_Cases,0)) *100 as "Death Rate"
from cases
group by WHo_region
order by WHO_region asc




--Looking at the Confirmed Cases, Deaths, Administred Vaccinations by Country
--CTE 

with AdministerdVaccinations as
(
	select 
		cas.Country, 
		cas.WHO_region, 
		sum(cas.Cumulative_Cases) as "Confirmed Cases", 
		sum (cas.Cumulative_deaths) as Deaths, 
		vac.total_vaccinations as "Administered Vaccinations"
	from cases cas
	Join vaccinations vac
		on cas.country = vac.country
	group by cas.Country, cas.WHo_region, vac.total_vaccinations
	--order by cas.Country asc
)

Select * from AdministerdVaccinations


--GLOBAL NUMBERS


--Total Cases, Deaths and Vaccinations

select 
		--cas.Country, 
		--cas.WHO_region, 
		sum(cas.Cumulative_Cases) as "Confirmed Cases", 
		sum (cas.Cumulative_deaths) as Deaths, 
		sum(vac.total_vaccinations) as "Administered Vaccinations"
	from cases cas
	Join vaccinations vac
		on cas.country = vac.country
	--group by 
	--	cas.Country, cas.WHo_region, 
	--	vac.total_vaccinations
	--	order by cas.Country asc


--Daily Cases &  Deaths 

select 
	Date_reported as Date, 
	sum(Cumulative_Cases) as Cases, 
	sum(Cumulative_deaths) as Deaths
from cases
group by Date_reported
order by Date_reported asc
