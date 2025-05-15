with
{% set dict_val = {'a': 'alpha', 'b': 'bravo'} %}
{% for key, value in dict_val.items() %}
    {% for i in range(1, 5) %}
        {{ key }}{{ i }} as (
            select
                t.battle_id,
                t.season,
                t.battle_period,
                t.win,
                '{{ value }}' as team,
                '{{ key }}{{ i }}' as member_id,
                obj.key as ability_name,
                cast(obj.value as number(38, 1)) as ability_value
            from
                {{ ref('int_battle_results') }} as t,
                lateral flatten(
                    input => parse_json(t.{{ key }}{{ i }}_abilities)
                ) as obj
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
--     t.battle_id,
--     t.win,
--     'alpha' as team,
--     'a1' as member_id,
--     obj.key as ability_name,
--     cast(obj.value as number(38, 1)) as ability_value
-- from 
--     {{ ref('int_battle_results') }} as t, 
--     lateral flatten(input => parse_json(t.a1_abilities)) obj
-- ), 
-- a2 as (
-- select 
--     t.battle_id,
--     t.win,
--     'alpha' as team,
--     'a2' as member_id,
--     obj.key as ability_name,
--     cast(obj.value as number(38, 1)) as ability_value
-- from 
--     {{ ref('int_battle_results') }} as t, 
--     lateral flatten(input => parse_json(t.a2_abilities)) obj
-- ), 
-- a3 as (
-- select 
--     t.battle_id,
--     t.win,
--     'alpha' as team,
--     'a3' as member_id,
--     obj.key as ability_name,
--     cast(obj.value as number(38, 1)) as ability_value
-- from 
--     {{ ref('int_battle_results') }} as t, 
--     lateral flatten(input => parse_json(t.a3_abilities)) obj
-- ), 
-- a4 as (
-- select 
--     t.battle_id,
--     t.win,
--     'alpha' as team,
--     'a4' as member_id,
--     obj.key as ability_name,
--     cast(obj.value as number(38, 1)) as ability_value
-- from 
--     {{ ref('int_battle_results') }} as t, 
--     lateral flatten(input => parse_json(t.a4_abilities)) obj
-- ), 
-- b1 as (
-- select 
--     t.battle_id,
--     t.win,
--     'bravo' as team,
--     'b1' as member_id,
--     obj.key as ability_name,
--     cast(obj.value as number(38, 1)) as ability_value
-- from 
--     {{ ref('int_battle_results') }} as t, 
--     lateral flatten(input => parse_json(t.b1_abilities)) obj
-- ), 
-- b2 as (
-- select 
--     t.battle_id,
--     t.win,
--     'bravo' as team,
--     'b2' as member_id,
--     obj.key as ability_name,
--     cast(obj.value as number(38, 1)) as ability_value
-- from 
--     {{ ref('int_battle_results') }} as t, 
--     lateral flatten(input => parse_json(t.b2_abilities)) obj
-- ), 
-- b3 as (
-- select 
--     t.battle_id,
--     t.win,
--     'bravo' as team,
--     'b3' as member_id,
--     obj.key as ability_name,
--     cast(obj.value as number(38, 1)) as ability_value
-- from 
--     {{ ref('int_battle_results') }} as t, 
--     lateral flatten(input => parse_json(t.b3_abilities)) obj
-- ), 
-- b4 as (
-- select 
--     t.battle_id,
--     t.win,
--     'bravo' as team,
--     'b4' as member_id,
--     obj.key as ability_name,
--     cast(obj.value as number(38, 1)) as ability_value
-- from 
--     {{ ref('int_battle_results') }} as t, 
--     lateral flatten(input => parse_json(t.b4_abilities)) obj
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
