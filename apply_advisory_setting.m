%This file applies the advisory settings to the model and generate compliance report.
%Inputs:  Simulink Model
%Outputs: Simulink design error report(HTML).


function [ret]=apply_advisory_setting(model_file,MFile_name,file_path)
try
    bdclose all
    
    
    evalin('base', MFile_name);
    sel_req_chks = selected_checks();
    disp(strcat('model name is: ',model_file));
    
    load_system(model_file);   
    
	disp('Loading the Model & Checks...')

    %Get model advisor object of the model
    ma = Simulink.ModelAdvisor.getModelAdvisor(model_file);
    
    %Close any model advisor report
    setBaselineMode(ma,true)
    closeReport(ma);
    %Deselect All Checks/Tasks
    oc = deselectCheckAll(ma);
    %ot = deselectTaskAll(ma)
    selectCheck(ma,sel_req_chks);
         

    %run the selected task
    disp('Running Selected JMAAB Advisory Checks on the Model...')
    % pause(2);
	%ss = runTask(ma)
    ss = runCheck(ma,sel_req_chks);

    %Generate Advisor Report
	disp('Showing Advisory Checks Report...')
    % pause(1);
    displayReport(ma);
   
    disp('Advisory Settings Report Successfully Generated')

    close_system(model_file);
    movefile slprj JMAAB_Report
	
    ret = 0;

catch e    
    disp('Error While Running Model Advisory Checks')
	fid = fopen(file_path, 'w');
    fprintf(fid,'%s\n',e.message);     
    fclose(fid);
    ret = 1;
	exit(1)

end
end


