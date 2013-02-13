function varargout = WSNMain(varargin)
% WSNMAIN MATLAB code for WSNMain.fig
%      WSNMAIN, by itself, creates a new WSNMAIN or raises the existing
%      singleton*.
%
%      H = WSNMAIN returns the handle to a new WSNMAIN or the handle to
%      the existing singleton*.
%
%      WSNMAIN('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in WSNMAIN.M with the given input arguments.
%
%      WSNMAIN('Property','Value',...) creates a new WSNMAIN or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before WSNMain_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to WSNMain_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help WSNMain

% Last Modified by GUIDE v2.5 31-Oct-2012 23:17:25

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @WSNMain_OpeningFcn, ...
                   'gui_OutputFcn',  @WSNMain_OutputFcn, ...
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


% --- Executes just before WSNMain is made visible.
function WSNMain_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to WSNMain (see VARARGIN)



% Choose default command line output for WSNMain
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes WSNMain wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = WSNMain_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes during object creation, after setting all properties.
function figure1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to figure1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% --- Executes during object creation, after setting all properties.
function uipanel1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to uipanel1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

handles = guidata(hObject);

[ALL, S] = main(150);
handles.ALL = ALL;
handles.S = S;

guidata(hObject, handles);

% --- Executes during object creation, after setting all properties.
function uitable2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to uitable2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

handles = guidata(hObject);

PALL = handles.ALL;

set(hObject, 'Data', PALL(:,:,2));

guidata(hObject, handles);


% --- Executes during object creation, after setting all properties.
function uitable3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to uitable3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

handles = guidata(hObject);

PALL = handles.ALL;

set(hObject, 'Data', PALL(:,:,3));

guidata(hObject, handles);


% --- Executes during object creation, after setting all properties.
function uitable4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to uitable4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

handles = guidata(hObject);

PALL = handles.ALL;

set(hObject, 'Data', PALL(:,:,4));

guidata(hObject, handles);


% --- Executes during object creation, after setting all properties.
function uitable5_CreateFcn(hObject, eventdata, handles)
% hObject    handle to uitable5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

handles = guidata(hObject);

PALL = handles.ALL;

set(hObject, 'Data', PALL(:,:,5));

guidata(hObject, handles);


% --- Executes during object creation, after setting all properties.
function uitable1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to uitable1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

handles = guidata(hObject);

PALL = handles.ALL;

set(hObject, 'Data', PALL(:,:,1));

guidata(hObject, handles);

% --- Executes during object creation, after setting all properties.
function uipanel2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to uipanel2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

%handles = guidata(hObject);

%PALL = handles.ALL;

%hist(PALL(:,2,1));

%guidata(hObject, handles);
