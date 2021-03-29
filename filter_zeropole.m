function varargout = filter_zeropole(varargin)
% FILTER_ZEROPOLE MATLAB code for filter_zeropole.fig
%      FILTER_ZEROPOLE, by itself, creates a new FILTER_ZEROPOLE or raises the existing
%      singleton*.
%
%      H = FILTER_ZEROPOLE returns the handle to a new FILTER_ZEROPOLE or the handle to
%      the existing singleton*.
%
%      FILTER_ZEROPOLE('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in FILTER_ZEROPOLE.M with the given input arguments.
%
%      FILTER_ZEROPOLE('Property','Value',...) creates a new FILTER_ZEROPOLE or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before filter_zeropole_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to filter_zeropole_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help filter_zeropole

% Last Modified by GUIDE v2.5 01-May-2018 01:36:21

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @filter_zeropole_OpeningFcn, ...
                   'gui_OutputFcn',  @filter_zeropole_OutputFcn, ...
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


% --- Executes just before filter_zeropole is made visible.
function filter_zeropole_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to filter_zeropole (see VARARGIN)
set(handles.edit_amp_n2, 'enable', 'off')
set(handles.edit_ugao_n2, 'enable', 'off')
set(handles.edit_amp_p2, 'enable', 'off')
set(handles.edit_ugao_p2, 'enable', 'off')
handles.ime_filtra='ZP';
% Choose default command line output for filter_zeropole
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes filter_zeropole wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = filter_zeropole_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes when selected object is changed in uibuttongroup1.
function uibuttongroup1_SelectionChangedFcn(hObject, eventdata, handles)
% hObject    handle to the selected object in uibuttongroup1 
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
NF=get(handles.radiobutton_NF, 'Value');
VF=get(handles.radiobutton_VF, 'Value');
BP=get(handles.radiobutton_bandpass, 'Value');
BS=get(handles.radiobutton_bandstop, 'Value');

if (NF==1 || VF==1)
    set(handles.edit_amp_n2, 'enable', 'off')
    set(handles.edit_ugao_n2, 'enable', 'off')
    set(handles.edit_amp_p2, 'enable', 'off')
    set(handles.edit_ugao_p2, 'enable', 'off')
end

if (BP==1 || BS==1)
    set(handles.edit_amp_n2, 'enable', 'on')
    set(handles.edit_ugao_n2, 'enable', 'on')
    set(handles.edit_amp_p2, 'enable', 'on')
    set(handles.edit_ugao_p2, 'enable', 'on')
end



function edit_amp_n1_Callback(hObject, eventdata, handles)
% hObject    handle to edit_amp_n1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_amp_n1 as text
%        str2double(get(hObject,'String')) returns contents of edit_amp_n1 as a double


% --- Executes during object creation, after setting all properties.
function edit_amp_n1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_amp_n1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit_ugao_n1_Callback(hObject, eventdata, handles)
% hObject    handle to edit_ugao_n1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_ugao_n1 as text
%        str2double(get(hObject,'String')) returns contents of edit_ugao_n1 as a double


% --- Executes during object creation, after setting all properties.
function edit_ugao_n1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_ugao_n1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit_amp_p1_Callback(hObject, eventdata, handles)
% hObject    handle to edit_amp_p1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_amp_p1 as text
%        str2double(get(hObject,'String')) returns contents of edit_amp_p1 as a double


% --- Executes during object creation, after setting all properties.
function edit_amp_p1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_amp_p1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit_ugao_p1_Callback(hObject, eventdata, handles)
% hObject    handle to edit_ugao_p1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_ugao_p1 as text
%        str2double(get(hObject,'String')) returns contents of edit_ugao_p1 as a double


% --- Executes during object creation, after setting all properties.
function edit_ugao_p1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_ugao_p1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit_amp_n2_Callback(hObject, eventdata, handles)
% hObject    handle to edit_amp_n2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_amp_n2 as text
%        str2double(get(hObject,'String')) returns contents of edit_amp_n2 as a double


% --- Executes during object creation, after setting all properties.
function edit_amp_n2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_amp_n2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit_ugao_n2_Callback(hObject, eventdata, handles)
% hObject    handle to edit_ugao_n2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_ugao_n2 as text
%        str2double(get(hObject,'String')) returns contents of edit_ugao_n2 as a double


% --- Executes during object creation, after setting all properties.
function edit_ugao_n2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_ugao_n2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit_amp_p2_Callback(hObject, eventdata, handles)
% hObject    handle to edit_amp_p2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_amp_p2 as text
%        str2double(get(hObject,'String')) returns contents of edit_amp_p2 as a double


% --- Executes during object creation, after setting all properties.
function edit_amp_p2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_amp_p2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit_ugao_p2_Callback(hObject, eventdata, handles)
% hObject    handle to edit_ugao_p2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_ugao_p2 as text
%        str2double(get(hObject,'String')) returns contents of edit_ugao_p2 as a double


% --- Executes during object creation, after setting all properties.
function edit_ugao_p2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_ugao_p2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton_filtriraj.
function pushbutton_filtriraj_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton_filtriraj (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
NF=get(handles.radiobutton_NF, 'Value');
VF=get(handles.radiobutton_VF, 'Value');
BP=get(handles.radiobutton_bandpass, 'Value');
BS=get(handles.radiobutton_bandstop, 'Value');
global sig
global fs

if (NF==1 || VF==1)
    if NF==1
        handles.tip_filtra='NF';
    elseif VF==1
        handles.tip_filtra='VF';
    end
    rp1=str2num(get(handles.edit_amp_p1, 'String'));
    handles.rp1=rp1;
    
    up1=str2num(get(handles.edit_ugao_p1, 'String'));
    
    handles.up1=up1;
    
    rz1=str2num(get(handles.edit_amp_n1, 'String'));
    handles.rz1=rz1;
    
    uz1=str2num(get(handles.edit_ugao_n1, 'String'));
    handles.uz1=uz1;
    
    
    b=[1 -2*rz1*cos(uz1) rz1*rz1];
    a=[1 -2*rp1*cos(up1) rp1*rp1];
    y=filter(b, a, sig);
    X=fft(sig);
    Y=fft(y);
    
    axes(handles.axes1)
    f_osa=0:fs/length(y):(fs-fs/length(y));
    fh=f_osa(1:end/2);
    plot(fh, abs(X(1:end/2)));
    
    axes(handles.axes2)
    f_osa=0:fs/length(y):(fs-fs/length(y));
    fh=f_osa(1:end/2);
    plot(fh, abs(Y(1:end/2)));
    
    [H, w]=freqz(b, a, 256);
    f=w*fs/(2*pi);
    axes(handles.axes3)
    plot(f, abs(H))
    
elseif (BP==1 || BS==1)
    if BP==1
        handles.tip_filtra='BP';
    elseif BS==1
        handles.tip_filtra='BS';
    end
    rp1=str2num(get(handles.edit_amp_p1, 'String'));
    handles.rp1=rp1;
    up1=str2num(get(handles.edit_ugao_p1, 'String'));
    handles.up1=up1;
    rz1=str2num(get(handles.edit_amp_n1, 'String'));
    handles.rz1=rz1;
    uz1=str2num(get(handles.edit_ugao_n1, 'String'));
    handles.uz1=uz1;
    
    rp2=str2num(get(handles.edit_amp_p2, 'String'));
    handles.rp2=rp2;
    up2=str2num(get(handles.edit_ugao_p2, 'String'));
    handles.up2=up2;
    rz2=str2num(get(handles.edit_amp_n2, 'String'));
    handles.rz2=rz2;
    uz2=str2num(get(handles.edit_ugao_n2, 'String'));
    handles.uz2=uz2;
    
    b1=[1 -2*rz1*cos(uz1) rz1*rz1];
    a1=[1 -2*rp1*cos(up1) rp1*rp1];
    
    b2=[1 -2*rz2*cos(uz2) rz2*rz2];
    a2=[1 -2*rp2*cos(up2) rp2*rp2];
    b=conv(b1, b2);
    a=conv(a1, a2);
    y=filter(b, a, sig);
    X=fft(sig);
    Y=fft(y);
    
    axes(handles.axes1)
    f_osa=0:fs/length(y):(fs-fs/length(y));
    fh=f_osa(1:end/2);
    plot(fh, abs(X(1:end/2)));
    
    axes(handles.axes2)
    f_osa=0:fs/length(y):(fs-fs/length(y));
    fh=f_osa(1:end/2);
    plot(fh, abs(Y(1:end/2)));
    
    [H, w]=freqz(b, a, 256);
    f=w*fs/(2*pi);
    axes(handles.axes3)
    plot(f, abs(H))
end

guidata(hObject, handles);

function edit13_Callback(hObject, eventdata, handles)
% hObject    handle to edit13 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit13 as text
%        str2double(get(hObject,'String')) returns contents of edit13 as a double


% --- Executes during object creation, after setting all properties.
function edit13_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit13 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
ime_fajla=get(handles.edit13, 'String');

parametri.ime_filtra=handles.ime_filtra;
parametri.tip_filtra=handles.tip_filtra;
parametri.rp1=handles.rp1;
parametri.rz1=handles.rz1;
parametri.up1=handles.up1;
parametri.uz1=handles.uz1;

BP=get(handles.radiobutton_bandpass, 'Value');
BS=get(handles.radiobutton_bandstop, 'Value');
if (BP==1 || BS==1)
    parametri.rp2=handles.rp2;
    parametri.rz2=handles.rz2;
    parametri.up2=handles.up2;
    parametri.uz2=handles.uz2;
    
end
save(ime_fajla, 'parametri'); %U EDIT POLJE MORA DA SE UNESE IME_FAJLA.MAT
msgbox('Podaci sacuvani');
close(filter_zeropole);
uiresume();
