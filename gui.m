function varargout = gui(varargin)
% GUI MATLAB code for gui.fig
%      GUI, by itself, creates a new GUI or raises the existing
%      singleton*.
%
%      H = GUI returns the handle to a new GUI or the handle to
%      the existing singleton*.
%
%      GUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in GUI.M with the given input arguments.
%
%      GUI('Property','Value',...) creates a new GUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before gui_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to gui_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help gui

% Last Modified by GUIDE v2.5 02-Mar-2015 11:46:44

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @gui_OpeningFcn, ...
                   'gui_OutputFcn',  @gui_OutputFcn, ...
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


% --- Executes just before gui is made visible.
function gui_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to gui (see VARARGIN)

% Choose default command line output for gui
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes gui wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = gui_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in loadbutton.
function loadbutton_Callback(hObject, eventdata, handles)
% hObject    handle to loadbutton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
HDRImage_sRGBLinear = hdr_imread();
handles.image = HDRImage_sRGBLinear;
imshow(HDRImage_sRGBLinear, 'parent', handles.axes2);
guidata(hObject, handles);


% --- Executes on slider movement.
function bipolKappa_Callback(hObject, eventdata, handles)
% hObject    handle to bipolKappa (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
value = get(hObject,'Value');
caption = sprintf('Kappa: %.3f', value);
set(handles.bipolKappaLabel, 'String', caption);


% --- Executes during object creation, after setting all properties.
function bipolKappa_CreateFcn(hObject, eventdata, handles)
% hObject    handle to bipolKappa (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function bipolGaussSize_Callback(hObject, eventdata, handles)
% hObject    handle to bipolGaussSize (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
value = get(hObject,'Value');
caption = sprintf('Gauss Size: %.3f', value);
set(handles.bipolGaussSizeLabel, 'String', caption);


% --- Executes during object creation, after setting all properties.
function bipolGaussSize_CreateFcn(hObject, eventdata, handles)
% hObject    handle to bipolGaussSize (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function bipolGaussSigma_Callback(hObject, eventdata, handles)
% hObject    handle to bipolGaussSigma (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
value = get(hObject,'Value');
caption = sprintf('Gauss Sigma: %.3f', value);
set(handles.bipolGaussSigmaLabel, 'String', caption);


% --- Executes during object creation, after setting all properties.
function bipolGaussSigma_CreateFcn(hObject, eventdata, handles)
% hObject    handle to bipolGaussSigma (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on button press in processButton.
function processButton_Callback(hObject, eventdata, handles)
% hObject    handle to processButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
myControl = buildControlDataIE();
myControl.bipol.Kappa = get(handles.bipolKappa, 'Value');
myControl.bipol.gauss.size = floor(3*get(handles.bipolGaussSize, 'Value'));
myControl.bipol.gauss.sigma = get(handles.bipolGaussSigma, 'Value');

myControl.ganglion.Kappa = get(handles.ganglionKappa, 'Value');
myControl.ganglion.gauss.size = floor(3*get(handles.ganglionGaussSize, 'Value'));
myControl.ganglion.gauss.sigma = get(handles.ganglionGaussSigma, 'Value');

myControl.demosaic = get(handles.demosaicToggle, 'Value');

Iout = process(myControl, handles.image);
imshow(Iout, 'parent', handles.axes2);


% --- Executes on slider movement.
function ganglionKappa_Callback(hObject, eventdata, handles)
% hObject    handle to ganglionKappa (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
value = get(hObject,'Value');
caption = sprintf('Kappa: %.3f', value);
set(handles.ganglionKappaLabel, 'String', caption);


% --- Executes during object creation, after setting all properties.
function ganglionKappa_CreateFcn(hObject, eventdata, handles)
% hObject    handle to ganglionKappa (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function ganglionGaussSize_Callback(hObject, eventdata, handles)
% hObject    handle to ganglionGaussSize (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
value = get(hObject,'Value');
caption = sprintf('Gauss Size: %.3f', value);
set(handles.ganglionGaussSizeLabel, 'String', caption);


% --- Executes during object creation, after setting all properties.
function ganglionGaussSize_CreateFcn(hObject, eventdata, handles)
% hObject    handle to ganglionGaussSize (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function ganglionGaussSigma_Callback(hObject, eventdata, handles)
% hObject    handle to ganglionGaussSigma (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
value = get(hObject,'Value');
caption = sprintf('Gauss Sigma: %.3f', value);
set(handles.ganglionGaussSigmaLabel, 'String', caption);


% --- Executes during object creation, after setting all properties.
function ganglionGaussSigma_CreateFcn(hObject, eventdata, handles)
% hObject    handle to ganglionGaussSigma (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on button press in demosaicToggle.
function demosaicToggle_Callback(hObject, eventdata, handles)
% hObject    handle to demosaicToggle (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of demosaicToggle
