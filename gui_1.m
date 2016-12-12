function varargout = gui_1(varargin)
% GUI_1 MATLAB code for gui_1.fig
%      GUI_1, by itself, creates a new GUI_1 or raises the existing
%      singleton*.
%
%      H = GUI_1 returns the handle to a new GUI_1 or the handle to
%      the existing singleton*.
%
%      GUI_1('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in GUI_1.M with the given input arguments.
%
%      GUI_1('Property','Value',...) creates a new GUI_1 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before gui_1_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to gui_1_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help gui_1

% Last Modified by GUIDE v2.5 12-Dec-2016 10:33:05

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @gui_1_OpeningFcn, ...
                   'gui_OutputFcn',  @gui_1_OutputFcn, ...
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


% --- Executes just before gui_1 is made visible.
function gui_1_OpeningFcn(hObject, eventdata, handles, varargin)

% cizdirilecek nesneleri tanýmlýyoruz
handles.peaks = peaks(35);
handles.membrane = membrane;
[x,y]=meshgrid(-8:0.5:8);
r = sqrt(x.^2+y.^2)+eps;
sinc = sin(r)./r;

handles.sinc =sinc;
% ilk baþta bir þey secilmezse bunu cizsin diye
handles.current_data=handles.peaks;
surf(handles.current_data);
handles.output = hObject;

guidata(hObject, handles);


function varargout = gui_1_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on selection change in plot_popup.
function plot_popup_Callback(hObject, eventdata, handles)

value=get(hObject,'Value')
yazi=get(handles.plot_popup,'String');

switch value
    case 1
        handles.current_data = handles.peaks;
    case 2
        handles.current_data = handles.membrane;
    case 3
        handles.current_data=handles.sinc;
end

guidata(hObject,handles);
function plot_popup_CreateFcn(hObject, eventdata, handles)





if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in button1.
function button1_Callback(hObject, eventdata, handles)

surf(handles.current_data);


% --- Executes on button press in button2.
function button2_Callback(hObject, eventdata, handles)

mesh(handles.current_data);

% --- Executes on button press in button3.
function button3_Callback(hObject, eventdata, handles)

contour(handles.current_data);

function Untitled_1_Callback(hObject, eventdata, handles)
% hObject    handle to Untitled_1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
