%this file includes configuration settings.
%Inputs:  None.
%Outputs: None.

function cs = config()
% MATLAB function for configuration set generated on 04-Sep-2020 18:18:07
% MATLAB version: 9.5.0.1265761 (R2018b) Update 6

cs = Simulink.ConfigSet;

% Original configuration set version: 1.18.1
if cs.versionCompare('1.18.1') < 0
    error('Simulink:MFileVersionViolation', 'The version of the target configuration set is older than the original configuration set.');
end

% Original environment character encoding: windows-1252
if ~strcmpi(get_param(0, 'CharacterEncoding'), 'windows-1252')
    warning('Simulink:EncodingUnMatched', 'The target character encoding (%s) is different from the original (%s).',  get_param(0, 'CharacterEncoding'), 'windows-1252');
end

% Do not change the order of the following commands. There are dependencies between the parameters.
cs.set_param('Name', 'ModelReferencing'); % Name
cs.set_param('Description', 'Test1'); % Description

% Original configuration set target is grt.tlc
cs.switchTarget('grt.tlc','');

cs.set_param('HardwareBoard', 'None');   % Hardware board

cs.set_param('Solver', 'FixedStepDiscrete');   % Solver

% Solver
cs.set_param('StartTime', '0');   % Start time
cs.set_param('StopTime', '0.58999999999999997');   % Stop time
cs.set_param('ConcurrentTasks', 'off');   % Allow tasks to execute concurrently on target
cs.set_param('SampleTimeConstraint', 'Unconstrained');   % Periodic sample time constraint
cs.set_param('SolverType', 'Fixed-step');   % Type
cs.set_param('FixedStep', '0.01');   % Fixed-step size (fundamental sample time)
cs.set_param('EnableMultiTasking', 'off');   % Treat each discrete rate as a separate task
cs.set_param('AutoInsertRateTranBlk', 'off');   % Automatically handle rate transition for data transfer
cs.set_param('PositivePriorityOrder', 'off');   % Higher priority value indicates higher task priority

% Data Import/Export
cs.set_param('LoadExternalInput', 'off');   % Load external input
cs.set_param('LoadInitialState', 'off');   % Load initial state
cs.set_param('SaveTime', 'on');   % Save time
cs.set_param('TimeSaveName', 'tout');   % Time variable
cs.set_param('SaveState', 'off');   % Save states
cs.set_param('SaveFormat', 'StructureWithTime');   % Format
cs.set_param('SaveOutput', 'on');   % Save output
cs.set_param('OutputSaveName', 'yout');   % Output variable
cs.set_param('SaveFinalState', 'off');   % Save final state
cs.set_param('SignalLogging', 'on');   % Signal logging
cs.set_param('SignalLoggingName', 'logsout');   % Signal logging name
cs.set_param('DSMLogging', 'on');   % Data stores
cs.set_param('DSMLoggingName', 'dsmout');   % Data stores logging name
cs.set_param('LoggingToFile', 'off');   % Log Dataset data to file
cs.set_param('DatasetSignalFormat', 'timeseries');   % Dataset signal format
cs.set_param('ReturnWorkspaceOutputs', 'off');   % Single simulation output
cs.set_param('InspectSignalLogs', 'off');   % Record logged workspace data in Simulation Data Inspector
cs.set_param('LimitDataPoints', 'on');   % Limit data points
cs.set_param('MaxDataPoints', '1000');   % Maximum number of data points
cs.set_param('Decimation', '1');   % Decimation

