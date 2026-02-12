from pydantic import BaseModel, Field


class ImpactInput(BaseModel):
    """Payload for physics impact calculation."""

    weight_kg: float = Field(..., gt=0, description="Weight lifted in kilograms")
    reps: int = Field(..., gt=0, description="Number of repetitions")
    displacement_m: float = Field(
        default=0.5,
        gt=0,
        description="Average vertical displacement per rep in meters",
    )


class ImpactOutput(BaseModel):
    """API response for impact calculation."""

    total_joules: float
    equivalent_object: str
    message_es_ar: str
