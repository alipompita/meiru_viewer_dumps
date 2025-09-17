select date_format(intdate, '%Y') AS year, COUNT(id) AS symptoms
from screens s
left join dss_members m on m.ident = s.ident
where phq9tot >= 9
-- add filters 
group by date_format(intdate, '%Y')
order by year asc;


select date_format(intdate, '%Y') AS year, COUNT(id) AS symptoms
from screens s
left join dss_members m on m.ident = s.ident
where gad7tot >= 9
-- add filters 
group by date_format(intdate, '%Y')
order by year asc;