% Optimization
cs.set_param('BlockReduction', 'off');   % Block reduction
cs.set_param('OptimizeBlockIOStorage', 'on');   % Signal storage reuse
cs.set_param('DataBitsets', 'off');   % Use bitsets for storing Boolean data
cs.set_param('StateBitsets', 'off');   % Use bitsets for storing state configuration
cs.set_param('EnableMemcpy', 'on');   % Use memcpy for vector assignment
cs.set_param('BufferReuse', 'on');   % Reuse local block outputs
cs.set_param('ExpressionFolding', 'off');   % Eliminate superfluous local variables (expression folding)
cs.set_param('LocalBlockOutputs', 'on');   % Enable local block outputs
cs.set_param('ConditionallyExecuteInputs', 'on');   % Conditional input branch execution
cs.set_param('BooleanDataType', 'on');   % Implement logic signals as Boolean data (vs. double)
cs.set_param('LifeSpan', 'inf');   % Application lifespan (days)
cs.set_param('UseDivisionForNetSlopeComputation', 'off');   % Use division for fixed-point net slope computation
cs.set_param('UseFloatMulNetSlope', 'off');   % Use floating-point multiplication to handle net slope corrections
cs.set_param('DefaultUnderspecifiedDataType', 'double');   % Default for underspecified data type
cs.set_param('InitFltsAndDblsToZero', 'off');   % Use memset to initialize floats and doubles to 0.0
cs.set_param('EfficientFloat2IntCast', 'off');   % Remove code from floating-point to integer conversions that wraps out-of-range values
cs.set_param('EfficientMapNaN2IntZero', 'on');   % Remove code from floating-point to integer conversions with saturation that maps NaN to zero
cs.set_param('SimCompilerOptimization', 'off');   % Compiler optimization level
cs.set_param('AccelVerboseBuild', 'off');   % Verbose accelerator builds
cs.set_param('DefaultParameterBehavior', 'Tunable');   % Default parameter behavior
cs.set_param('MemcpyThreshold', 64);   % Memcpy threshold (bytes)
cs.set_param('RollThreshold', 5);   % Loop unrolling threshold
cs.set_param('MaxStackSize', 'Inherit from target');   % Maximum stack size (bytes)
cs.set_param('ActiveStateOutputEnumStorageType', 'Native Integer');   % Base storage type for automatically created enumerations
cs.set_param('BufferReusableBoundary', 'on');   % Buffer for reusable subsystems
cs.set_param('UseRowMajorAlgorithm', 'off');   % Use algorithms optimized for row-major array layout

