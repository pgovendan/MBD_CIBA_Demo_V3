%this file applies the config settings to the model and save it.
%Inputs:  Simulink Model and configuration file.
%Outputs: None.

function [ret]=apply_config_setting(Model_Name,config_filename,file_path)
try
    bdclose all
    
    
    model_file = Model_Name;		% Error code generation
    new_config_file = config_filename;%'New_config_setting.m';
%     old_config_file = 'Old_config_setting.m';
    
    load_system(model_file);
        
    disp('Apply new configuration settings to the model')
    %attach new config file to the model and save it
    Simulink.BlockDiagram.loadActiveConfigSet(model_file,new_config_file);
    
    disp('..')
    disp('..')
    
    disp('Saving the model')
    %save the model
    save_system(model_file);
    
    disp('..')
    disp('..')
    
    %check the updated configuration settings applied to the model
    disp('Check the new configuration settings of the model')
    cf = getActiveConfigSet(model_file);    
    stop_time_val = get_param(cf,'StopTime');    
    disp(strcat('Updated stop time value = ',stop_time_val))
    
    disp('..')
    disp('..')
    
    disp('Model configuration settings applied successfully to the Model')
    
    close_system(model_file);
    disp('Configuration settings applied successfully')
	 
    ret = 0;
    if(config_filename == New_config_setting)
        exit(0);
    else
        %nothing
    end
    
catch e
    disp('Error While applying the configuration set to the Model')
	fid = fopen(file_path, 'w');
    fprintf(fid,'%s\n',e.message);  
    fclose(fid);
    ret = 1;
	exit(1);
end
end