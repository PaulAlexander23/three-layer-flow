# Strong Surface Tension

This is the read me for the first project of my PhD, three layer flows with strong surface tension.

Below is the hierarchy of the code.

<pre>
.
|-- maple
|   |-- DispersionRelation.mw
|   |-- EvolutionEquations.mw
|   |-- MainScript0_MAS.bak.sav
|   |-- MainScript.log
|   |-- MainScript.mw
|   |-- MainScript.pdf
|   |-- MainScript.tex
|   |-- manufacturedSolutions.mw
|   |-- NonlinearStablility.mw
|   |-- StressTensorExpansion_MAS.bak.sav
|   `-- StressTensorExpansion.mw
|-- maple_to_matlab.sh
|-- matlab
|   |-- compute
|   |   |-- compute_diff_fd.m
|   |   |-- compute_diff_ps.m
|   |   |-- compute_dispersion_relation.m
|   |   |-- compute_eigenfunctions.m
|   |   |-- compute_evolution.txt
|   |   |-- compute_finite_differences_init.m
|   |   |-- compute_f.m
|   |   |-- compute_g.m
|   |   |-- compute_interpolation.m
|   |   |-- compute_linear.m
|   |   |-- compute_linear_solution.m
|   |   |-- compute_linear_solution_temp.m
|   |   |-- compute_manufacted_rhs2.m
|   |   |-- compute_manufacted_rhs - Copy.txt
|   |   |-- compute_manufacted_rhs.m
|   |   |-- compute_manufacted_rhs.txt
|   |   |-- compute_numerical_solution_fourier.m
|   |   |-- compute_numerical_solution.m
|   |   |-- compute_ratio.m
|   |   |-- compute_rhs_fd.m
|   |   |-- compute_rhs_ps_f.m
|   |   |-- compute_rhs_ps.m
|   |   |-- compute_travelling_wave.m
|   |   |-- compute_u1_backup.m
|   |   `-- compute_u1.m
|   |-- data
|   |   |-- data_create.m
|   |   |-- data_load.m
|   |   |-- data_plot.m
|   |   `-- data_save.m
|   |-- functions
|   |   |-- f_burgers.m
|   |   |-- f_evolution_linear.m
|   |   |-- f_evolution.m
|   |   |-- f_manufacted_rhs.m
|   |   `-- f_thin_film.m
|   |-- interfaces
|   |   |-- i_double_cos.m
|   |   |-- i_double_rand_fixed.m
|   |   |-- i_double_rand.m
|   |   |-- i_eigenfunction.m
|   |   |-- i_single_cos.m
|   |   |-- i_single_rand_fixed.m
|   |   `-- i_single_rand.m
|   |-- misc
|   |   |-- create_movie.m
|   |   |-- create_subplot.m
|   |   |-- event_collision.m
|   |   |-- ode1b.m
|   |   `-- ode2b.m
|   |-- plots
|   |   |-- animate_h_h.m
|   |   |-- animate_interfaces.m
|   |   |-- animate_spectrum.m
|   |   |-- plot_amp2.m
|   |   |-- plot_amp.m
|   |   |-- plot_dispersion_relation.m
|   |   |-- plot_E_E.m
|   |   |-- plot_eigenfunctions.m
|   |   |-- plot_growth_h.m
|   |   |-- plot_growth_m.m
|   |   |-- plot_h_h_space.m
|   |   |-- plot_interfaces_3d.m
|   |   |-- plot_interfaces.m
|   |   |-- plot_log_int.m
|   |   |-- plot_log_l2_norm.m
|   |   |-- plot_log_min_distance.m
|   |   |-- plot_min_distance.m
|   |   |-- plot_overview.m
|   |   |-- plot_phase_plane.m
|   |   |-- plot_phase_speed.m
|   |   |-- plot_regions_h.m
|   |   |-- plot_regions_m.m
|   |   |-- plot_spectrum.m
|   |   |-- plot_stability_h_a.m
|   |   |-- plot_stability_h.m
|   |   |-- plot_stability_m.m
|   |   |-- plot_stability_m_Q.m
|   |   |-- plot_stability_regions_in_time.m
|   |   |-- plot_steady_state.m
|   |   |-- plot_surfaces.m
|   |   `-- scatter_with_lobf.m
|   |-- scripts
|   |   |-- main_IF.m
|   |   |-- main_LA.m
|   |   |-- main_LT.m
|   |   |-- main_NS.m
|   |   |-- main_R.m
|   |   |-- main_VR.m
|   |   |-- script_dr_minus_flux.m
|   |   |-- script_eigenfunctions.m
|   |   |-- script_find_numerical_speed.m
|   |   |-- script_fourier_stepping.m
|   |   |-- script_interpolating_the_solution.m
|   |   |-- script_match_eigfunc_to_ics.m
|   |   |-- script_NS_symmetric.m
|   |   |-- script_primary_sounding.m
|   |   `-- script_symmetric.m
|   `-- test
|       |-- test_error.m
|       |-- test_error_t.m
|       |-- test_error_x.m
|       |-- test_FD.m
|       |-- test_finite_difference_construction.m
|       |-- test_finite_difference.m
|       |-- test_IF.m
|       |-- test_is_symmetric.m
|       |-- test_LA.m
|       |-- test_linear.m
|       |-- test_manufactured.m
|       |-- test_method.m
|       |-- test_NS.m
|       |-- test_pseudo_spectral.m
|       |-- test_PS.m
|       `-- test_time_multiplier.m
`-- README.md

10 directories, 121 files
</pre>