% Diagnostics
cs.set_param('AlgebraicLoopMsg', 'warning');   % Algebraic loop
cs.set_param('ArtificialAlgebraicLoopMsg', 'warning');   % Minimize algebraic loop
cs.set_param('BlockPriorityViolationMsg', 'warning');   % Block priority violation
cs.set_param('MinStepSizeMsg', 'warning');   % Min step size violation
cs.set_param('TimeAdjustmentMsg', 'none');   % Sample hit time adjusting
cs.set_param('MaxConsecutiveZCsMsg', 'error');   % Consecutive zero crossings violation
cs.set_param('UnknownTsInhSupMsg', 'warning');   % Unspecified inheritability of sample time
cs.set_param('ConsistencyChecking', 'none');   % Solver data inconsistency
cs.set_param('SolverPrmCheckMsg', 'warning');   % Automatic solver parameter selection
cs.set_param('ModelReferenceExtraNoncontSigs', 'error');   % Extraneous discrete derivative signals
cs.set_param('StateNameClashWarn', 'warning');   % State name clash
cs.set_param('SimStateInterfaceChecksumMismatchMsg', 'warning');   % SimState interface checksum mismatch
cs.set_param('SimStateOlderReleaseMsg', 'error');   % SimState object from a different release
cs.set_param('InheritedTsInSrcMsg', 'none');   % Source block specifies -1 sample time
cs.set_param('MultiTaskRateTransMsg', 'error');   % Multitask rate transition
cs.set_param('SingleTaskRateTransMsg', 'none');   % Single task rate transition
cs.set_param('MultiTaskCondExecSysMsg', 'error');   % Multitask conditionally executed subsystem
cs.set_param('TasksWithSamePriorityMsg', 'warning');   % Tasks with equal priority
cs.set_param('SigSpecEnsureSampleTimeMsg', 'warning');   % Enforce sample times specified by Signal Specification blocks
cs.set_param('SignalResolutionControl', 'UseLocalSettings');   % Signal resolution
cs.set_param('CheckMatrixSingularityMsg', 'none');   % Division by singular matrix
cs.set_param('IntegerSaturationMsg', 'warning');   % Saturate on overflow
cs.set_param('UnderSpecifiedDataTypeMsg', 'none');   % Underspecified data types
cs.set_param('UnderSpecifiedDimensionMsg', 'none');   % Underspecified dimensions
cs.set_param('SignalRangeChecking', 'none');   % Simulation range checking
cs.set_param('IntegerOverflowMsg', 'warning');   % Wrap on overflow
cs.set_param('SignalInfNanChecking', 'none');   % Inf or NaN block output
cs.set_param('StringTruncationChecking', 'error');   % String truncation checking
cs.set_param('RTPrefix', 'error');   % "rt" prefix for identifiers
cs.set_param('ParameterDowncastMsg', 'error');   % Detect downcast
cs.set_param('ParameterOverflowMsg', 'error');   % Detect overflow
cs.set_param('ParameterUnderflowMsg', 'none');   % Detect underflow
cs.set_param('ParameterPrecisionLossMsg', 'none');   % Detect precision loss
cs.set_param('ParameterTunabilityLossMsg', 'warning');   % Detect loss of tunability
cs.set_param('ReadBeforeWriteMsg', 'UseLocalSettings');   % Detect read before write
cs.set_param('WriteAfterReadMsg', 'UseLocalSettings');   % Detect write after read
cs.set_param('WriteAfterWriteMsg', 'UseLocalSettings');   % Detect write after write
cs.set_param('MultiTaskDSMMsg', 'error');   % Multitask data store
cs.set_param('UniqueDataStoreMsg', 'none');   % Duplicate data store names
cs.set_param('UnderspecifiedInitializationDetection', 'Classic');   % Underspecified initialization detection
cs.set_param('MergeDetectMultiDrivingBlocksExec', 'none');   % Detect multiple driving blocks executing at the same time step
cs.set_param('CheckSSInitialOutputMsg', 'on');   % Check undefined subsystem initial output
cs.set_param('CheckExecutionContextRuntimeOutputMsg', 'off');   % Check runtime output of execution context
cs.set_param('ArrayBoundsChecking', 'none');   % Array bounds exceeded
cs.set_param('AssertControl', 'UseLocalSettings');   % Model Verification block enabling
cs.set_param('AllowSymbolicDim', 'on');   % Allow symbolic dimension specification
cs.set_param('UnnecessaryDatatypeConvMsg', 'none');   % Unnecessary type conversions
cs.set_param('VectorMatrixConversionMsg', 'none');   % Vector/matrix block input conversion
cs.set_param('Int32ToFloatConvMsg', 'warning');   % 32-bit integer to single precision float conversion
cs.set_param('FixptConstUnderflowMsg', 'none');   % Detect underflow
cs.set_param('FixptConstOverflowMsg', 'none');   % Detect overflow
cs.set_param('FixptConstPrecisionLossMsg', 'none');   % Detect precision loss
cs.set_param('SignalLabelMismatchMsg', 'none');   % Signal label mismatch
cs.set_param('UnconnectedInputMsg', 'warning');   % Unconnected block input ports
cs.set_param('UnconnectedOutputMsg', 'warning');   % Unconnected block output ports
cs.set_param('UnconnectedLineMsg', 'warning');   % Unconnected line
cs.set_param('RootOutportRequireBusObject', 'warning');   % Unspecified bus object at root Outport block
cs.set_param('BusObjectLabelMismatch', 'warning');   % Element name mismatch
cs.set_param('StrictBusMsg', 'ErrorLevel1');   % Bus signal treated as vector
cs.set_param('NonBusSignalsTreatedAsBus', 'none');   % Non-bus signals treated as bus signals
cs.set_param('BusNameAdapt', 'WarnAndRepair');   % Repair bus selections
cs.set_param('InvalidFcnCallConnMsg', 'error');   % Invalid function-call connection
cs.set_param('FcnCallInpInsideContextMsg', 'warning');   % Context-dependent inputs
cs.set_param('SFcnCompatibilityMsg', 'none');   % S-function upgrades needed
cs.set_param('FrameProcessingCompatibilityMsg', 'error');   % Block behavior depends on frame status of signal
cs.set_param('ModelReferenceVersionMismatchMessage', 'none');   % Model block version mismatch
cs.set_param('ModelReferenceIOMismatchMessage', 'none');   % Port and parameter mismatch
cs.set_param('ModelReferenceIOMsg', 'none');   % Invalid root Inport/Outport block connection
cs.set_param('ModelReferenceDataLoggingMessage', 'warning');   % Unsupported data logging
cs.set_param('SaveWithDisabledLinksMsg', 'warning');   % Block diagram contains disabled library links
cs.set_param('SaveWithParameterizedLinksMsg', 'warning');   % Block diagram contains parameterized library links
cs.set_param('SFUnusedDataAndEventsDiag', 'warning');   % Unused data, events, messages and functions
cs.set_param('SFUnexpectedBacktrackingDiag', 'warning');   % Unexpected backtracking
cs.set_param('SFInvalidInputDataAccessInChartInitDiag', 'warning');   % Invalid input data access in chart initialization
cs.set_param('SFNoUnconditionalDefaultTransitionDiag', 'warning');   % No unconditional default transitions
cs.set_param('SFTransitionOutsideNaturalParentDiag', 'warning');   % Transition outside natural parent
cs.set_param('SFUnreachableExecutionPathDiag', 'warning');   % Unreachable execution path
cs.set_param('SFUndirectedBroadcastEventsDiag', 'warning');   % Undirected event broadcasts
cs.set_param('SFTransitionActionBeforeConditionDiag', 'warning');   % Transition action specified before condition action
cs.set_param('SFOutputUsedAsStateInMooreChartDiag', 'error');   % Read-before-write to output in Moore chart
cs.set_param('SFTemporalDelaySmallerThanSampleTimeDiag', 'warning');   % Absolute time temporal value shorter than sampling period
cs.set_param('SFSelfTransitionDiag', 'warning');   % Self-transition on leaf state
cs.set_param('SFExecutionAtInitializationDiag', 'none');   % 'Execute-at-initialization' disabled in presence of input events
cs.set_param('SFMachineParentedDataDiag', 'warning');   % Use of machine-parented data instead of Data Store Memory
cs.set_param('IgnoredZcDiagnostic', 'warning');   % Ignored zero crossings
cs.set_param('InitInArrayFormatMsg', 'warning');   % Initial state is array
cs.set_param('MaskedZcDiagnostic', 'warning');   % Masked zero crossings
cs.set_param('ModelReferenceSymbolNameMessage', 'warning');   % Insufficient maximum identifier length
cs.set_param('AllowedUnitSystems', 'all');   % Allowed unit systems
cs.set_param('UnitsInconsistencyMsg', 'warning');   % Units inconsistency messages
cs.set_param('AllowAutomaticUnitConversions', 'on');   % Allow automatic unit conversions
cs.set_param('ForceCombineOutputUpdateInSim', 'off');   % Combine output and update methods for code generation and simulation

