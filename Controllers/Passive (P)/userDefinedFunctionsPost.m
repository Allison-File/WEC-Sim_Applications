%Example of user input MATLAB file for post processing

%Plot waves
waves.plotElevation(simu.rampTime);
try 
    waves.plotSpectrum();
catch
end

%Plot heave response for body 1
output.plotResponse(1,3);

%Plot heave response for body 2
%output.plotResponse(2,3);

%Plot heave forces for body 1
output.plotForces(1,3);

%Plot heave forces for body 2
%output.plotForces(2,3);

%Save waves and response as video
% output.saveViz(simu,body,waves,...
%     'timesPerFrame',5,'axisLimits',[-150 150 -150 150 -50 20],...
%     'startEndTime',[100 125]);

figure()
plot(output.ptos.time,output.ptos.powerInternalMechanics(:,3))

figure()
disp('PTO Power:')
mean(output.ptos.powerInternalMechanics(:,3))

plot(controller1_out)

%last 10 periods
time2 = controller1_out.time(end);
tenPeriods = 10*waves.period;
time1 = time2 - tenPeriods;
[~,closestInd] = min(abs(controller1_out.time-time1));
disp('Controller Power:')
mean(controller1_out.Data(closestInd:end))