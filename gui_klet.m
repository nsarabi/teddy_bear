function varargout = gui_klet(varargin)
% GUI_KLET MATLAB code for gui_klet.fig
%      GUI_KLET, by itself, creates a new GUI_KLET or raises the existing
%      singleton*.
%
%      H = GUI_KLET returns the handle to a new GUI_KLET or the handle to
%      the existing singleton*.
%
%      GUI_KLET('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in GUI_KLET.M with the given input arguments.
%
%      GUI_KLET('Property','Value',...) creates a new GUI_KLET or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before gui_klet_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to gui_klet_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help gui_klet

% Last Modified by GUIDE v2.5 27-May-2012 13:46:35

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @gui_klet_OpeningFcn, ...
                   'gui_OutputFcn',  @gui_klet_OutputFcn, ...
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
end

% --- Executes just before gui_klet is made visible.
function gui_klet_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to gui_klet (see VARARGIN)

% Choose default command line output for gui_klet
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes gui_klet wait for user response (see UIRESUME)
% uiwait(handles.figure1);
end

% --- Outputs from this function are returned to the command line.
function varargout = gui_klet_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;
end


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global FName;
[FName]=uigetfile('*.m','Select Function');
FName = strrep(FName, '.m', '');
end

% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global FunName;

Step=100;
Length=101;

CurStr=zeros(1, Length);
CurStr(51)=1;
NextStr=zeros(1, Length);

for k=1:Step
    Image(k, :) = CurStr;
    for m = 2:(Length-1)
        NextStr(m)= FunName (CurStr(m-1), CurStr(m), CurStr(m+1));
    end
    CurStr=NextStr;
end
figure(2);
imagesc(Image);
colormap('gray');
end


% --- Executes on selection change in listbox1.
function listbox1_Callback(hObject, eventdata, handles)
% hObject    handle to listbox1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns listbox1 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from listbox1
end

% --- Executes during object creation, after setting all properties.
function listbox1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to listbox1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
end


% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global FName;
global FunName;
FunName = str2func(FName);
    set(handles.listbox1, 'String', FunName());
end