% Hardware Implementation
cs.set_param('ProdHWDeviceType', 'Generic->32-bit x86 compatible');   % Production device vendor and type
cs.set_param('ProdLongLongMode', 'off');   % Support long long
cs.set_param('ProdLargestAtomicInteger', 'Char');   % Largest atomic integer size
cs.set_param('ProdLargestAtomicFloat', 'None');   % Largest atomic floating-point size
cs.set_param('ProdEqTarget', 'on');   % Test hardware is the same as production hardware
cs.set_param('TargetPreprocMaxBitsSint', 32);   % Maximum bits for signed integer in C preprocessor
cs.set_param('TargetPreprocMaxBitsUint', 32);   % Maximum bits for unsigned integer in C preprocessor

% Model Referencing
cs.set_param('UpdateModelReferenceTargets', 'IfOutOfDateOrStructuralChange');   % Rebuild
cs.set_param('EnableParallelModelReferenceBuilds', 'off');   % Enable parallel model reference builds
cs.set_param('ModelReferenceNumInstancesAllowed', 'Multi');   % Total number of instances allowed per top model
cs.set_param('PropagateVarSize', 'Infer from blocks in model');   % Propagate sizes of variable-size signals
cs.set_param('ModelReferenceMinAlgLoopOccurrences', 'off');   % Minimize algebraic loop occurrences
cs.set_param('EnableRefExpFcnMdlSchedulingChecks', 'on');   % Enable strict scheduling checks for referenced models
cs.set_param('PropagateSignalLabelsOutOfModel', 'off');   % Propagate all signal labels out of the model
cs.set_param('ModelReferencePassRootInputsByReference', 'on');   % Pass fixed-size scalar root inputs by value for code generation
cs.set_param('ModelDependencies', '');   % Model dependencies
cs.set_param('ParallelModelReferenceErrorOnInvalidPool', 'on');   % Perform consistency check on parallel pool
cs.set_param('SupportModelReferenceSimTargetCustomCode', 'off');   % Include custom code for referenced models

