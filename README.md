# Strong Surface Tension

This is the read me for the first project of my PhD, three layer flows with strong surface tension.

Below is the folder structure and heirarchy of the code.

Each folder should have a main script which is run to produce the results used in any publication. Optionally a test script (ie test.m calling all tests) could be included to demonstate the validity of the section.

## Interfaces and functions, `IF\`

In this folder the right hand side of the problem is defined and also the various initial conditions and functions to plot them. The steady state solution is also plotted here.

The right hand side of the problem uses a cell array y{1}, y{2} for the two interfaces and another cell array dy{1,1}, dy{1,2}, dy{2,1}, etc (dy{degree,interface}). But as we don't have any second derivates it is a waste to compute them so the cell array has gaps (empty arrays) in it.

* compute_burgers.m
* compute_evolution_linear.m
* compute_evolution.m
* compute_thin_film.m
* i_double_cos.m
* i_double_rand_fixed.m
* i_double_rand.m
* i_single_cos.m
* i_single_rand_fixed.m
* i_single_rand.m
* main.m
* plot_fft.m --- Not functioning at the moment
* plot_interfaces.m
* plot_steady_state.m

## Dispersion relation, `DR\`

This is where the dispersion relation and other linear analysis is completed.
There are various functions to plot the results.

Importantly in the script the eigenfunctions are computed for different parameters these represent the most stable and unstable configurations for the linear case.

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
* script_eigenfunctions.m


## Nonlinear stability, `NA\`

This is where the nonlinear stability of the system is computed:
The regions of ellipticity of the Jacobian etc.

* compute_g_nonlinear.m
* main.m
* plot_interface_type.m
* plot_type_for_all_h.m
* plot_varying_perturbations.m
* plot_varying_theta_interfaces.m
* plot_varying_theta.m
* script_varying_mu_with_perturbations.m


## Finite differences, `FD\`

The folder containing the finite difference scheme implementation and testing.

* f_evolution_fd.m
* initialise_finite_differences.m
* rhs.m
* test_differentiation_methods.m
* test_finite_difference_construction.m
* test_finite_difference_f_burgers.m
* test_finite_difference_f_evolution_linear.m
* test_finite_difference_f_evolution.m
* test_finite_difference_f_evolution_results.mat
* test_finite_difference_f.m
* test_finite_difference.m


## Pseudo spectral, `PS\`

This folder contains the pseudo spectral methods and testing for them.

* diff_ps.m
* f_evolution_ps.m
* test_pseudo_spectral.m
* untitled.m


## Numerical Solutions, `NS\`

This folder contains the scripts to put the bits together to solve the system numeically. At this level only the parameters should be given.

It includes testing for the time stepping code, both method and error, and an event function to detect interface intersection.

ode1b and ode2b are two hand coded implicit solvers.

* animate_interfaces.m
* compute_exact_linear_solution.m
* compute_numerical_linear_solution.m
* compute_numerical_solution.m
* event_collision.m
* main.m
* ode1b.m
* ode2b.m
* plot_l1_norm.m
* plot_log_l2_norm.m
* plot_overview.m
* plot_surfaces.m
* script_primary_sounding.m
* test_error_t.m
* test_error_x.m
* test_is_symmetric.m
* test_linear.m
* test.m
* test_method.m
* test_method_2.m


## Data, `data\`


## Plots, `plots\`


## Top level `.`
