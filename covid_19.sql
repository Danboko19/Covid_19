-- World Analysis
-- continent with the most cases
select continent,sum(new_cases) as total_cases
from covid_19..coviddeaths
where continent <> 'Null'
group by continent 
order by total_cases desc;

-- continent with the most death rate
select continent, (sum(cast(new_deaths as int))/sum(new_cases))*100 as death_per_cases
from covid_19..coviddeaths
where continent <> 'Null'
group by continent 
order by death_per_cases desc;

-- continent with the most contraction rate 
select cv.continent, (sum(new_cases)/sum(population))*100 as contraction_rate
from covid_19..coviddeaths as cd
join covid_19..covidvaccinations as cv
on cd.continent=cv.continent
where cv.continent <> 'Null'
group by cv.continent 
order by contraction_rate desc;

-- Africa Analysis
-- country with the most cases in africa
select location, sum(new_cases) as total_cases
from covid_19..coviddeaths
where continent like '%Africa%'
group by location 
order by total_cases desc;

-- country with the moust death rate 
select location, round((sum(cast(new_deaths as int))/sum(new_cases))*100,2) as death_rate
from covid_19..coviddeaths
where continent like '%Africa%'
group by location 
order by death_rate desc;

--The most vaccinated country
select location, sum(cast(new_vaccinations as int)) as total_vaccinations
from covid_19..CovidVaccinations
where continent like '%Africa%'
group by location 
order by total_vaccinations desc;

-- percentage of people vaccinated per country
select location, sum(new_cases) as total_cases
from covid_19..coviddeaths
where continent like '%Africa%'
group by location 
order by total_cases desc;

-- Nigeria Analysis
-- total cases vs total death
select location, total_cases, total_deaths, (total_deaths/total_cases)*100 as death_percentage
from covid_19..CovidDeaths
where location like '%Nigeria%'
order by 1,2;

-- total cases per population
select location, total_cases, population, round((total_cases/population)*100,2) as contraction_percentage
from covid_19..CovidDeaths
where location like '%Nigeria%'
order by contraction_percentage desc;

-- total vaccinated
select location, sum(cast(new_vaccinations as int))as total_vaccination
from covid_19..CovidVaccinations
where location like '%Nigeria%'
group by location;

-- Vaccination percentages as per population
select cv.location, population,cv.total_vaccinations, round((cv.total_vaccinations/population)*100,2) as vaccinnation_percentage
from covid_19..coviddeaths as cd
join covid_19..covidvaccinations as cv
on cd.location=cv.location
where cv.location like '%Nigeria%'
order by vaccinnation_percentage desc;