
Select *
From PortfolioProject..CovidDeaths
Order by 3,4

Select *
From PortfolioProject..CovidVaccinations
Order by 3,4

Select location, date, total_cases, new_cases, total_deaths, population
From PortfolioProject..CovidDeaths
Order by 1,2

-- Total cases vs total deaths in india

Select location, date, total_cases, total_deaths, (total_deaths/total_cases) * 100 as DeathPercentage
From PortfolioProject..CovidDeaths
where location='India'
Order by 1,2

-- Total cases vs population in india

Select location, date, total_cases, population, (total_cases/population) * 100 as PercentageCases
From PortfolioProject..CovidDeaths
where location='India'
Order by 1,2

-- Looking at countries with highest infection rate with respect to population

Select location, population, MAX(total_cases) as HighestInfectionCount, MAX(total_cases/population) * 100 as PercentageCases
From PortfolioProject..CovidDeaths
Group by location, population
Order by PercentageCases Desc

-- Looking at countries with highest death count per population

Select location, population, MAX(cast(total_deaths as int)) as HighestDeaths, MAX(cast(total_deaths as int)/population) * 100 as DeathsPercent
From PortfolioProject..CovidDeaths
Group by location, population
Order by DeathsPercent Desc

Select date, SUM(new_cases) as total_cases, SUM(cast(new_deaths as int)) as total_deaths, SUM(cast(new_deaths as int))/SUM(new_cases) * 100 as DeathsPercent
From PortfolioProject..CovidDeaths
where continent is not null
Group by date
Order by 1,2

Select SUM(new_cases) as total_cases, SUM(cast(new_deaths as int)) as total_deaths, SUM(cast(new_deaths as int))/SUM(new_cases) * 100 as DeathsPercent
From PortfolioProject..CovidDeaths
where continent is not null
--Group by date
Order by 1,2

-- Looking at totalpopulation vs vaccination

Select dea.continent, dea.location, dea.date, dea.population, vac.new_vaccinations
From PortfolioProject..CovidDeaths dea
join PortfolioProject..CovidVaccinations vac
	on dea.location = vac.location
	and dea.date = vac.date
where dea.continent	is not null
order by 1,2,3