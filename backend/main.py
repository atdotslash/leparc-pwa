from fastapi import FastAPI

from models import ImpactInput, ImpactOutput
from physics import build_spanish_feedback, calculate_impact, find_equivalent_object

app = FastAPI(
    title="LeParc PWA API",
    version="0.1.0",
    description="Backend para rutinas, registros de pesos y física gamificada.",
)


@app.get("/health")
def health_check() -> dict[str, str]:
    return {"status": "ok"}


@app.post("/calculate-impact", response_model=ImpactOutput)
def calculate_impact_endpoint(payload: ImpactInput) -> ImpactOutput:
    total_joules = calculate_impact(
        weight_kg=payload.weight_kg,
        reps=payload.reps,
        displacement_m=payload.displacement_m,
    )
    equivalent_object = find_equivalent_object(total_joules)
    feedback_message = build_spanish_feedback(total_joules, equivalent_object)

    return ImpactOutput(
        total_joules=round(total_joules, 2),
        equivalent_object=equivalent_object,
        message_es_ar=feedback_message,
    )
