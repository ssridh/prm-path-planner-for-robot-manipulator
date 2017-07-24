function varargout = probabilisticRoadmap(varargin)
%PROBABILISTICROADMAP MATLAB code file for probabilisticRoadmap.fig
%      PROBABILISTICROADMAP, by itself, creates a new PROBABILISTICROADMAP or raises the existing
%      singleton*.
%
%      H = PROBABILISTICROADMAP returns the handle to a new PROBABILISTICROADMAP or the handle to
%      the existing singleton*.
%
%      PROBABILISTICROADMAP('Property','Value',...) creates a new PROBABILISTICROADMAP using the
%      given property value pairs. Unrecognized properties are passed via
%      varargin to probabilisticRoadmap_OpeningFcn.  This calling syntax produces a
%      warning when there is an existing singleton*.
%
%      PROBABILISTICROADMAP('CALLBACK') and PROBABILISTICROADMAP('CALLBACK',hObject,...) call the
%      local function named CALLBACK in PROBABILISTICROADMAP.M with the given input
%      arguments.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help probabilisticRoadmap

% Last Modified by GUIDE v2.5 02-May-2017 21:48:45

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @probabilisticRoadmap_OpeningFcn, ...
                   'gui_OutputFcn',  @probabilisticRoadmap_OutputFcn, ...
                   'gui_LayoutFcn',  [], ...
                   'gui_Callback',   []);
               
%initialize default start and goal position
startPos = [10, 10, 0, 90];
goalPos = [90, 80, 60, 30];

if nargin && ischar(varargin{1})
   gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before probabilisticRoadmap is made visible.
function probabilisticRoadmap_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   unrecognized PropertyName/PropertyValue pairs from the
%            command line (see VARARGIN)

% Choose default command line output for probabilisticRoadmap
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes probabilisticRoadmap wait for user response (see UIRESUME)
% uiwait(handles.figure1);
if strcmp(get(hObject,'Visible'),'off')
    cla;
    initializeEnvironment(0);
    
    %plot initial environment
    plotEnvironment();
    config = [0 0 0 90];
    initConfig = constructManipulator(config);
    plotManipulator(initConfig, 0);
    
end

