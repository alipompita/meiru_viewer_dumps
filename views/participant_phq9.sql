create or replace view participant_phq9 as
select 
    m.ident,
    m.sex,
    m.dob,
    m.age,
    m.site,
    s.id as screen_id,
    s.intdate,
    s.phq9tot
from dss_members m
left join (
    select sc.ident, sc.id, sc.intdate, sc.phq9tot
    from screens sc
    inner join (
        -- find the max phq9tot per participant
        select ident, max(phq9tot) as max_phq9
        from screens
        group by ident
    ) t
      on sc.ident = t.ident and sc.phq9tot = t.max_phq9
) s
  on m.ident = s.ident;
