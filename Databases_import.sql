CREATE TABLE Country_wise(
	Country varchar(50) NOT NULL,
	Confirmed int CHECK(Confirmed=0 OR Confirmed>0), 
	Deaths int CHECK( Deaths=0 OR Deaths>0),
	Recovered int CHECK( Recovered=0 OR Recovered>0),
	Active int CHECK( Active=0 OR Active>0), 
	New_cases int CHECK( New_cases=0 OR New_cases>0),
	New_deaths int CHECK( New_deaths=0 OR New_deaths>0),
	New_recovered int CHECK( New_recovered=0 OR New_recovered>0),
	WHO_Region varchar(50),
	CONSTRAINT Country_wise_pkey PRIMARY KEY (Country)
);

CREATE TABLE Day_wise(
	Date date NOT NULL,
	Confirmed int  CHECK( Confirmed=0 OR Confirmed>0), 
	Deaths int CHECK( Deaths=0 OR Deaths>0),
	Recovered int CHECK( Recovered=0 OR Recovered>0),
	Active int CHECK( Active=0 OR Active>0),
	New_cases int CHECK( New_cases=0 OR New_cases>0),
	New_deaths int CHECK( New_deaths=0 OR New_deaths>0),
	New_recovered int CHECK( New_recovered=0 OR New_recovered>0),
	Number_of_countries smallint CHECK( Number_of_countries=0 OR Number_of_countries>0),
	CONSTRAINT Day_wise_pkey PRIMARY KEY (Date)
);

CREATE TABLE Full_detail(
	Country varchar(50) NOT NULL,
	Date date NOT NULL,
	Confirmed int CHECK( Confirmed=0 OR Confirmed>0), 
	Deaths int  CHECK( Deaths=0 OR Deaths>0),
	Recovered int CHECK( Recovered=0 OR Recovered>0),
	Active int CHECK( Active=0 OR Active>0), 
	New_cases int CHECK( New_cases=0 OR New_cases>0),
	New_deaths int CHECK( New_deaths=0 OR New_deaths>0),
	New_recovered int CHECK( New_recovered=0 OR New_recovered>0),
	WHO_Region varchar(50),
	CONSTRAINT Full_detail_pkey PRIMARY KEY (Country,Date)
);

CREATE TABLE Covid19_clan(
	Country varchar(50) NOT NULL,
	Date date NOT NULL,
	Confirmed int CHECK( Confirmed=0 OR Confirmed>0), 
	Deaths int CHECK( Deaths=0 OR Deaths>0),
	Recovered int CHECK( Recovered=0 OR Recovered>0),
	Active int CHECK( Active=0 OR Active>0), 
	WHO_Region varchar(50),
	CONSTRAINT Covid19_clan_pkey PRIMARY KEY (Country,Date, WHO_Region),
	CONSTRAINT Covid19_clan_fkey FOREIGN KEY (Country,Date, WHO_Region) REFERENCES Full_detail (Country,Date)
		ON DELETE SET NULL
);

CREATE TABLE USA_wise(
	City varchar(50) NOT NULL,
	Date date NOT NULL,
	Confirmed int CHECK( Confirmed=0 OR Confirmed>0), 
	Deaths int CHECK( Deaths=0 OR Deaths>0),
	CONSTRAINT USA_wise_pkey PRIMARY KEY (City,Date)
);

CREATE TABLE Worldometer(
	Country varchar(50) NOT NULL,
	Continent varchar(30),
	Population bigint CHECK( Population=0 OR Population>0),
	TotalCases bigint CHECK( TotalCases=0 OR TotalCases>0),
	TotalDeaths bigint CHECK( TotalDeaths=0 OR TotalDeaths>0),
	TotalRecovered bigint CHECK( TotalRecovered=0 OR TotalRecovered>0),
	ActiveCases bigint CHECK( ActiveCases=0 OR ActiveCases>0),
	Serious_Critical int CHECK( Serious_Critical=0 OR Serious_Critical>0),
	TotalTests bigint CHECK( TotalTests=0 OR TotalTests>0),
	WHO_Region varchar(30),
	CONSTRAINT Worldometer_pkey PRIMARY KEY (Country)
);

CREATE TABLE USA_city_Covid19(
	City varchar(50) NOT NULL,
	Total_cases int CHECK( Total_cases=0 OR Total_cases>0),
	Total_deaths int CHECK( Total_deaths=0 OR Total_deaths>0),
	Active_cases int CHECK( Active_cases=0 OR Active_cases>0),
	Total_tests int CHECK( Total_tests=0 OR Total_tests>0),
	Date date,
	CONSTRAINT USA_city_Covid19_pkey PRIMARY KEY (City, Date)
);

CREATE TABLE Covid_data(
	continent varchar(50) NOT NULL,
	date date NOT NULL,
	total_cases int CHECK( total_cases=0 OR total_cases>0),
	total_deaths int CHECK( total_deaths=0 OR total_deaths>0),
	reproduction_rate decimal CHECK( reproduction_rate=0 OR reproduction_rate>0),
	total_tests int CHECK( total_tests=0 OR total_tests>0),
	positive_rate numeric CHECK( positive_rate=0 OR positive_rate>0),
	population bigint CHECK( population=0 OR population>0),
	population_density decimal CHECK( population_density=0 OR population_density>0),
	median_age numeric CHECK( median_age=0 OR median_age>0),
	aged_65_older numeric CHECK( aged_65_older=0 OR aged_65_older>0),
	life_expectancy decimal CHECK( life_expectancy=0 OR life_expectancy>0),
	CONSTRAINT Covid_data_pkey PRIMARY KEY (continent, date)
);