% --- Outputs from this function are returned to the command line.
function varargout = probabilisticRoadmap_OutputFcn(hObject, eventdata, handles)
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function startX_Callback(hObject, eventdata, handles)
% hObject    handle to startX (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of startX as text
%        str2double(get(hObject,'String')) returns contents of startX as a double
global startPos;
startX = str2double(get(hObject,'String'));
startPos(1) = startX;

% --- Executes during object creation, after setting all properties.
function startX_CreateFcn(hObject, eventdata, handles)
% hObject    handle to startX (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function startY_Callback(hObject, eventdata, handles)
% hObject    handle to startY (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of startY as text
%        str2double(get(hObject,'String')) returns contents of startY as a double
global startPos;
startY = str2double(get(hObject,'String'));
startPos(2) = startY;

% --- Executes during object creation, after setting all properties.
function startY_CreateFcn(hObject, eventdata, handles)
% hObject    handle to startY (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function startTheta1_Callback(hObject, eventdata, handles)
% hObject    handle to startTheta1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of startTheta1 as text
%        str2double(get(hObject,'String')) returns contents of startTheta1 as a double
global startPos;
startTheta1 = str2double(get(hObject,'String'));
startPos(3) = startTheta1;

% --- Executes during object creation, after setting all properties.
function startTheta1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to startTheta1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function startTheta2_Callback(hObject, eventdata, handles)
% hObject    handle to startTheta2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of startTheta2 as text
%        str2double(get(hObject,'String')) returns contents of startTheta2 as a double
global startPos;
startTheta2 = str2double(get(hObject,'String'));
startPos(4) = startTheta2;

% --- Executes during object creation, after setting all properties.
function startTheta2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to startTheta2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function goalX_Callback(hObject, eventdata, handles)
% hObject    handle to goalX (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of goalX as text
%        str2double(get(hObject,'String')) returns contents of goalX as a double
global goalPos;
goalX = str2double(get(hObject,'String'));
goalPos(1) = goalX;

% --- Executes during object creation, after setting all properties.
function goalX_CreateFcn(hObject, eventdata, handles)
% hObject    handle to goalX (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function goalY_Callback(hObject, eventdata, handles)
% hObject    handle to goalY (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of goalY as text
%        str2double(get(hObject,'String')) returns contents of goalY as a double
global goalPos;
goalY = str2double(get(hObject,'String'));
goalPos(2) = goalY;

% --- Executes during object creation, after setting all properties.
function goalY_CreateFcn(hObject, eventdata, handles)
% hObject    handle to goalY (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function goalTheta1_Callback(hObject, eventdata, handles)
% hObject    handle to goalTheta1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of goalTheta1 as text
%        str2double(get(hObject,'String')) returns contents of goalTheta1 as a double
global goalPos;
goalTheta1 = str2double(get(hObject,'String'));
goalPos(3) = goalTheta1;

% --- Executes during object creation, after setting all properties.
function goalTheta1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to goalTheta1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function goalTheta2_Callback(hObject, eventdata, handles)
% hObject    handle to goalTheta2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of goalTheta2 as text
%        str2double(get(hObject,'String')) returns contents of goalTheta2 as a double
global goalPos;
goalTheta2 = str2double(get(hObject,'String'));
goalPos(4) = goalTheta2;

% --- Executes during object creation, after setting all properties.
function goalTheta2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to goalTheta2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% --- Executes on button press in drawInitialEnvironment.
function drawInitialEnvironment_Callback(hObject, eventdata, handles)
% hObject    handle to drawInitialEnvironment (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
    global startPos goalPos;
    set(handles.text13, 'String', 'Initializing environment');
    %get start and goal position
    updateStartPos(handles);
    updateGoalPos(handles);
    cla;
    %plot environment
    plotEnvironment();
    startConfig = constructManipulator(startPos);
    if boundaryCheck(startConfig) && ~collisionCheck(startConfig)
        plotManipulator(startConfig, 1);  
    else
        errordlg('Start position is out of bounds or colliding with obstacles');         
    end
    goalConfig = constructManipulator(goalPos);
    if boundaryCheck(goalConfig) && ~collisionCheck(goalConfig)
        plotManipulator(goalConfig, 2); 
    else
        errordlg('Goal position is out of bounds or colliding with obstacles');
    end
    set(handles.text13, 'String', 'Initialized environment');

% --- Executes on button press in constructRoadmap.
function constructRoadmap_Callback(hObject, eventdata, handles)
% hObject    handle to constructRoadmap (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
    global startPos goalPos;
    %PRM algorithm
    updateStartPos(handles);
    updateGoalPos(handles);
    noOfConfigs = 100;
    noOfNeighbors = 10;
    distanceThreshold = 30;
    cla;
    plotEnvironment();
    startConfig = constructManipulator(startPos);
    plotManipulator(startConfig, 1);  
    goalConfig = constructManipulator(goalPos);
    plotManipulator(goalConfig, 2); 
    set(handles.text13, 'String', 'Constructing roadmap');
    generateRandomConfigurations(noOfConfigs);
    constructRoadmap(noOfConfigs, noOfNeighbors, distanceThreshold);               
    %plot roadmap
    plotRoadmap();
    set(handles.text13, 'String', 'Roadmap constructed');


% --- Executes on button press in displayPath.
function displayPath_Callback(hObject, eventdata, handles)
% hObject    handle to displayPath (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
    set(handles.text13, 'String', 'Querying and displaying path');
    global startPos goalPos;
    updateStartPos(handles);
    updateGoalPos(handles);
    path = getShortestPath()
    if length(path) == 0
        msgbox('No path found from start to goal');
        set(handles.text13, 'String', '');
        return;
    end     
    %trajectory planning
    trajectoryPlanning(path);     
    %plot path
    plotTrajectory();
    set(handles.text13, 'String', 'Path Completed');



function updateStartPos(handles)
    global startPos;
    startPos(1) = str2double(get(handles.startX,'String'));
    startPos(2) = str2double(get(handles.startY,'String'));
    startPos(3) = str2double(get(handles.startTheta1,'String'));
    startPos(4) = str2double(get(handles.startTheta2,'String'));
    
    
    
function updateGoalPos(handles)
    global goalPos;
    goalPos(1) = str2double(get(handles.goalX,'String'));
    goalPos(2) = str2double(get(handles.goalY,'String'));
    goalPos(3) = str2double(get(handles.goalTheta1,'String'));
    goalPos(4) = str2double(get(handles.goalTheta2,'String'));
  

function obsNo_Callback(hObject, eventdata, handles)
% hObject    handle to obsNo (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of obsNo as text
%        str2double(get(hObject,'String')) returns contents of obsNo as a double


% --- Executes during object creation, after setting all properties.
function obsNo_CreateFcn(hObject, eventdata, handles)
% hObject    handle to obsNo (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on slider movement.
function obsSlider_Callback(hObject, eventdata, handles)
% hObject    handle to obsSlider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
obsNo = round(get(hObject,'Value'));
set(handles.obsSlider,'Value',obsNo);
set(handles.obsNo,'String',obsNo);
initializeEnvironment(obsNo);

% --- Executes during object creation, after setting all properties.
function obsSlider_CreateFcn(hObject, eventdata, handles)
% hObject    handle to obsSlider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end
