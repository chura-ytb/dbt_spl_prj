with weapons_tbl as (
    select distinct a1_weapon as weapon
    from {{ ref('cln_battle_results') }}
    union all
    select distinct a2_weapon as weapon
    from {{ ref('cln_battle_results') }}
    union all
    select distinct a3_weapon as weapon
    from {{ ref('cln_battle_results') }}
    union all
    select distinct a4_weapon as weapon
    from {{ ref('cln_battle_results') }}
    union all
    select distinct b1_weapon as weapon
    from {{ ref('cln_battle_results') }}
    union all
    select distinct b2_weapon as weapon
    from {{ ref('cln_battle_results') }}
    union all
    select distinct b3_weapon as weapon
    from {{ ref('cln_battle_results') }}
    union all
    select distinct b4_weapon as weapon
    from {{ ref('cln_battle_results') }}
)

select distinct weapon
from weapons_tbl
