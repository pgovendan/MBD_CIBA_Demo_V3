function create_comparison_report(model_name,build_num)

try
    tcpath   = strcat(pwd,'\testcase_MAT\');
    
    if exist('testcase_MAT', 'dir')
        mat_files = dir(fullfile(tcpath,'*.mat')); %dir('*.mat');
        
        if(isempty(mat_files))
            disp('There are no test results in the folder')
        else
            
            %% mat file names
            mat_files_names = {};
            
            for b = 1:length(mat_files)
                mat_files_names{end+1} = mat_files(b).name;
            end
            in_pat = 'Testcase_';
            
            mat_files_names = mat_files_names';
            
            test_vector_file_name = strcat(('MIL_SIL_Comparison_Report_Build_Num_'),num2str(build_num),'.xlsx');
            
            check_and_close_excel_files(pwd,test_vector_file_name);
            if exist(test_vector_file_name,'file')               
                delete(test_vector_file_name);
            else
                % do nothing
            end          
            
            test_sheet_name = 'Testcase';
            
            %% mat file names
            Testcases = {};
            
            for tc_sheets = 1 : length(mat_files_names)/2
                input = strcat(in_pat, num2str(tc_sheets));
                Testcases{end+1} = input;
                data1 = [];
                results = {};
                Sheet_Num = (length(mat_files_names)/2)+1;
                
                testcase_index_MIL = strfind(mat_files_names,strcat('MIL_Test_','TC_',num2str(tc_sheets)));
                testcase_pos_MIL = find(~cellfun(@isempty,testcase_index_MIL));
                testcase_index_SIL = strfind(mat_files_names,strcat('SIL_Test_','TC_',num2str(tc_sheets)));
                testcase_pos_SIL = find(~cellfun(@isempty,testcase_index_SIL));
                ext_data_MIL = mat_files_names(testcase_pos_MIL);
                ext_data_MIL = load(cell2mat(strcat(tcpath,ext_data_MIL)));
                ext_data_SIL = mat_files_names(testcase_pos_SIL);
                ext_data_SIL = load(cell2mat(strcat(tcpath,ext_data_SIL)));
                data_mil=struct2cell(ext_data_MIL);
                data_sil=struct2cell(ext_data_SIL);
                mil_names = 1;
                mil_fieldnames = {};
                mil_fieldnames = fieldnames(data_mil{1,1});
                sil_fieldnames = fieldnames(data_sil{1,1});
                
                time_data = data_mil{mil_names,1}.tout; %common time for all signals
                data1 = num2cell(time_data);
                
                %for empty data
                C    = cell(1, (length(time_data)));
                C(:) = {'NA'};
                C=C';
                header1 = {'Time'};
                for no_outputs = 1: length(mil_fieldnames)-1 %for number of outputs in mil/sil
                    
                    out_data_mil  = data_mil{1,1}.(mil_fieldnames{no_outputs}).signals.values;
                    header1{end + 1} = mil_fieldnames{no_outputs};
                    if(isempty(out_data_mil))
                        data1 = [ data1, C];
                    else
                        data1 = [ data1, num2cell(double(out_data_mil))];
                    end
                    
                    %%% SIL
                    out_data_sil  = data_sil{1,1}.(sil_fieldnames{no_outputs}).signals.values;
                    header1{end + 1} = sil_fieldnames{no_outputs};
                    if(isempty(out_data_sil))
                        data1 = [data1, C];
                    else
                        data1 = [ data1, num2cell(double(out_data_sil))];
                    end
                    
                    
                    x = (mil_fieldnames{no_outputs});
                    x = {x(1:end-4)}; %strsplit(x,'_');
                    header_delta = strcat('Delta','_',string(x{1}));
                    header1{end + 1} = char(header_delta);
                    
                    l1 = length(out_data_mil);
                    
                    if (l1==0)
                        data1 = [ data1, C];
                        %
                    else
                        
                        [result,delta_values, color_code] = calculate_deviation(out_data_mil, out_data_sil);
                        
                        results{end+1} = result;
                        data1 = [ data1, num2cell(color_code)];
                    end
                    
                end
                Index = find(contains(results,'FAIL'),1);
                if isempty (Index)
                    result = {'PASS'};
                else
                    result = {'FAIL'};
                end
                Testcases{end+1}= result{1};
                writecell([header1; (data1)],test_vector_file_name,'Sheet',strcat(test_sheet_name,'_',num2str(tc_sheets)))
            end
            ret = 1;
            %     disp('Deviation report created successfully');
            update_summary(test_vector_file_name,Testcases,model_name,build_num,Sheet_Num)
        end
    else
        disp('No testcase folder present');
    end
catch
    ret = 0;
    disp('Deviation report not created successfully');
end
end

%%
%%

function [result,return_values, color_code] = calculate_deviation(data_mil, data_sil)
% fileattrib(test_vector_file_name, '+w');
% Excel = actxserver('excel.application');
% Get Workbook object
% WB = Excel.Workbooks.Open(fullfile(pwd, test_vector_file_name), 0, false);
for i = 1:(length(data_mil))
    delta_v{i} = abs(data_mil(i) - data_sil(i));
    if delta_v{i} == 0
        color_code{i}=0; %PASS
        
    else
        color_code{i}=1; % FAIL
    end
end
return_values = cell2mat(delta_v');
color_code = cell2mat(color_code');
non_zero_ele = find(return_values);
if isempty(non_zero_ele)
    
    result = 'PASS';
else
    result = 'FAIL';
end
end
%%

%%

function [ret,sheet_info]=update_summary(test_vector_file_name,Testcases,name,build_num,Sheet_Num)

testpathName = pwd;
header_tc = {};
d=1;
e=1;
for v = 1:length(Testcases)/2    
    header_tc{d,1}=Testcases{1,e};
    header_tc{d,2}=Testcases{1,e+1};
    d=d+1;
    e=e+2;    
end
warning off;

try    
    sheetname_testvector = 'Summary'; %strcat('MILvsSIL','_',name);    
    %% Summary
    sheet_info = sheetnames(test_vector_file_name);
    assignin('base','sheet_info',sheet_info);
    if ~isempty(test_vector_file_name)   %%
        
        xlRange3 ='B1';
        xlRange4 = 'B10';
        xlRange5 = 'C9';
        str_hdr = {'MIL vs SIL Comparison Report'};
        str1 = {'1. INTRODUCTION'};
        str21 = {strcat('This is MIL vs SIL Comparison report for feature :',name)};
        str_empty = [];
        str3 = {'2. BUILD NUMBER'};
        str4 = {num2str(build_num)};
        str5 = {'3. LAST RUN'};
        str6 = ({datestr(now)});
        
        str7 = {'4. TEST SUMMARY'};
        
        str9 = {'TestCases'};
        str10 = {'Results'};
        data_col = str10;
            
        data = [str_hdr;str1;str21;str_empty;str3;str4;str5;str6;str7;str9];
 
        writecell(data,fullfile(testpathName,test_vector_file_name),'Sheet','Sheet_Num','Range',xlRange3)
        writecell(header_tc,fullfile(testpathName,test_vector_file_name),'Sheet','Sheet_Num','Range',xlRange4)
		writecell(data_col,fullfile(testpathName,test_vector_file_name),'Sheet','Sheet_Num','Range',xlRange5)
        
       
        [txt]=readtable(fullfile(testpathName,test_vector_file_name),'Sheet','Sheet_Num');
        txt = txt(:,end);        
        txt1 = table2array(txt);        

        [row_pass,~]=find(cellfun('length',regexp(txt1,'PASS'))==1);
        [row_fail,~]=find(cellfun('length',regexp(txt1,'FAIL'))==1);  
        row_pass=row_pass+1;
        row_fail=row_fail+1;
        h = actxserver('Excel.Application');
        h.visible = false;
        h.Workbooks.Open(fullfile(testpathName,test_vector_file_name));
        sheet = h.ActiveWorkbook.Sheets.Item('Sheet_Num');    %changed by Govendan
        h.ActiveWorkbook.Sheets.Item('Sheet_Num').Name = sheetname_testvector; % # rename 1st sheet  %changed by Govendan
        
        sheet.Activate;
        sheet=sheet.get('Range','B1');
        sheet.MergeCells = 1;    %changed by Govendan
        h.Activesheet.Range('B1,C1,D1,E1,F1,G1').EntireRow.HorizontalAlignment = 3;
        h.Activesheet.Range('B5').EntireRow.HorizontalAlignment = 6;
        cells = h.ActiveSheet.Range('B2,B4,B6,B8');
        set(cells.Font, 'Bold', true);
        set(cells.Font,'Size', 22)
        cells = h.ActiveSheet.Range('B1,C1,D1,E1,F1,G1');
        set(cells.Font, 'Bold', true);
        set(cells.Font,'Size', 24)
        
        cells = h.ActiveSheet.Range('B3,B5,B7,B9,B10');
        set(cells.Font,'Size', 16);
        cells.HorizontalAlignment = 2; %left
        cells = h.ActiveSheet.Range('B9:B100');
        set(cells.Font, 'Bold', false);
        set(cells.Font,'Size', 16);
        cells = h.ActiveSheet.Range('C9:C100');
        set(cells.Font, 'Bold', false);
        set(cells.Font,'Size', 16);
        
        try
            if ~isempty(row_pass)
                for c = 1:length(row_pass)
                    h.ActiveSheet.Range(strcat('C',num2str(row_pass(c)))).Interior.ColorIndex = 4;
                end
            end
            if ~isempty(row_fail)
                for c = 1:length(row_fail)
                    h.ActiveSheet.Range(strcat('C',num2str(row_fail(c)))).Interior.ColorIndex = 3;
                end
            end
        catch
            disp('No results');           
        end
        
        h.cells.Select;
        h.cells.EntireColumn.AutoFit;
        %%
        for sheet_len = 2:length(sheet_info)% to autofit all sheets
            
            sheet = h.ActiveWorkbook.Sheets.Item(sheet_len);
            sheet.Activate
            h.cells.Select;
            h.cells.EntireColumn.AutoFit;
        end
        
        %%
        h.ActiveWorkbook.Save;
        h.ActiveWorkbook.Close;
        h.Quit;
        h.delete;
    else
        disp('Comparison Report is Missing');
    end
    disp('Comparison Report Updated successfully');
    ret=1;
    
catch
    disp('Updating Simmary field failed...!!');
    ret =0;
end

delta_result_extract_check(sheet_info,test_vector_file_name);

%% To zip folder
mkdir('Comparison_Report')
movefile(test_vector_file_name,'Comparison_Report')
zip('Comparison_Report','Comparison_Report')
end


%%
function delta_result_extract_check(sheet_info,test_vector_file_name,Sheet_Num)

%%
first_tc_row_nbr = 2;   %changed by Govendan
out_act = 'Delta_';
char_alpha = 64;
header_row_nbr = 1;
Excel = actxserver('excel.application');
% Get Workbook object
WB = Excel.Workbooks.Open(fullfile(pwd, test_vector_file_name), 0, false);
sheets = sheetnames(test_vector_file_name);
  
for tc_sheets1 = 1 : length(sheets)
    
    T1 = readtable (test_vector_file_name,'Sheet',sheets{tc_sheets1});
    Headers = T1.Properties.VariableNames;
    T2 = table2cell(T1);
    A = T2{:,1};
    if ~isempty(T1)
        for header_indx = 1 : length(T2(header_row_nbr,:))
            header_name = Headers{header_row_nbr,header_indx};
            if_in_out =(~isempty(regexp(header_name,out_act, 'start')));
            if if_in_out == 1
                delta_extract = [T1{first_tc_row_nbr:end, header_indx}];
                delta_extract = delta_extract';
                non_zero_ele = find(delta_extract);
                if ~isempty(non_zero_ele)
                    if ~ischar(delta_extract)
                        for n = 1:length(non_zero_ele)
                            col = char(char_alpha + header_indx);
                            for h = 1 :length(non_zero_ele)
                                j = non_zero_ele(h) +1;
                                WB.Worksheets.Item(sheets{tc_sheets1}).Range(strcat(col,num2str(j))).Interior.ColorIndex = 3;
                            end
                        end
                    end
                end
            end
        end
        
    end
end
WB.Save();
WB.Close();
Excel.Quit();
Excel.delete();
end

function check_and_close_excel_files(pwd, test_vector_file_name)
% close all opened test vector file
if ~isempty(test_vector_file_name)
    xlsfile = fullfile(pwd, test_vector_file_name);
    try
        Excel = actxGetRunningServer('Excel.Application');
        Workbooks = Excel.Workbooks; % get the names of all open Excel files
        for ii = 1:Workbooks.Count
            if strcmp(xlsfile, Workbooks.Item(ii).FullName)
                %         Workbooks.Item(ii).Save % save changes
                Workbooks.Item(ii).Close; % close the Excel file
                disp('Comparison Excel was found open, and its closed now');
                break
            else
               
            end
        end
    catch
        disp('Comparison Excel file is not opened');
    end
end
end