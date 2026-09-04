# 2026-09-02 — Laser diode pointing stability investigation

**Role(s):** engineering, measurement

## Goal

Document literature-backed expectations for high-frequency pointing jitter of an affordable laser diode over a ~500 mm free-air path, after thermal drift and mechanical vibration are removed.

## Summary

For an affordable laser diode over ~500 mm, once thermal drift and mechanical vibration are stripped out, the dominant high-frequency pointing term is refractive-index fluctuations from convecting air. The intrinsic pointing noise of the diode itself is essentially negligible in this band. In an ordinary but not deliberately disturbed lab, expect angular jitter above 0.1 Hz of very roughly **0.05–1 µrad RMS**, which at 500 mm corresponds to spot motion of about tens of nm to a few hundred nm (≈0.03–0.5 µm) RMS. The number is highly environment-dependent — a warm object, a fan, HVAC, or a person near the path can push it up by an order of magnitude, and a genuinely quiet enclosed path pulls it well below.

The most useful experimental anchor is [Yashchuk et al. (LBNL, long-trace-profiler work)](https://escholarship.org/uc/item/5v81n1b3): over a 1 m path with a deliberate small (100–150 mW) heater inducing mild convection, they measured beam-pointing noise with an inverse-power-law spectrum between ~0.05 Hz and ~0.5 Hz, with a power index of 2–3 and an overall RMS of ~0.5–1 µrad. Scaling that down to a shorter 0.5 m path and no forced heater lands in the range above.

## Where the energy sits in frequency

This matters for the 0.1 Hz threshold. Convection noise is overwhelmingly a low-frequency phenomenon:

- The power spectral density falls steeply — roughly f⁻² to f⁻³ — through the 0.05–0.5 Hz decade (the Yashchuk result). So most of the "AC" energy lives between ~0.1 and ~1–2 Hz.
- There is an effective upper wall set by how fast air structures cross the beam (≈ flow velocity / beam diameter, plus the outer-scale crossing time). For gentle still-lab convection (v ~ 0.05–0.2 m/s, ~1 mm beam) meaningful energy extends to a few Hz; forced airflow can stretch it toward ~10–30 Hz, but above that air contributes essentially nothing. A [NASA propagation review](https://ntrs.nasa.gov/api/citations/20040191353/downloads/20040191353.pdf) makes the same split, distinguishing slow oscillations ≤1 Hz from rapid ones ≥10 Hz.

**Practical implication:** a 0.1 Hz cutoff still captures most of the convection band. If the analysis threshold can be raised to, say, >2–5 Hz, the residual air-induced motion drops to the nanometer level or below, because there is simply very little turbulence energy left up there.

## The intrinsic diode contribution

Excluding thermal/mount effects, a diode's beam direction is fixed by the chip and collimating optics; genuine high-frequency pointing noise from drive-current fluctuations is sub-nrad to single-nrad — orders of magnitude under the air term. The one real exception for a cheap free-running diode is **mode hopping**: discrete wavelength/mode jumps can produce small angular steps and broadband transients. These are events, not continuous jitter, but they can show up in a >0.1 Hz record as occasional glitches. Once the beam is enclosed and air is removed, the diode/mount and the detector-plus-electronics noise floor become the actual limit, not the air.

## Shielding with bellows — what the literature shows, and the catch

Enclosing the path works, and there is direct validation. A movable turbulence shield on a laser 5-DOF straightness system reduced straightness-noise standard deviation by **95.6% horizontally and 87.4% vertically** — i.e. very roughly a 5–10× reduction in RMS. ([Liu et al., 2021](https://doi.org/10.1016/j.measurement.2021.109643)) For comparison, software/optical tricks like common-path compensation give ~75%, double-beam ~50% at 300 mm, dual-wavelength >56% — an enclosure generally beats them because it removes the disturbance rather than correcting for it. A bellows-covered linear stage is essentially this shield, so it should get into that same regime. But there are three caveats specific to bellows that the papers do not always emphasize:

1. **Enclosing air ≠ removing air.** A sealed still-air column with a temperature difference across its walls (a warm motor, a warm carriage, one wall near a heat source) will still set up slow convection cells. Room airflow is suppressed, but residual buoyancy-driven convection remains. This is why the ceiling for a simple sealed tube of air is usually ~5–10×, not 100×.
2. **Motion pumps the air.** Compressing and extending a bellows as the stage moves actively pushes air along the beam path, creating airflow and density transients locked to the motion frequency and its harmonics. For static pointing between moves, bellows are excellent. For dynamic scanning, the bellows can actually inject motion-synchronous disturbance — worth checking on the specific stage. Vented/low-stiffness bellows or a fixed shroud that the carriage slides within (rather than a bellows that pumps) can avoid this.
3. **Next level down.** If ~5–10× is not enough, the standard escalation used in synchrotron LTPs, gravitational-wave optics, and long-gauge interferometry is to fill the enclosure with helium (index perturbation and dn/dT both much smaller) or to evacuate it. That buys another order of magnitude or more and is what gets people into the nrad / sub-nm regime.

## Literature

| Reference | Link |
| --- | --- |
| Yashchuk, Irick, MacDowell, McKinney & Takacs — "Air convection noise of pencil-beam interferometer for long trace profiler" (LBNL, 2006). Best match: measured frequency spectra of air-induced pointing noise over a 1 m lab path, plus the air-blowing whitening trick. | [eScholarship (free PDF)](https://escholarship.org/uc/item/5v81n1b3) · [SPIE](https://doi.org/10.1117/12.681297) · [OSTI](https://www.osti.gov/servlets/purl/889257) |
| Liu et al. — "A method for noise attenuation of straightness measurement based on laser collimation," *Measurement* 182 (2021) 109643. ~88–96% shield-reduction result on an actual moving-axis system. | [ScienceDirect](https://doi.org/10.1016/j.measurement.2021.109643) |
| Kwiecień — "The effects of atmospheric turbulence on laser beam propagation in a closed space," *Optics Communications* 433 (2019) 200–208. Modeled and measured beam-position deviations in stagnant enclosed air (order 10–30 µm over a laser-tracker path); useful for the "closed space" case. | [ScienceDirect](https://doi.org/10.1016/j.optcom.2018.09.022) |
| Bahadori & Hwang — "Atmospheric Propagation Effects Relevant to Optical Communications" (NASA TM). Slow oscillations ≤1 Hz vs rapid oscillations ≥10 Hz. | [NASA NTRS (PDF)](https://ntrs.nasa.gov/api/citations/20040191353/downloads/20040191353.pdf) |
| Estler, Edmundson, Peggs & Parker — "Large-scale metrology — an update," *CIRP Annals* 51(2) (2002). Standard reference for how a beam randomly bends in lab air and why it is hard to model out. | [ScienceDirect](https://doi.org/10.1016/S0007-8506(07)61702-8) |
| IASBS group (Rasouli, Mohammadi Razi et al.) — indoor convective turbulence, Cₙ² / structure-function framework, aperture and path-length scaling. Representative paper: | [Journal of Optics (2014)](https://doi.org/10.1088/2040-8978/16/4/045705) · [JOSA A (2022)](https://doi.org/10.1364/JOSAA.433456) |
| Consortini / Florence group — angle-of-arrival and beam-wandering experiments in heater-induced indoor turbulence. Representative paper: | [Waves in Random Media (1997)](https://doi.org/10.1080/13616679709409813) · [Gulich et al., *Optics Communications* (2007)](https://doi.org/10.1016/j.optcom.2007.05.019) |

## Open Questions

- [ ] Measure pointing PSD on the actual ~500 mm path with and without bellows, at rest and during stage motion.
- [ ] Quantify mode-hopping glitch rate for the specific diode under test.
- [ ] Decide whether a >2–5 Hz analysis cutoff is acceptable for the target application.

## Next Steps

- [ ] Design a pointing-stability measurement case under `measurement/cases/`.
- [ ] Compare open-path vs bellows-shielded PSD at 0.1 Hz and above.
