-- Q1: Yearly Analysis & Bird Strikes in the US
SELECT YEAR(`FlightDate`) as Year, COUNT(*) as Number_of_Bird_Strikes
FROM Bird_Stricks
GROUP BY Year;

-- Q2: Top 10 US Airlines in terms of having encountered bird strikes
SELECT `Aircraft: Airline/Operator`, COUNT(*) as Number_of_Bird_Strikes
FROM Bird_Stricks
GROUP BY `Aircraft: Airline/Operator`
ORDER BY Number_of_Bird_Strikes DESC
LIMIT 10;

-- Q3: Airports with most incidents of bird strikes – Top 50
SELECT `Airport: Name`, COUNT(*) as Number_of_Bird_Strikes
FROM Bird_Stricks
GROUP BY `Airport: Name`
ORDER BY Number_of_Bird_Strikes DESC
LIMIT 50;

-- Q4: Yearly Cost Incurred due to Bird Strikes
SELECT YEAR(`FlightDate`) as Year, SUM(`Cost: Total $`) as Total_Cost
FROM Bird_Stricks
GROUP BY Year;

-- Q5: When do most bird strikes occur?
-- This would depend on the granularity of time you're interested in (e.g., time of day, month, season, etc.). Here's an example for month:
SELECT MONTH(`FlightDate`) as Month, COUNT(*) as Number_of_Bird_Strikes
FROM Bird_Stricks
GROUP BY Month
ORDER BY Number_of_Bird_Strikes DESC;

-- Q6: Altitude of aeroplanes at the time of strike
-- This would typically involve creating a histogram of the `Altitude bin` column, which is beyond the scope of SQL. However, you can retrieve the data with this query:
SELECT `Altitude bin`, COUNT(*) as Number_of_Bird_Strikes
FROM Bird_Stricks
GROUP BY `Altitude bin`;

-- Q7: Phase of flight at the time of the strike
SELECT `When: Phase of flight`, COUNT(*) as Number_of_Bird_Strikes
FROM Bird_Stricks
GROUP BY `When: Phase of flight`;

-- Q8: Average Altitude of the aeroplanes in different phases at the time of strike
SELECT `When: Phase of flight`, AVG(`Altitude bin`) as Average_Altitude
FROM Bird_Stricks
GROUP BY `When: Phase of flight`;

-- Q9: Effect of Bird Strikes & Impact on Flight
SELECT `Effect: Impact to flight`, COUNT(*) as Number_of_Bird_Strikes
FROM Bird_Stricks
GROUP BY `Effect: Impact to flight`;

-- Q10: Effect of Strike at Different Altitude
SELECT `Altitude bin`, `Effect: Impact to flight`, COUNT(*) as Number_of_Bird_Strikes
FROM Bird_Stricks
GROUP BY `Altitude bin`, `Effect: Impact to flight`;

-- Q11: Were Pilots Informed? & Prior Warning and Effect of Strike Relation
SELECT `Pilot warned of birds or wildlife?`, `Effect: Impact to flight`, COUNT(*) as Number_of_Bird_Strikes
FROM Bird_Stricks
GROUP BY `Pilot warned of birds or wildlife?`, `Effect: Impact to flight`;

-- Q12: What is the total cost incurred due to bird strikes for each airline operator?
SELECT `Aircraft: Airline/Operator`, SUM(`Cost: Total $`) as Total_Cost
FROM Bird_Stricks
GROUP BY `Aircraft: Airline/Operator`;

-- Q13: Which aircraft type has encountered the most bird strikes?
SELECT `Aircraft: Type`, COUNT(*) as Number_of_Bird_Strikes
FROM Bird_Stricks
GROUP BY `Aircraft: Type`
ORDER BY Number_of_Bird_Strikes DESC
LIMIT 1;

-- Q14: How does the phase of flight affect the impact of bird strikes on the flight?
SELECT `When: Phase of flight`, COUNT(*) as Number_of_Bird_Strikes, SUM(`Effect: Impact to flight`) as Total_Impact
FROM Bird_Stricks
GROUP BY `When: Phase of flight`;

-- Q15: Are there any specific weather conditions (like precipitation or sky conditions) that correlate with a higher number of bird strikes?
SELECT `Conditions: Precipitation`, `Conditions: Sky`, COUNT(*) as Number_of_Bird_Strikes
FROM Bird_Stricks
GROUP BY `Conditions: Precipitation`, `Conditions: Sky`
ORDER BY Number_of_Bird_Strikes DESC;

-- Q16: How does the size of the wildlife affect the number of people injured in bird strikes?
SELECT `Wildlife: Size`, AVG(`Number of people injured`) as Average_Number_of_People_Injured
FROM Bird_Stricks
GROUP BY `Wildlife: Size`;