% Simulation Target
cs.set_param('MATLABDynamicMemAlloc', 'on');   % Dynamic memory allocation in MATLAB functions
cs.set_param('MATLABDynamicMemAllocThreshold', 65536);   % Dynamic memory allocation threshold in MATLAB functions
cs.set_param('CompileTimeRecursionLimit', 50);   % Compile-time recursion limit for MATLAB functions
cs.set_param('EnableRuntimeRecursion', 'on');   % Enable run-time recursion for MATLAB functions
cs.set_param('SFSimEcho', 'on');   % Echo expressions without semicolons
cs.set_param('SimCtrlC', 'on');   % Ensure responsiveness
cs.set_param('SimIntegrity', 'on');   % Ensure memory integrity
cs.set_param('SimGenImportedTypeDefs', 'off');   % Generate typedefs for imported bus and enumeration types
cs.set_param('SimBuildMode', 'sf_incremental_build');   % Simulation target build mode
cs.set_param('SimReservedNameArray', []);   % Reserved names
cs.set_param('SimParseCustomCode', 'on');   % Import custom code
cs.set_param('SimAnalyzeCustomCode', 'off');   % Enable custom code analysis
cs.set_param('DefaultCustomCodeFunctionArrayLayout', 'NotSpecified');   % Default function array layout
cs.set_param('CustomCodeFunctionArrayLayout', []);   % Specify by function...
cs.set_param('SimCustomSourceCode', '');   % Source file
cs.set_param('SimCustomHeaderCode', '');   % Header file
cs.set_param('SimCustomInitializer', '');   % Initialize function
cs.set_param('SimCustomTerminator', '');   % Terminate function
cs.set_param('SimUserIncludeDirs', '');   % Include directories
cs.set_param('SimUserSources', '');   % Source files
cs.set_param('SimUserLibraries', '');   % Libraries
cs.set_param('SimUserDefines', '');   % Defines
cs.set_param('SFSimEnableDebug', 'off');   % Allow setting breakpoints during simulation

% Code Generation
cs.set_param('TargetLang', 'C');   % Language
cs.set_param('Toolchain', 'Automatically locate an installed toolchain');   % Toolchain
cs.set_param('BuildConfiguration', 'Faster Builds');   % Build configuration
cs.set_param('ObjectivePriorities', []);   % Prioritized objectives
cs.set_param('CheckMdlBeforeBuild', 'Off');   % Check model before generating code
cs.set_param('GenCodeOnly', 'off');   % Generate code only
cs.set_param('PackageGeneratedCodeAndArtifacts', 'off');   % Package code and artifacts
cs.set_param('RTWVerbose', 'on');   % Verbose build
cs.set_param('RetainRTWFile', 'off');   % Retain .rtw file
cs.set_param('ProfileTLC', 'off');   % Profile TLC
cs.set_param('TLCDebug', 'off');   % Start TLC debugger when generating code
cs.set_param('TLCCoverage', 'off');   % Start TLC coverage when generating code
cs.set_param('TLCAssert', 'off');   % Enable TLC assertion
cs.set_param('RTWUseSimCustomCode', 'off');   % Use the same custom code settings as Simulation Target
cs.set_param('CustomSourceCode', '');   % Source file
cs.set_param('CustomHeaderCode', '');   % Header file
cs.set_param('CustomInclude', '');   % Include directories
cs.set_param('CustomSource', '');   % Source files
cs.set_param('CustomLibrary', '');   % Libraries
cs.set_param('CustomLAPACKCallback', '');   % Custom LAPACK library callback
cs.set_param('CustomFFTCallback', '');   % Custom FFT library callback
cs.set_param('CustomBLASCallback', '');   % Custom BLAS library callback
cs.set_param('CustomDefine', '');   % Defines
cs.set_param('CustomInitializer', '');   % Initialize function
cs.set_param('CustomTerminator', '');   % Terminate function
cs.set_param('PostCodeGenCommand', '');   % Post code generation command
cs.set_param('TLCOptions', '');   % TLC command line options
cs.set_param('GenerateReport', 'off');   % Create code generation report
cs.set_param('GenerateComments', 'on');   % Include comments
cs.set_param('SimulinkBlockComments', 'on');   % Simulink block comments
cs.set_param('StateflowObjectComments', 'on');   % Stateflow object comments
cs.set_param('MATLABSourceComments', 'off');   % MATLAB source code as comments
cs.set_param('ShowEliminatedStatement', 'off');   % Show eliminated blocks
cs.set_param('ForceParamTrailComments', 'off');   % Verbose comments for 'Model default' storage class
cs.set_param('MaxIdLength', 31);   % Maximum identifier length
cs.set_param('UseSimReservedNames', 'off');   % Use the same reserved names as Simulation Target
cs.set_param('ReservedNameArray', []);   % Reserved names
cs.set_param('TargetLangStandard', 'C89/C90 (ANSI)');   % Standard math library
cs.set_param('CodeReplacementLibrary', 'None');   % Code replacement library
cs.set_param('UtilityFuncGeneration', 'Auto');   % Shared code placement
cs.set_param('CodeInterfacePackaging', 'Nonreusable function');   % Code interface packaging
cs.set_param('GRTInterface', 'on');   % Classic call interface
cs.set_param('SupportNonFinite', 'on');   % Support non-finite numbers
cs.set_param('MultiwordLength', 2048);   % Maximum word length
cs.set_param('MatFileLogging', 'on');   % MAT-file logging
cs.set_param('LogVarNameModifier', 'rt_');   % MAT-file variable name modifier
cs.set_param('ArrayLayout', 'Column-major');   % Array layout
cs.set_param('GenerateFullHeader', 'on');   % Generate full file banner
cs.set_param('InferredTypesCompatibility', 'off');   % Create preprocessor directive in rtwtypes.h
cs.set_param('TargetLibSuffix', '');   % Suffix applied to target library name
cs.set_param('TargetPreCompLibLocation', '');   % Precompiled library location
cs.set_param('LUTObjectStructOrderExplicitValues', 'Size,Breakpoints,Table');   % LUT object struct order for explicit value specification
cs.set_param('LUTObjectStructOrderEvenSpacing', 'Size,Breakpoints,Table');   % LUT object struct order for even spacing specification
cs.set_param('DynamicStringBufferSize', 256);   % Buffer size of dynamically-sized string (bytes)
cs.set_param('ExtMode', 'off');   % External mode
cs.set_param('RTWCAPIParams', 'off');   % Generate C API for parameters
cs.set_param('RTWCAPIRootIO', 'off');   % Generate C API for root-level I/O
cs.set_param('RTWCAPISignals', 'off');   % Generate C API for signals
cs.set_param('RTWCAPIStates', 'off');   % Generate C API for states
cs.set_param('GenerateASAP2', 'off');   % ASAP2 interface

