%this file generates source code.
%Inputs:  Simulink model
%Outputs: Source code of the model.

function create_s_fcn(model_name)
try   
    load_system(model_name);
    find_subsys = find_system(model_name,'searchDepth',1, 'BlockType','SubSystem');  %finding subsystem

    model_subsys=find_subsys{4}; %rajesh
    % only one subsystem to be expected at top level
    if(~isempty(model_subsys))%(length(model_subsys) == 1)
        pos = get_param(model_subsys,'position');
        new_system('s_fcn_model','Model',model_subsys);
        delete_block(model_subsys);
        
        % model simulation config settings
        set_param('s_fcn_model','SolverType','Fixed-step');
        set_param('s_fcn_model','RTWSystemTargetFile','rtwsfcn.tlc');
        set_param('s_fcn_model','RTWTemplateMakefile','rtwsfcn_default_tmf');
        slbuild('s_fcn_model');
        add_block('untitled/Generated S-Function',model_subsys,'position',pos);
        bdclose untitled;
        bdclose s_fcn_model;
        clear pos;
    else
        %return and display error
    end
    save_system(model_name);
    close_system(model_name);
catch
    bdclose all
    %return and display error
end