/* Question: What are the most in-demand skills for data engineers?
    -Identify the top 10 in-demand skills for data engineers
    -Focus on job postings in the United States.
    - Why?  Retrieves the top 10 skills with the highest demand in the remote job market, 
        providing insights into the most valuable skills for data engineers seeking jobs in United States.
*/

SELECT 
    sd.skills,
    COUNT(jpf.*) AS demand_count

FROM job_postings_fact AS jpf 
INNER JOIN skills_job_dim AS sjd  
ON jpf.job_id = sjd.job_id

INNER JOIN skills_dim AS sd 
ON sjd.skill_id = sd.skill_id

WHERE jpf.job_title_short = 'Data Engineer' 
AND jpf.job_country = 'United States'

GROUP BY sd.skills 
ORDER BY demand_count DESC 

LIMIT 10;

/*
Here's the breakdown of the most in-demand skills for Data Engineers:
SQL and Python are by far the most in-demand skills, with over 55,000 postings each. Making them the most saught-after skills.
Cloud expertise essential, with AWS and Azuure, reflecting the industry's reliance on cloud-based data platforms.
Apache Spark ranks fifth with almost 27,000 postings, underscoring the continued importance of large scale data processing.

Key takeaways:
- SQL and PYthon remain the foundational skiils for data engineering roles.
- Cloud expertise is a core requirement for many employers.
- Big data processing frameworks like Spark continue to be highly valued.
- Data pipeline tools (Snowflake and Databricks) show growing demand. 
- Data and distribution systems skills (Java, Scala, Kafka) remain in strong demand. 
┌────────────┬──────────────┐
│   skills   │ demand_count │
│  varchar   │    int64     │
├────────────┼──────────────┤
│ sql        │        56933 │
│ python     │        55159 │
│ aws        │        35698 │
│ azure      │        29236 │
│ spark      │        26768 │
│ snowflake  │        19996 │
│ java       │        19405 │
│ databricks │        15430 │
│ scala      │        14921 │
│ kafka      │        14688 │
└────────────┴──────────────┘
  10 rows         2 columns |
*/