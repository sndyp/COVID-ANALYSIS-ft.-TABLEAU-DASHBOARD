-- selecting data from table that already imported

SELECT *
FROM Covid..CovidDeaths

Select *
From Covid..CovidVaccinations

-- showing some columns that located in Indonesia to gather informations about the country
select location, date, total_cases, new_cases, total_deaths, population
from Covid..CovidDeaths
where location like '%Indonesia%'
order by 1,2

-- making temporary column (death_percentage and infection_rate) that happened in Indonesia.
select location, date, total_cases, total_deaths, (CAST(total_deaths as float) / CAST(total_cases as float)) * 100 as death_percentage
from Covid..CovidDeaths
where location like '%Indonesia%'
order by death_percentage desc

select location, date, total_cases, population, (CAST(total_cases as float) / population) * 100 as infection_rate
from Covid..CovidDeaths
where location like '%Indonesia%'
order by 1,2

-- showing different order of infection_rate and death_percentage over the countries
select location, total_cases, population, (CAST(total_cases as float) / population) * 100 as infection_rate
from Covid..CovidDeaths
order by infection_rate desc

select date, location, total_cases, total_deaths, population, (CAST(total_cases as float) / population) * 100 as infection_rate, (CAST(total_deaths as float) / CAST(total_cases as float)) * 100 as death_percentage
from Covid..CovidDeaths
order by death_percentage desc

select location, population, max(total_cases) as Infected, max(cast(total_cases as float) / population) * 100 as infection_rate
from Covid..CovidDeaths
group by location, population
order by infection_rate desc

select location, population, max(total_deaths) as Deaths, max(CAST(total_deaths as float) / CAST(total_cases as float)) * 100 as death_percentage
from Covid..CovidDeaths
where continent is not null
group by location, population
order by Deaths desc

-- showing the values of death people each day accross the world
select date, sum(cast(new_cases as float)) as infected, sum(cast(new_deaths as float)) as Deaths, sum(cast(new_deaths as float)) / sum(cast(new_cases as float)) * 100 as death_percentage
from Covid..CovidDeaths
where continent is not null
group by date
order by date

-- showing the exponantial value of people getting vaccinated each day / date
select cd.continent, cd.location, cd.date, cd.population, cv.new_vaccinations, sum(cv.new_vaccinations) over (partition by cd.location order by cd.location, cd.date) as count_Vaccinated
from Covid..CovidDeaths cd
join Covid..CovidVaccinations cv
on cd.location = cv.location
and cd.date = cv.date
where cd.continent is not null
order by 2,3

-- making cte to show percent value of people getting vaccinated each day
with cte (continent, location, date, population, new_vaccinations, count_Vaccinated)
as (
select cd.continent, cd.location, cd.date, cd.population, convert(float,cv.new_vaccinations), sum(cv.new_vaccinations) over (partition by cd.location order by cd.location, cd.date) as count_vaccinated
from Covid..CovidDeaths cd
join Covid..CovidVaccinations cv
on cd.location = cv.location
and cd.date = cv.date
where cd.continent is not null
)

select *, (count_vaccinated / cast(population as float)) * 100 as vaccinated_percentage
from cte

-- making temporary table to show vaccinated_percentage
drop table if exists #temp_table
create table #temp_table
(
continent nvarchar(255),
location nvarchar(255),
date datetime,
population numeric,
new_vaccinations numeric,
count_vaccinated numeric
)


insert into #temp_table
select cd.continent, cd.location, cd.date, cd.population, cv.new_vaccinations, sum(cv.new_vaccinations) over (partition by cd.location order by cd.location, cd.date) as count_vaccinated
from Covid..CovidDeaths cd
join Covid..CovidVaccinations cv
on cd.location = cv.location
and cd.date = cv.date
where cd.continent is not null

select *, (count_vaccinated / population) as cure_percentage
from #temp_table