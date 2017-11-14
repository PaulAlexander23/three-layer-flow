# Strong Surface Tension

Folder structure

## Interfaces and functions, `IF\`

In this folder the right hand side of the problem is defined and also the various initial conditions and functions to plot them. The steady state solution is also plotted here.

## Dispersion relation, `DR\`

This is where the dispersion relation and other linear analysis is completed.
There are various functions to plot the results.

* compute_dispersion_relation.m
* compute_f_linear.m
* compute_g_linear.m
* compute_ratio.m
* main.m
* plot_dispersion_relation_overview.m
* plot_dispersion_relation_phase_speed.m
* plot_dispersion_relation_varying_h.m
* plot_dispersion_relation_varying_mu.m
* plot_dispersion_relation.m
* plot_steady_state.m
* script_eigenfunctions_phase.m

## Nonlinear stability, `NA\`

This is where the nonlinear stability of the system is computed.
The regions of

* compute_g_nonlinear.m
* main.m
* plot_interface_type.m
* plot_type_for_all_h.m
* plot_varying_perturbations.m
* plot_varying_theta_interfaces.m
* plot_varying_theta.m
* script_varying_mu_with_perturbations.m

## Finite differences, `FD\`

* animate_interfaces.m
* compute_exact_linear_solution.m
* compute_numerical_linear_solution.m
* compute_numerical_solution.m
* event_collision.m
* initialise_finite_differences.m
* main.m
* ode1b.m
* ode2b.m
* plot_l1_norm.m
* plot_log_l2_norm.m
* plot_overview.m
* plot_surfaces.m
* script_primary_sounding.m

### Test, `FD\test\`

## Pseudo spectral, `PS\`

## Numerical Solutions, `NS\`

## Data, `data\`

## Plots, `plots\`
