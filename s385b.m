function varargout = s385b(varargin)
% s385b M-file for s385b.fig
%      s385b, by itself, creates a new s385b or raises the existing
%      singleton*.
%
%      H = s385b returns the handle to a new s385b or the handle to
%      the existing singleton*.
%
%      s385b('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in s385b.M with the given input arguments.
%
%      s385b('Property','Value',...) creates a new s385b or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before s385b_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to s385b_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help s385b

% Last Modified by GUIDE v2.5 07-Apr-2014 17:57:53

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @s385b_OpeningFcn, ...
                   'gui_OutputFcn',  @s385b_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before s385b is made visible.
function s385b_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to s385b (see VARARGIN)

% Choose default command line output for s385b
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes s385b wait for user response (see UIRESUME)
% uiwait(handles.figure1);

% --- Outputs from this function are returned to the command line.
function varargout = s385b_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
 
% Get default command line output from handles structure
varargout{1} = handles.output;

% --- Executes on button press in pbFloorRC.
function pbFloorRC_Callback(hObject, eventdata, handles)
% hObject    handle to pbFloorRC (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global targets
targets(1) = 1
nextFloor();

% --- Executes on button press in pbFloor2.
function pbFloor2_Callback(hObject, eventdata, handles)
% hObject    handle to pbFloor2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global targets
targets(2) = 1
nextFloor()

% --- Executes on button press in pbFloor3.
function pbFloor3_Callback(hObject, eventdata, handles)
% hObject    handle to pbFloor3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global targets
targets(3) = 1
nextFloor();

% --- Executes on button press in pbFloor4.
function pbFloor4_Callback(hObject, eventdata, handles)
% hObject    handle to pbFloor4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global targets
targets(4) = 1
nextFloor()

% --- Executes on button press in pbFloor5.
function pbFloor5_Callback(hObject, eventdata, handles)
% hObject    handle to pbFloor5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global targets
targets(5) = 1
nextFloor();


% --- Executes on button press in pbFloor6.
function pbFloor6_Callback(hObject, eventdata, handles)
% hObject    handle to pbFloor6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global targets
targets(6) = 1
nextFloor();

% --- Executes on button press in pushbuttonSTOP.
function pushbuttonSTOP_Callback(hObject, eventdata, handles)
% hObject    handle to pushbuttonSTOP (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global targets
global direction
global currentFloor
targets = [0, 0, 0, 0, 0, 0]
currentFloor = 0;
direction = 1;
set_param('s385/targetFloor', 'Gain', '[0]');

% --- Changes from one floor to the next floor. (button press helper
% method)
function nextFloor()
    global currentFloor;
    global targets;
    global direction;
	check = currentFloor;
	numChanges = 0;
    while numChanges < 12
        numChanges = numChanges + 1;
        check = check + direction;
        if check > 6
            check = 6;
            direction = -1;
        end
        if check < 1
            check = 1;
            direction = 1;
        end
        if targets(check) == 1
            currentFloor = check
            targets(check) = 0
            numChanges = 9999;
        end
    end
    set_param('s385/targetFloor', 'Gain', ['[' num2str(currentFloor - 1) ']']');

% --- Executes during object creation, after setting all properties.
function figure1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to figure1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
  
    global currentFloor
    global targets
    global direction
    currentFloor = 1
    targets = [0, 0, 0, 0, 0, 0]
    direction = 1
    run('s385');
    
% --- Executes on button press in mEqual2m.
function mEqual2m_Callback(hObject, eventdata, handles)
% hObject    handle to mEqual2m (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of mEqual2m
