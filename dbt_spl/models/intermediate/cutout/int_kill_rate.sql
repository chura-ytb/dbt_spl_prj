with 
{% set dict_val = {'a': 'alpha', 'b': 'bravo'} %}
{% for key, value in dict_val.items() %}
{% for i in range(1, 5)%}
{{ key }}{{ i }} as (
select 
    battle_id,
    season,
    battle_period,
    win,
    '{{ value }}' as team,
    '{{ key }}{{ i }}' as member_id,
    {{ key }}{{ i }}_weapon      as weapon,
    {{ key }}{{ i }}_kill_assist as kill_assist,
    {{ key }}{{ i }}_kill        as kill,
    {{ key }}{{ i }}_assist      as assist,
    {{ key }}{{ i }}_death       as death,
    {{ key }}{{ i }}_special     as special,
    {{ key }}{{ i }}_inked       as inked,
    {{ key }}{{ i }}_abilities   as abilities,
from {{ref('int_battle_results')}}
),
{% endfor %}
{% endfor %}
final as (
{% for key in ['a', 'b'] %}
{% for i in range(1, 5) %}
select * from {{ key }}{{ i }}
{% if not loop.last %}
union all
{% endif %}
{% endfor %}
{% if not loop.last %}
union all
{% endif %}
{% endfor %}
)
select * 
from final


----------------------------------------------------------------
-- Original Query
----------------------------------------------------------------
-- with a1 as (
-- select 
--     BATTLE_ID,
--     SEASON,
--     BATTLE_PERIOD,
--     WIN,
--     'alpha' as TEAM,
--     'a1' as MEMBER_ID,
--     A1_WEAPON      as WEAPON,
--     A1_KILL_ASSIST as KILL_ASSIST,
--     A1_KILL        as KILL,
--     A1_ASSIST      as ASSIST,
--     A1_DEATH       as DEATH,
--     A1_SPECIAL     as SPECIAL,
--     A1_INKED       as INKED,
--     A1_ABILITIES   as ABILITIES,
-- from {{ref('int_battle_results')}}
-- ),
-- a2 as (
-- select 
--     BATTLE_ID,
--     SEASON,
--     BATTLE_PERIOD,
--     WIN,
--     'alpha' as TEAM,
--     'a2' as MEMBER_ID,
--     A2_WEAPON      as WEAPON,
--     A2_KILL_ASSIST as KILL_ASSIST,
--     A2_KILL        as KILL,
--     A2_ASSIST      as ASSIST,
--     A2_DEATH       as DEATH,
--     A2_SPECIAL     as SPECIAL,
--     A2_INKED       as INKED,
--     A2_ABILITIES   as ABILITIES,
-- from {{ref('int_battle_results')}}
-- ),
-- a3 as (
-- select 
--     BATTLE_ID,
--     SEASON,
--     BATTLE_PERIOD,
--     WIN,
--     'alpha' as TEAM,
--     'a3' as MEMBER_ID,
--     A3_WEAPON      as WEAPON,
--     A3_KILL_ASSIST as KILL_ASSIST,
--     A3_KILL        as KILL,
--     A3_ASSIST      as ASSIST,
--     A3_DEATH       as DEATH,
--     A3_SPECIAL     as SPECIAL,
--     A3_INKED       as INKED,
--     A3_ABILITIES   as ABILITIES,
-- from {{ref('int_battle_results')}}
-- ),
-- a4 as (
-- select 
--     BATTLE_ID,
--     SEASON,
--     BATTLE_PERIOD,
--     WIN,
--     'alpha' as TEAM,
--     'a4' as MEMBER_ID,
--     A4_WEAPON      as WEAPON,
--     A4_KILL_ASSIST as KILL_ASSIST,
--     A4_KILL        as KILL,
--     A4_ASSIST      as ASSIST,
--     A4_DEATH       as DEATH,
--     A4_SPECIAL     as SPECIAL,
--     A4_INKED       as INKED,
--     A4_ABILITIES   as ABILITIES,
-- from {{ref('int_battle_results')}}
-- ),
-- b1 as (
-- select 
--     BATTLE_ID,
--     SEASON,
--     BATTLE_PERIOD,
--     WIN,
--     'bravo' as TEAM,
--     'b1' as MEMBER_ID,
--     B1_WEAPON      as WEAPON,
--     B1_KILL_ASSIST as KILL_ASSIST,
--     B1_KILL        as KILL,
--     B1_ASSIST      as ASSIST,
--     B1_DEATH       as DEATH,
--     B1_SPECIAL     as SPECIAL,
--     B1_INKED       as INKED,
--     B1_ABILITIES   as ABILITIES,
-- from {{ref('int_battle_results')}}
-- ),
-- b2 as (
-- select 
--     BATTLE_ID,
--     SEASON,
--     BATTLE_PERIOD,
--     WIN,
--     'bravo' as TEAM,
--     'b2' as MEMBER_ID,
--     B2_WEAPON      as WEAPON,
--     B2_KILL_ASSIST as KILL_ASSIST,
--     B2_KILL        as KILL,
--     B2_ASSIST      as ASSIST,
--     B2_DEATH       as DEATH,
--     B2_SPECIAL     as SPECIAL,
--     B2_INKED       as INKED,
--     B2_ABILITIES   as ABILITIES,
-- from {{ref('int_battle_results')}}
-- ),
-- b3 as (
-- select 
--     BATTLE_ID,
--     SEASON,
--     BATTLE_PERIOD,
--     WIN,
--     'bravo' as TEAM,
--     'b3' as MEMBER_ID,
--     B3_WEAPON      as WEAPON,
--     B3_KILL_ASSIST as KILL_ASSIST,
--     B3_KILL        as KILL,
--     B3_ASSIST      as ASSIST,
--     B3_DEATH       as DEATH,
--     B3_SPECIAL     as SPECIAL,
--     B3_INKED       as INKED,
--     B3_ABILITIES   as ABILITIES,
-- from {{ref('int_battle_results')}}
-- ),
-- b4 as (
-- select 
--     BATTLE_ID,
--     SEASON,
--     BATTLE_PERIOD,
--     WIN,
--     'bravo' as TEAM,
--     'b4' as MEMBER_ID,
--     B4_WEAPON      as WEAPON,
--     B4_KILL_ASSIST as KILL_ASSIST,
--     B4_KILL        as KILL,
--     B4_ASSIST      as ASSIST,
--     B4_DEATH       as DEATH,
--     B4_SPECIAL     as SPECIAL,
--     B4_INKED       as INKED,
--     B4_ABILITIES   as ABILITIES,
-- from {{ref('int_battle_results')}}
-- ),
-- final as (
-- select * from a1
-- union all
-- select * from a2
-- union all
-- select * from a3
-- union all
-- select * from a4
-- union all
-- select * from b1
-- union all
-- select * from b2
-- union all
-- select * from b3
-- union all
-- select * from b4
-- )
-- select * 
-- from final