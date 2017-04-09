function varargout = firstGUI(varargin)
% FIRSTGUI MATLAB code for firstGUI.fig
%      FIRSTGUI, by itself, creates a new FIRSTGUI or raises the existing
%      singleton*.
%
%      H = FIRSTGUI returns the handle to a new FIRSTGUI or the handle to
%      the existing singleton*.
%
%      FIRSTGUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in FIRSTGUI.M with the given input arguments.
%
%      FIRSTGUI('Property','Value',...) creates a new FIRSTGUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before firstGUI_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to firstGUI_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help firstGUI

% Last Modified by GUIDE v2.5 08-Apr-2017 19:54:52

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @firstGUI_OpeningFcn, ...
                   'gui_OutputFcn',  @firstGUI_OutputFcn, ...
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


% --- Executes just before firstGUI is made visible.
function firstGUI_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to firstGUI (see VARARGIN)

% Choose default command line output for firstGUI
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes firstGUI wait for user response (see UIRESUME)
% uiwait(handles.figure1);
clear a;
global a;
a = arduino;            


% --- Outputs from this function are returned to the command line.
function varargout = firstGUI_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in on.
function on_Callback(hObject, eventdata, handles)
% hObject    handle to on (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global a;
writeDigitalPin(a, 'D3', 1);
writeDigitalPin(a, 'D4', 1);
writeDigitalPin(a, 'D5', 1);

% --- Executes on button press in off.
function off_Callback(hObject, eventdata, handles)
% hObject    handle to off (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global a;
writeDigitalPin(a, 'D3', 0);
writeDigitalPin(a, 'D4', 0);
writeDigitalPin(a, 'D5', 0);

%-------THIS IS EXTRA PART!!
% --- Executes on button press in blink.
function blink_Callback(hObject, eventdata, handles)
% hObject    handle to blink (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global a;
for i = 1:10
      writeDigitalPin(a, 'D3', 0);
      writeDigitalPin(a, 'D4', 0);
      writeDigitalPin(a, 'D5', 0);
      pause(0.5);
      writeDigitalPin(a, 'D3', 1);
      writeDigitalPin(a, 'D4', 1);
      writeDigitalPin(a, 'D5', 1);
      pause(0.5);
   end


% --- Executes on slider movement.
function slider_Callback(hObject, eventdata, handles)
% hObject    handle to slider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function slider_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end
