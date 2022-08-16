create database SQL_project
use sql_project;
select*from coviddeaths1;
select*from covidvaccinations1;

select location,date,total_cases,new_cases,total_deaths,population from coviddeaths1;

#total deaths / total cases 
select location,date,total_cases,total_deaths,(total_deaths/total_cases)*100 from coviddeaths1 order by (location or date);
#total cases/population
select location,date,total_cases,population,(total_cases/population)*100 from coviddeaths1 order by (location or date);
#Highest infected rate
select location,population,max(total_cases),max((total_cases)/population)*100 from coviddeaths1 order by (location or population);

#Highest death 
select location,population,max(total_deaths) from coviddeaths1 group by location;

#Joining two tables
select * from coviddeaths1 as dea join covidvaccinations1 as vac 
on dea.location = vac.location and dea.date = vac.date; 

#Total population vs Vaccinations
select dea.continent,dea.location,dea.date,dea.population, vac.new_vaccinations from coviddeaths1 as dea join covidvaccinations1 as vac 
on dea.location = vac.location and dea.date = vac.date ;