% Simulink Coverage
cs.set_param('CovModelRefEnable', 'on');   % Record coverage for referenced models
cs.set_param('RecordCoverage', 'on');   % Record coverage for this model
cs.set_param('CovScope', 'EntireSystem');   % Scope of coverage analysis
cs.set_param('CovEnable', 'on');   % Enable coverage analysis
cs.set_param('CovExternalEMLEnable', 'on');   % Record coverage for MATLAB files
cs.set_param('CovSFcnEnable', 'on');   % Record coverage for C/C++ S-functions
cs.set_param('CovHighlightResults', 'on');   % Display coverage results using model coloring
cs.set_param('CovUnsupportedBlockWarning', 'off');   % Warn when unsupported blocks exist in model
cs.set_param('CovLogicBlockShortCircuit', 'off');   % Treat Simulink logic blocks as short-circuited
cs.set_param('CovMetricRelationalBoundary', 'off');   % Enable relational boundary metric
cs.set_param('CovMetricSaturateOnIntegerOverflow', 'off');   % Enable saturation on integer overflow metric
cs.set_param('CovMetricObjectiveConstraint', 'on');   % Enable objectives and constraints metric
cs.set_param('CovMetricSignalSize', 'off');   % Enable signal size metric
cs.set_param('CovMetricSignalRange', 'off');   % Enable signal range metric
cs.set_param('CovMetricLookupTable', 'off');   % Enable lookup table metric
cs.set_param('CovMetricStructuralLevel', 'MCDC');   % Structural coverage level
cs.set_param('CovMetricSettings', 'dcmo');   % Coverage metric settings
cs.set_param('CovEnableCumulative', 'on');   % Enable cumulative data collection
cs.set_param('CovSaveCumulativeToWorkspaceVar', 'on');   % Save cumulative coverage results in workspace variable
cs.set_param('CovCumulativeVarName', 'covCumulativeData');   % Cumulative coverage variable name
cs.set_param('CovSaveSingleToWorkspaceVar', 'off');   % Save last coverage run in workspace variable
cs.set_param('CovReportOnPause', 'on');   % Update coverage results on pause
cs.set_param('CovHtmlReporting', 'on');   % Generate coverage report
cs.set_param('CovHTMLOptions', '-aTS=1 -bRG=1 -bTC=0 -hTR=0 -nFC=0 -scm=1 -bcm=1');   % Coverage report options
cs.set_param('CovCumulativeReport', 'on');   % Include cumulative data in coverage report
cs.set_param('CovCompData', '');   % Additional data to include in coverage report
cs.set_param('CovForceBlockReductionOff', 'on');   % Force block reduction off
cs.set_param('CovUseTimeInterval', 'off');   % Restrict coverage recording interval
cs.set_param('CovFilter', '');   % Coverage filter filename
cs.set_param('CovShowResultsExplorer', 'off');   % Show Results Explorer
cs.set_param('CovOutputDir', 'slcov_output/$ModelName$');   % Output directory
cs.set_param('CovSaveOutputData', 'on');   % Save output data
cs.set_param('CovDataFileName', '$ModelName$_cvdata');   % Data file name
cs.set_param('CovMcdcMode', 'Masking');   % MCDC mode

