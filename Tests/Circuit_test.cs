// Written By Mridul Sarkar
// 6/6/20 2:43 AM

using System;

static Boolean Main() {


    using (var sim = new QuantumSimulator(randomNumberGenerator(42)))
    {
        var es
        timated_T = T_t.Run(sim).Result;
        var exact_T = Walsh_Hadmard.Run(sim).Result;
        var cond_phase_shift = S_A.Run(sim).Result;
        var cond_phase_shift0 = S_0.Run(sim).Result;

        if (estimated_T == exact_T) {

            return True
        }
        else {
            return False
        }
    // return (exact_T*exact_T_transpose) // Find out how to use alt and control = inverse feature to invert this gate
    // return (cond_phase_shift * cond_phase_shift_transpose) //
    
    // return (cond_phase_shift0 * cond_phase_shift0_transpose) 
    }
}
