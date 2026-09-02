// Top-level SysML — machine requirements and composition.
// Formal requirements live here and in modules/*/architecture/ when sub-modules exist.

package AqurateMachine {

    requirement def PositioningRange {
        doc /* The system shall measure linear positioning over a travel of at least 100 mm */
        attribute travel_mm : Real;
        require constraint { travel_mm >= 100.0 }
    }

    requirement def ErrorMotionRepeatability {
        doc /* Repeatability of error-motion measurements shall be ≤ 0.001 mm */
        attribute repeatability_mm : Real;
        require constraint { repeatability_mm <= 0.001 }
    }

    part def Machine {
        doc /* Top-level machine composition — add sub-module parts when modules/ is populated */
    }
}
