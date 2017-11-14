
%job1 = batch('Driver','AttachedFiles',{'InitialiseTest.m','pde2b4.m','f_full_problem.m','InitialiseFiniteDifferences.m','i_double_cos.m'});
%job2 = batch('Driver2','AttachedFiles',{'InitialiseTest2.m','pde2b4.m','f_full_problem.m','InitialiseFiniteDifferences.m','i_double_cos.m'});

job1 = batch('Driver');
job2 = batch('Driver2');

wait(job1);
wait(job2);

S1 = load(job1, 'h', 'x', 't');
S2 = load(job2, 'h', 'x', 't');

delete(job1);
delete(job2);
