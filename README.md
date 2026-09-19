# Foot drop: simulating functional electrical stimulation of the ankle

Foot drop is the inability to dorsiflex the ankle during the swing phase of
gait: the toes catch on the ground because tibialis anterior is not lifting the
foot. One treatment is functional electrical stimulation, a surface electrode
firing TA at the right moment in the swing phase.

This is a MATLAB simulation of that ankle, built to answer a design question:
**when in the swing phase should the stimulus fire, and at what frequency and
amplitude, to clear the toes without over-dorsiflexing?**

```matlab
MainFile
```

## The model

Two antagonist muscles acting about the ankle, each as a Hill-type
muscle-tendon unit:

- **Tibialis anterior**, the dorsiflexor, the muscle being stimulated.
- **Soleus**, the plantarflexor, opposing it.

Each is modelled as a contractile element in parallel with a passive elastic
element, in series with a tendon. Force comes from three multiplied terms:

- **Force-length**, a muscle generates maximum force at one particular length,
  falling off either side, because that is where actin and myosin overlap best.
- **Force-velocity**, a shortening muscle produces less force the faster it
  shortens, and a lengthening muscle more.
- **Activation**, the fraction of the muscle currently recruited, driven here
  by the stimulation train rather than by voluntary drive.

Both force-length and force-velocity are fitted as regressions
(`ForceLengthRegression.m`, `ForceVelocityRegression.m`) rather than evaluated
from a closed form, and cached in globals so the ODE solver is not refitting
them at every timestep.

The moment each muscle produces is its force times its moment arm about the
ankle, and the resulting angular acceleration is integrated over the 0.4 s
swing phase.

## Parameters

Set at the top of `MainFile.m`:

```matlab
time                 = 0.4;    % swing phase duration (s)
stimulationTime      = 0.15;   % when the stimulus starts (s)
stimulationDuration  = 0.2;    % how long it lasts (s)
Frequency            = 31;     % stimulation frequency (Hz)
Amplitude            = 75;     % stimulation amplitude
```

The stimulation timing is the interesting knob. Fire too early and the foot
dorsiflexes before it has left the ground; too late and the toes have already
caught.

## Files

| | |
|---|---|
| `MainFile.m` | Entry point, parameters and the run |
| `SimulateModel.m` | The ODE integration over the swing phase |
| `Force_TA.m`, `Force_Soleus.m` | Total force per muscle |
| `ForceLength.m`, `ForceVelocity.m`, `ForceParallel.m`, `ForceTendon.m` | The Hill model's elements |
| `ForceLengthRegression.m`, `ForceVelocityRegression.m` | Fitted curves for those relationships |
| `MuscleLength_TA.m`, `MuscleLength_Soleus.m` | Muscle length as a function of ankle angle |
| `Coordinates_TA.m`, `Coordinates_Soleus.m` | Attachment geometry and moment arms |
| `MuscleActivation.m` | Stimulation train to activation |
| `GetAngularVelocity.m`, `Velocity.m`, `Length_Tendon.m` | Kinematics helpers |
| `model_eval.m` | Evaluation and plotting |

## Limitations

- **Two muscles, one degree of freedom.** The ankle is treated as a pin joint
  in the sagittal plane with only TA and soleus acting. Gastrocnemius,
  peroneals and the toe extensors are not represented, and there is no
  inversion/eversion.
- **Resting lengths are literature averages**, not measured from a subject, so
  the absolute angles should be read as indicative rather than predictive. The
  source citations are marked `%% CITATION` in `MainFile.m` and were not filled
  in, that is a genuine gap, not a formatting artefact.
- **Open-loop stimulation.** The stimulus is a fixed train at a fixed time.
  A real FES system triggers from a heel switch or IMU, and a closed-loop one
  would modulate amplitude against measured ankle angle.
- **No fatigue.** Activation follows the stimulus indefinitely. Stimulated
  muscle fatigues much faster than voluntarily contracted muscle, which is one
  of the main practical limits on FES.

## License

MIT, see [LICENSE](LICENSE).
