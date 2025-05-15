with
{% set dict_val = {'a': 'alpha', 'b': 'bravo'} %}
{% for key, value in dict_val.items() %}
    {% for i in range(1, 5) %}
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
                {{ key }}{{ i }}_abilities   as abilities
            from {{ ref('int_battle_results') }}
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
-- original query
----------------------------------------------------------------
-- with a1 as (
-- select 
--     battle_id,
--     season,
--     battle_period,
--     win,
--     'alpha' as team,
--     'a1' as member_id,
--     a1_weapon      as weapon,
--     a1_kill_assist as kill_assist,
--     a1_kill        as kill,
--     a1_assist      as assist,
--     a1_death       as death,
--     a1_special     as special,
--     a1_inked       as inked,
--     a1_abilities   as abilities,
-- from {{ ref('int_battle_results') }}
-- ),
-- a2 as (
-- select 
--     battle_id,
--     season,
--     battle_period,
--     win,
--     'alpha' as team,
--     'a2' as member_id,
--     a2_weapon      as weapon,
--     a2_kill_assist as kill_assist,
--     a2_kill        as kill,
--     a2_assist      as assist,
--     a2_death       as death,
--     a2_special     as special,
--     a2_inked       as inked,
--     a2_abilities   as abilities,
-- from {{ ref('int_battle_results') }}
-- ),
-- a3 as (
-- select 
--     battle_id,
--     season,
--     battle_period,
--     win,
--     'alpha' as team,
--     'a3' as member_id,
--     a3_weapon      as weapon,
--     a3_kill_assist as kill_assist,
--     a3_kill        as kill,
--     a3_assist      as assist,
--     a3_death       as death,
--     a3_special     as special,
--     a3_inked       as inked,
--     a3_abilities   as abilities,
-- from {{ ref('int_battle_results') }}
-- ),
-- a4 as (
-- select 
--     battle_id,
--     season,
--     battle_period,
--     win,
--     'alpha' as team,
--     'a4' as member_id,
--     a4_weapon      as weapon,
--     a4_kill_assist as kill_assist,
--     a4_kill        as kill,
--     a4_assist      as assist,
--     a4_death       as death,
--     a4_special     as special,
--     a4_inked       as inked,
--     a4_abilities   as abilities,
-- from {{ ref('int_battle_results') }}
-- ),
-- b1 as (
-- select 
--     battle_id,
--     season,
--     battle_period,
--     win,
--     'bravo' as team,
--     'b1' as member_id,
--     b1_weapon      as weapon,
--     b1_kill_assist as kill_assist,
--     b1_kill        as kill,
--     b1_assist      as assist,
--     b1_death       as death,
--     b1_special     as special,
--     b1_inked       as inked,
--     b1_abilities   as abilities,
-- from {{ ref('int_battle_results') }}
-- ),
-- b2 as (
-- select 
--     battle_id,
--     season,
--     battle_period,
--     win,
--     'bravo' as team,
--     'b2' as member_id,
--     b2_weapon      as weapon,
--     b2_kill_assist as kill_assist,
--     b2_kill        as kill,
--     b2_assist      as assist,
--     b2_death       as death,
--     b2_special     as special,
--     b2_inked       as inked,
--     b2_abilities   as abilities,
-- from {{ ref('int_battle_results') }}
-- ),
-- b3 as (
-- select 
--     battle_id,
--     season,
--     battle_period,
--     win,
--     'bravo' as team,
--     'b3' as member_id,
--     b3_weapon      as weapon,
--     b3_kill_assist as kill_assist,
--     b3_kill        as kill,
--     b3_assist      as assist,
--     b3_death       as death,
--     b3_special     as special,
--     b3_inked       as inked,
--     b3_abilities   as abilities,
-- from {{ ref('int_battle_results') }}
-- ),
-- b4 as (
-- select 
--     battle_id,
--     season,
--     battle_period,
--     win,
--     'bravo' as team,
--     'b4' as member_id,
--     b4_weapon      as weapon,
--     b4_kill_assist as kill_assist,
--     b4_kill        as kill,
--     b4_assist      as assist,
--     b4_death       as death,
--     b4_special     as special,
--     b4_inked       as inked,
--     b4_abilities   as abilities,
-- from {{ ref('int_battle_results') }}
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