% Design Verifier
try
  cs_componentCC = Sldv.ConfigComp;
  cs.attachComponent(cs_componentCC);
  cs.set_param('DVMode', 'TestGeneration');   % Mode
  cs.set_param('DVMaxProcessTime', 300);   % Maximum analysis time (s)
  cs.set_param('DVDisplayUnsatisfiableObjectives', 'off');   % Display unsatisfiable test objectives
  cs.set_param('DVAutomaticStubbing', 'on');   % Automatic stubbing of unsupported blocks and functions
  cs.set_param('DVDesignMinMaxConstraints', 'on');   % Use specified input minimum and maximum values
  cs.set_param('DVOutputDir', 'sldv_output/$ModelName$');   % Output folder
  cs.set_param('DVMakeOutputFilesUnique', 'on');   % Make output file names unique by adding a suffix
  cs.set_param('DVBlockReplacement', 'off');   % Apply block replacements
  cs.set_param('DVParameters', 'off');   % Enable parameter configuration
  cs.set_param('DVTestgenTarget', 'Model');   % Test generation target
  cs.set_param('DVModelCoverageObjectives', 'ConditionDecision');   % Model coverage objectives
  cs.set_param('DVTestConditions', 'UseLocalSettings');   % Test conditions
  cs.set_param('DVTestObjectives', 'UseLocalSettings');   % Test objectives
  cs.set_param('DVMaxTestCaseSteps', 500);   % Maximum test case steps
  cs.set_param('DVTestSuiteOptimization', 'CombinedObjectives (Nonlinear Extended)');   % Test suite optimization
  cs.set_param('DVExtendExistingTests', 'off');   % Extend existing test cases
  cs.set_param('DVIgnoreCovSatisfied', 'off');   % Ignore objectives satisfied in existing coverage data
  cs.set_param('DVCovFilter', 'off');   % Ignore objective based on filter
  cs.set_param('DVIncludeRelationalBoundary', 'off');   % Include relational boundary objectives
  cs.set_param('DVDetectDeadLogic', 'on');   % Dead logic
  cs.set_param('DVDetectActiveLogic', 'on');   % Identify active logic
  cs.set_param('DVAssertions', 'UseLocalSettings');   % Assertion blocks
  cs.set_param('DVProofAssumptions', 'UseLocalSettings');   % Proof assumptions
  cs.set_param('DVProvingStrategy', 'Prove');   % Strategy
  cs.set_param('DVSaveDataFile', 'on');   % Save test data to file
  cs.set_param('DVDataFileName', '$ModelName$_sldvdata');   % Data file name
  cs.set_param('DVSaveExpectedOutput', 'off');   % Include expected output values
  cs.set_param('DVRandomizeNoEffectData', 'off');   % Randomize data that do not affect the outcome
  cs.set_param('DVSaveHarnessModel', 'off');   % Generate separate harness model after analysis
  cs.set_param('DVSaveReport', 'off');   % Generate report of the results
  cs.set_param('DVSFcnSupport', 'on');   % Support S-Functions in the analysis
  cs.set_param('DVReduceRationalApprox', 'on');   % Run additional analysis to reduce instances of rational approximation
  cs.set_param('DVSFcnExtraOptions', '');   % Additional options for S-Functions
catch ME
  warning('Simulink:ConfigSet:AttachComponentError', ME.message);
end