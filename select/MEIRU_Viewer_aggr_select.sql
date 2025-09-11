show tables;

select member.sex, count(screen.ident) as anx_symptoms
from screens screen 
left join dss_members member on member.ident = screen.ident
where gad7tot >= 9 and member.site = 2
group by member.sex;

select member.sex, count(screen.ident) as drp_symptoms
from screens screen 
left join dss_members member on member.ident = screen.ident
where phq9tot >= 9 and member.site = 1
group by member.sex;

select distinct screen.ident, max(phq9tot)
from screens screen
left join dss_members member on member.ident = screen.ident
where phq9tot >= 9
group by ident;

select date_format(intdate, '%Y') As year, count(ident) as anx_symptoms
from screens
where gad7tot >= 9
group by date_format(intdate, '%Y');

select
case
	when gad7tot between 0 and 4 then 'Minimal'
    when gad7tot between 5 and 9 then 'Mild'
    when gad7tot between 10 and 14 then 'Moderate'
    when gad7tot between 15 and 21 then 'Severe'
    else 'unkown'
end as severity,
count(ident)
from screens
group by severity;

select count(id) from screens;

select source, count(ident) from screens group by source;

select ident, count(*) as screens
from screens 
group by ident
having count(*) > 1
order by screens desc;

-- idents with more than one screen 
select count(ident)
from screens
where ident in (select ident
from screens 
group by ident
having count(*) > 1);

