-- LeParc PWA - Supabase schema
-- Execute this script in Supabase SQL Editor.

create extension if not exists pgcrypto;

create table if not exists public.profiles (
  id uuid primary key references auth.users(id) on delete cascade,
  full_name text,
  role text not null default 'athlete' check (role in ('athlete', 'coach', 'admin')),
  created_at timestamptz not null default now()
);

create table if not exists public.exercises (
  id uuid primary key default gen_random_uuid(),
  name text not null,
  description text,
  created_by uuid references public.profiles(id) on delete set null,
  created_at timestamptz not null default now()
);

create table if not exists public.logs (
  id uuid primary key default gen_random_uuid(),
  athlete_id uuid not null references public.profiles(id) on delete cascade,
  exercise_id uuid not null references public.exercises(id) on delete restrict,
  weight_kg numeric(6,2) not null check (weight_kg > 0),
  reps integer not null check (reps > 0),
  performed_at timestamptz not null default now(),
  notes text,
  created_at timestamptz not null default now()
);

create index if not exists idx_logs_athlete_id on public.logs(athlete_id);
create index if not exists idx_logs_exercise_id on public.logs(exercise_id);
create index if not exists idx_logs_performed_at on public.logs(performed_at desc);

alter table public.profiles enable row level security;
alter table public.exercises enable row level security;
alter table public.logs enable row level security;

-- PROFILES policies
create policy "profiles_select_self_or_coach"
on public.profiles
for select
using (
  auth.uid() = id
  or exists (
    select 1
    from public.profiles p
    where p.id = auth.uid()
      and p.role in ('coach', 'admin')
  )
);

create policy "profiles_insert_self"
on public.profiles
for insert
with check (auth.uid() = id);

create policy "profiles_update_self_or_admin"
on public.profiles
for update
using (
  auth.uid() = id
  or exists (
    select 1
    from public.profiles p
    where p.id = auth.uid()
      and p.role = 'admin'
  )
)
with check (
  auth.uid() = id
  or exists (
    select 1
    from public.profiles p
    where p.id = auth.uid()
      and p.role = 'admin'
  )
);

-- EXERCISES policies
create policy "exercises_read_all_authenticated"
on public.exercises
for select
using (auth.role() = 'authenticated');

create policy "exercises_insert_coach_or_admin"
on public.exercises
for insert
with check (
  exists (
    select 1
    from public.profiles p
    where p.id = auth.uid()
      and p.role in ('coach', 'admin')
  )
);

create policy "exercises_update_coach_or_admin"
on public.exercises
for update
using (
  exists (
    select 1
    from public.profiles p
    where p.id = auth.uid()
      and p.role in ('coach', 'admin')
  )
)
with check (
  exists (
    select 1
    from public.profiles p
    where p.id = auth.uid()
      and p.role in ('coach', 'admin')
  )
);

-- LOGS policies
create policy "logs_select_own_or_coach"
on public.logs
for select
using (
  athlete_id = auth.uid()
  or exists (
    select 1
    from public.profiles p
    where p.id = auth.uid()
      and p.role in ('coach', 'admin')
  )
);

create policy "logs_insert_self_or_coach"
on public.logs
for insert
with check (
  athlete_id = auth.uid()
  or exists (
    select 1
    from public.profiles p
    where p.id = auth.uid()
      and p.role in ('coach', 'admin')
  )
);

create policy "logs_update_own_or_coach"
on public.logs
for update
using (
  athlete_id = auth.uid()
  or exists (
    select 1
    from public.profiles p
    where p.id = auth.uid()
      and p.role in ('coach', 'admin')
  )
)
with check (
  athlete_id = auth.uid()
  or exists (
    select 1
    from public.profiles p
    where p.id = auth.uid()
      and p.role in ('coach', 'admin')
  )
);

create policy "logs_delete_coach_or_admin"
on public.logs
for delete
using (
  exists (
    select 1
    from public.profiles p
    where p.id = auth.uid()
      and p.role in ('coach', 'admin')
  )
);
