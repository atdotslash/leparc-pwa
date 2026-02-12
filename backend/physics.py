from __future__ import annotations

from dataclasses import dataclass

GRAVITY_M_S2 = 9.81


@dataclass(frozen=True)
class EquivalentObject:
    name: str
    mass_kg: float


EQUIVALENT_OBJECTS = [
    EquivalentObject(name="una mancuerna liviana", mass_kg=5),
    EquivalentObject(name="un bidón de agua", mass_kg=20),
    EquivalentObject(name="una moto chica", mass_kg=120),
    EquivalentObject(name="un auto compacto (tipo Twingo)", mass_kg=950),
    EquivalentObject(name="una camioneta", mass_kg=1800),
]


def calculate_impact(weight_kg: float, reps: int, displacement_m: float = 0.5) -> float:
    """
    Compute total mechanical work in Joules.

    Formula: W = m * g * h * reps
    """
    return weight_kg * GRAVITY_M_S2 * displacement_m * reps


def find_equivalent_object(total_joules: float, displacement_m: float = 1.0) -> str:
    """
    Find an equivalent object based on the energy required to raise it 1 meter.
    """
    if total_joules <= 0:
        return EQUIVALENT_OBJECTS[0].name

    best_match = EQUIVALENT_OBJECTS[0]
    best_diff = float("inf")

    for obj in EQUIVALENT_OBJECTS:
        reference_joules = obj.mass_kg * GRAVITY_M_S2 * displacement_m
        diff = abs(reference_joules - total_joules)
        if diff < best_diff:
            best_diff = diff
            best_match = obj

    return best_match.name


def build_spanish_feedback(total_joules: float, equivalent_object: str) -> str:
    rounded_joules = round(total_joules, 2)
    return (
        f"¡Metiste {rounded_joules} J de energía! "
        f"Eso equivale a levantar {equivalent_object}."
    )
