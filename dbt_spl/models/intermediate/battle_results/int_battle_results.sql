with create_battle_id as (
    select
        *,
        to_char(battle_period, 'yyyymmddhh0000') as pre_battle_id,
        row_number() over (
            partition by season, battle_period
            order by battle_period
        ) as row_num
    from {{ ref('cln_battle_results') }}
)

select
    cast(
        (cast(pre_battle_id as number(15, 0)) + row_num) as varchar
    ) as battle_id,
    season,
    battle_period,
    game_ver,
    lobby,
    battle_mode,
    battle_stage,
    battle_time,
    win,
    knockout,
    battle_rank,
    power,
    alpha_inked,
    alpha_ink_percent,
    alpha_count,
    alpha_color,
    alpha_theme,
    bravo_inked,
    bravo_ink_percent,
    bravo_count,
    bravo_color,
    bravo_theme,
    a1_weapon,
    a1_kill_assist,
    a1_kill,
    a1_assist,
    a1_death,
    a1_special,
    a1_inked,
    a1_abilities,
    a2_weapon,
    a2_kill_assist,
    a2_kill,
    a2_assist,
    a2_death,
    a2_special,
    a2_inked,
    a2_abilities,
    a3_weapon,
    a3_kill_assist,
    a3_kill,
    a3_assist,
    a3_death,
    a3_special,
    a3_inked,
    a3_abilities,
    a4_weapon,
    a4_kill_assist,
    a4_kill,
    a4_assist,
    a4_death,
    a4_special,
    a4_inked,
    a4_abilities,
    b1_weapon,
    b1_kill_assist,
    b1_kill,
    b1_assist,
    b1_death,
    b1_special,
    b1_inked,
    b1_abilities,
    b2_weapon,
    b2_kill_assist,
    b2_kill,
    b2_assist,
    b2_death,
    b2_special,
    b2_inked,
    b2_abilities,
    b3_weapon,
    b3_kill_assist,
    b3_kill,
    b3_assist,
    b3_death,
    b3_special,
    b3_inked,
    b3_abilities,
    b4_weapon,
    b4_kill_assist,
    b4_kill,
    b4_assist,
    b4_death,
    b4_special,
    b4_inked,
    b4_abilities,
    medal1_grade,
    medal1_name,
    medal2_grade,
    medal2_name,
    medal3_grade,
    medal3_name,
    event_name
from create_battle_id
