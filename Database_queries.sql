-- Let's start addressing our business question or study questions

-- The number of cases of COVID-19 per geographical area: 
-- Note: the table worldometer doesn't include China, however, the table country_wise does

-- 1. Continent
SELECT SUM(totalcases) AS cases,continent  FROM public.worldometer
	GROUP BY continent
		ORDER BY cases DESC;
		
-- 3. Country
SELECT SUM(totalcases) AS cases, country FROM public.worldometer
	GROUP BY country
		ORDER BY cases DESC;
		
SELECT SUM(confirmed) AS cases,country  FROM public.country_wise
	GROUP BY country
		ORDER BY cases DESC;


-- The number of deaths of COVID-19 per geographical area: 
-- 1. Continent
SELECT SUM(totaldeaths) AS deaths, continent FROM public.worldometer
	GROUP BY continent
		ORDER BY deaths DESC;

-- 2. Country: 
-- Note: the table worldometer doesn't include China, however, the table country_wise does

SELECT SUM(totaldeaths) AS deaths,country  FROM public.worldometer
	GROUP BY country
		ORDER BY deaths DESC;
		
SELECT SUM(deaths) AS deaths,country  FROM public.country_wise
	GROUP BY country
		ORDER BY deaths DESC;
		
-- The number of individuals who returned home after recovering from the Covid-19 in each country, continent
-- Continent
SELECT SUM(totalrecovered) AS recovered, continent FROM public.worldometer
	GROUP BY continent
		ORDER BY recovered DESC;
		
-- Country
SELECT SUM(totalrecovered) AS recovered,country  FROM public.worldometer
	GROUP BY country
		ORDER BY recovered DESC;
		

SELECT SUM(recovered) AS recovered,country  FROM public.country_wise
	GROUP BY country
		ORDER BY recovered DESC;

-- Assessing the efficacy of treatment modalities by geographical area nation, continent

-- Continent
SELECT continent, ROUND((SUM(totalrecovered) * 100)/SUM(totalcases),2)  AS efficacy_pourcentage
	FROM public.worldometer
		GROUP BY continent
			ORDER BY efficacy_pourcentage DESC;

-- Country
SELECT country, ROUND((SUM(totalrecovered) * 100)/SUM(totalcases),2)  AS efficacy_pourcentage
	FROM public.worldometer
		GROUP BY country
			ORDER BY efficacy_pourcentage DESC;			
			
-- Active cases of Covid-19 per day 2020-01-22 to 2020-07-27
-- Worldwide
SELECT date, active FROM public.covid19_clan
	WHERE country != 'US'
		GROUP BY date, active
			ORDER BY date;

-- United States
SELECT date, active FROM public.covid19_clan
	WHERE country = 'US'
		GROUP BY date, active
			ORDER BY date;

-- United States
SELECT date, SUM(confirmed) AS confirm FROM public.usa_wise
	GROUP BY date
		ORDER BY date

SELECT date, SUM(deaths) AS death FROM public.usa_wise
	GROUP BY date
		ORDER BY date;









	
