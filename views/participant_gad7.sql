create or replace view participant_gad7 as
select 
    m.ident,
    m.sex,
    m.dob,
    m.age,
    m.site,
    s.id as screen_id,
    s.intdate,
    s.gad7tot
from dss_members m
left join (
    select sc.ident, sc.id, sc.intdate, sc.gad7tot
    from screens sc
    inner join (
        -- find the max gad7tot per participant
        select ident, max(gad7tot) as max_gad7
        from screens
        group by ident
    ) t
      on sc.ident = t.ident and sc.gad7tot = t.max_gad7
) s
  on m.ident = s.ident;
