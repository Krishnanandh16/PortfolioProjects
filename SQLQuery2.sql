SELECT * 
FROM portfolioprojects..coviddeaths
WHERE continent is not null
ORDER BY 3,4


SELECT location,date,total_cases,new_cases,total_deaths,population
FROM portfolioprojects..coviddeaths
ORDER BY 1,2

SELECT location,date,total_cases,total_deaths,(total_deaths/total_cases) * 100 AS death_percentage
FROM portfolioprojects..coviddeaths
WHERE location = 'India'
ORDER BY 1,2

-- shows percentage of population got Covid
SELECT location,date,population,total_cases,(total_cases/population) * 100 AS percentage_of_populationinfected
FROM portfolioprojects..coviddeaths
WHERE location = 'India'
ORDER BY 1,2

--Countries with highest infection rate compared with respect to population 
SELECT location,population,MAX(total_cases) as Highest_infection_count,MAX((total_cases/population) * 100) AS percentage_of_populationinfected
FROM portfolioprojects..coviddeaths
GROUP BY location,population
ORDER BY percentage_of_populationinfected DESC

--Continent with highest Death Count per population
SELECT continent,MAX(cast(total_deaths as int)) as Total_death_count
FROM portfolioprojects..coviddeaths
WHERE continent is  not null
GROUP BY continent
ORDER BY Total_death_count DESC

Select SUM(new_cases) as total_cases, SUM(cast(new_deaths as int)) as total_deaths, SUM(cast(new_deaths as int))/SUM(New_Cases)*100 as DeathPercentage
From portfolioprojects..coviddeaths
where continent is not null 
order by 1,2

--Total vaccination with repsect to population
Select dea.continent, dea.location, dea.date, dea.population, vac.new_vaccinations,
SUM(CONVERT(int,vac.new_vaccinations)) OVER (Partition by dea.Location Order by dea.location, dea.Date) as RollingPeopleVaccinated
From portfolioprojects..coviddeaths dea
Join portfolioprojects..covidVaccinations vac
On dea.location = vac.location and dea.date = vac.date
where dea.continent is not null 
order by 2,3

--CTE 
With PopvsVac (Continent, Location, Date, Population, New_Vaccinations, RollingPeopleVaccinated)
as
(
Select dea.continent, dea.location, dea.date, dea.population, vac.new_vaccinations
, SUM(CONVERT(int,vac.new_vaccinations)) OVER (Partition by dea.Location Order by dea.location, dea.Date) as RollingPeopleVaccinated
From portfolioprojects..coviddeaths dea
Join portfolioprojects..covidvaccinations vac
On dea.location = vac.location and dea.date = vac.date
where dea.continent is not null 
--order by 2,3
)
Select *, (RollingPeopleVaccinated/Population)*100
From PopvsVac

--data for visualizing 
Create View PercentPopulationVaccinated as
Select dea.continent, dea.location, dea.date, dea.population, vac.new_vaccinations
, SUM(CONVERT(int,vac.new_vaccinations)) OVER (Partition by dea.Location Order by dea.location, dea.Date) as RollingPeopleVaccinated
From portfolioprojects..coviddeaths dea
Join portfolioprojects..covidvaccinations vac
On dea.location = vac.location and dea.date = vac.date
where dea.continent is not null 

SELECT * 
FROM PercentPopulationVaccinated
