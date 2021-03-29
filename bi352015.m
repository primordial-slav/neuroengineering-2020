function varargout = bi352015(varargin)
% BI352015 MATLAB code for bi352015.fig
%      BI352015, by itself, creates a new BI352015 or raises the existing
%      singleton*.
%
%      H = BI352015 returns the handle to a new BI352015 or the handle to
%      the existing singleton*.
%
%      BI352015('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in BI352015.M with the given input arguments.
%
%      BI352015('Property','Value',...) creates a new BI352015 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before bi352015_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to bi352015_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help bi352015

% Last Modified by GUIDE v2.5 08-May-2020 13:50:36

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @bi352015_OpeningFcn, ...
                   'gui_OutputFcn',  @bi352015_OutputFcn, ...
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


% --- Executes just before bi352015 is made visible.
function bi352015_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to bi352015 (see VARARGIN)

% Choose default command line output for bi352015
global fs
handles.output = hObject;
load('signal1.mat')
sig=data.signal;
eeg=sig;
fs=data.Fs;
fs_eeg=fs;
axes(handles.axes1)


t=0:(1/data.Fs):(length(sig)-1)/data.Fs;
t_eeg=t;
plot(t, sig);
axis tight
% Update handles structure
guidata(hObject, handles);

% UIWAIT makes bi352015 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = bi352015_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on selection change in popupmenu1.
function popupmenu1_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
selectedIndex = get(handles.popupmenu1, 'Value');
switch selectedIndex
    case 1
        t=handles.vreme;
        signal=handles.signal;
        axes(handles.axes1)
        plot(t, signal)
        
        [x y] = ginput(2);
        
        
        r=sqrt((x(1)-x(2))^2+(y(1)-y(2))^2);
        
        
        
        ugao=0:0.001:2*pi;
        
        kosinus=cos(ugao);
        sinus=sin(ugao);
        
        tmpx=r*kosinus;
        tmpy=r*sinus;
        
        x_osa=x(1)+tmpx;
        y_osa=y(1)+tmpy;
        
        hold on
        axes(handles.axes1)
        plot(x_osa, y_osa);
        hold off
        
        
                
        indx=t>(x(1)-r) & t<(x(1)+r);
        t1=t(indx);
        sig1=signal(indx);
        axes(handles.axes2)
        plot(t1, sig1); 
        ylim([y(1)-r y(1)+r]);
        

        data.signal=sig1;
        data.Fs=100;
        handles.data=data;
    case 2
        t=handles.vreme;
        signal=handles.signal;
        axes(handles.axes1)
        plot(t, signal)
        
        [x y] = ginput(2);

        x_osa = [x(1),x(2), x(2), x(1), x(1)];
        y_osa = [y(2), y(2), y(1), y(1), y(2)];
        
        hold on
        axes(handles.axes1)
        plot(x_osa, y_osa, 'r');
        hold off
        
        ind= t>x(1) & t<=x(2);
        t1=t(ind);
        signal1=signal(ind);
        axes(handles.axes2)
        plot(t1, signal1);
        ylim([y(2) y(1)]);
        
        data.signal=signal1;
        data.Fs=100;
        handles.data=data;
        
end
        
guidata(hObject, handles); 
% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu1 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu1


% --- Executes during object creation, after setting all properties.
function popupmenu1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit1_Callback(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit1 as text
%        str2double(get(hObject,'String')) returns contents of edit1 as a double


% --- Executes during object creation, after setting all properties.
function edit1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
ime_fajla=get(handles.edit1, 'String');
data = handles.data;
save(ime_fajla, 'data'); 
msgbox('Podaci sacuvani');


% --- Executes when selected object is changed in uibuttongroup1.
function uibuttongroup1_SelectionChangedFcn(hObject, eventdata, handles)
% hObject    handle to the selected object in uibuttongroup1 
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
signal1=get(handles.radiobutton1, 'Value');
signal2=get(handles.radiobutton2, 'Value');
signal3=get(handles.radiobutton3, 'Value');

global sig
global fs
global t

if signal1==1
    load('signal1.mat')
    sig=data.signal;
    fs=data.Fs;
    axes(handles.axes1)
    
    
    t=0:(1/data.Fs):(length(sig)-1)/data.Fs;
    plot(t, sig);
    axis tight
    handles.vreme=t;
    handles.signal=data.signal;
end

if signal2==1
    load('signal2.mat')
    sig=data.signal;
    fs=data.Fs;
    axes(handles.axes1)
    
    t=0:(1/data.Fs):(length(sig)-1)/data.Fs;
    plot(t, sig);
    axis tight
    handles.vreme=t;
    handles.signal=data.signal;
end

if signal3==1
    load('signal3.mat')
    sig=data.signal;
    fs=data.Fs;
    axes(handles.axes1)
    
    t=0:(1/data.Fs):(length(data.signal)-1)/data.Fs;
    plot(t, data.signal);
    axis tight
    handles.vreme=t;
    handles.signal=data.signal;
end
    
guidata(hObject, handles);   


% --- Executes on selection change in popupmenu2.
function popupmenu2_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
selectedIndex = get(handles.popupmenu2, 'Value');

switch selectedIndex
    case 1
        uiwait(filter_zeropole)
    case 2
        uiwait(filter_butter)
    case 3
        uiwait(filter_cheby)   
end   
% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu2 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu2


% --- Executes during object creation, after setting all properties.
function popupmenu2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit2_Callback(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit2 as text
%        str2double(get(hObject,'String')) returns contents of edit2 as a double


% --- Executes during object creation, after setting all properties.
function edit2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
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
ime_fajla=get(handles.edit2, 'String');
load(ime_fajla);
msgbox('Podaci su ucitani.');
global sig
global fs

switch parametri.ime_filtra
    case 'ZP'
        if strcmp(parametri.tip_filtra, 'NF') || strcmp(parametri.tip_filtra, 'VF')
			
			b=[1 -2*parametri.rz1*cos(parametri.uz1) parametri.rz1*parametri.rz1];
    		a=[1 -2*parametri.rp1*cos(parametri.up1) parametri.rp1*parametri.rp1];
    		y=filter(b, a, sig);
    		X=fft(sig);
    		Y=fft(y);
    
    		axes(handles.axes3)
    		f_osa=0:fs/length(y):(fs-fs/length(y));
    		fh=f_osa(1:end/2);
    		plot(fh, abs(X(1:end/2)));
    
    		axes(handles.axes4)
    		f_osa=0:fs/length(y):(fs-fs/length(y));
    		fh=f_osa(1:end/2);
    		plot(fh, abs(Y(1:end/2)));
    
    		[H, w]=freqz(b, a, 256);
    		f=w*fs/(2*pi);
    		axes(handles.axes5)
    		plot(f, abs(H))
		elseif strcmp(parametri.tip_filtra, 'BP') || strcmp(parametri.tip_filtra, 'BS')
			
			b1=[1 -2*parametri.rz1*cos(parametri.uz1) parametri.rz1*parametri.rz1];
			a1=[1 -2*parametri.rp1*cos(parametri.up1) parametri.rp1*parametri.rp1];
		
			b2=[1 -2*parametri.rz2*cos(parametri.uz2) parametri.rz2*parametri.rz2];
			a2=[1 -2*parametri.rp2*cos(parametri.up2) parametri.rp2*parametri.rp2];
			
			b=conv(b1, b2);
			a=conv(a1, a2);
			y=filter(b, a, sig);
			X=fft(sig);
			Y=fft(y);
		
			axes(handles.axes3)
			f_osa=0:fs/length(y):(fs-fs/length(y));
			fh=f_osa(1:end/2);
			plot(fh, abs(X(1:end/2)));
		
			axes(handles.axes4)
			f_osa=0:fs/length(y):(fs-fs/length(y));
			fh=f_osa(1:end/2);
			plot(fh, abs(Y(1:end/2)));
		
			[H, w]=freqz(b, a, 256);
			f=w*fs/(2*pi);
			axes(handles.axes5)
			plot(f, abs(H))
        end
	case 'butter'
		if strcmp(parametri.tip_filtra, 'NF') || strcmp(parametri.tip_filtra, 'VF')
			
			[n, Wn]=buttord(parametri.Wp, parametri.Wa, parametri.max_slabljenje, abs(parametri.max_slabljenje-parametri.min_slabljenje));
			if strcmp(parametri.tip_filtra, 'NF')
				
				[P, Q]=butter(n, Wn, 'low');
			elseif strcmp(parametri.tip_filtra, 'VF')
				handles.tip_filtra='VF';
				[P, Q]=butter(n, Wn, 'high');
			end
			Fp=parametri.Wp*fs/2;
			[H, w]=freqz(P, Q, Fp);

		
		
			y=filter(P, Q, sig);
			X=fft(sig);
			Y=fft(y);
		
		
		
			axes(handles.axes3)
			f_osa=0:fs/length(y):(fs-fs/length(y));
			fh=f_osa(1:end/2);
			plot(fh, abs(X(1:end/2)));
		
			axes(handles.axes4)
			f_osa=0:fs/length(y):(fs-fs/length(y));
			fh=f_osa(1:end/2);
			plot(fh, abs(Y(1:end/2)));
		
		
			f=w*fs/(2*pi);
			axes(handles.axes5)
			plot(f, abs(H))
		elseif strcmp(parametri.tip_filtra, 'BP') || strcmp(parametri.tip_filtra, 'BS')
			
			Rs=abs(parametri.max_slabljenje-parametri.min_slabljenje);
    
			[n, Wn]=buttord(parametri.Wp, parametri.Wa, parametri.max_slabljenje, Rs);
		
			if strcmp(parametri.tip_filtra, 'BP')
				
				[P, Q]=butter(n, Wn, 'bandpass');
			elseif strcmp(parametri.tip_filtra, 'BS')
				
				[P, Q]=butter(n, Wn, 'stop');
			end
			Fp1=parametri.Wp(1)*fs/2;
			[H, w]=freqz(P, Q, Fp1);
				
		
		
		
			y=filter(P, Q, sig);
			X=fft(sig);
			Y=fft(y);
		
			axes(handles.axes3)
			f_osa=0:fs/length(y):(fs-fs/length(y));
			fh=f_osa(1:end/2);
			plot(fh, abs(X(1:end/2)));
		
			axes(handles.axes4)
			f_osa=0:fs/length(y):(fs-fs/length(y));
			fh=f_osa(1:end/2);
			plot(fh, abs(Y(1:end/2)));
		
		
			f=w*fs/(2*pi);
			axes(handles.axes5)
			plot(f, abs(H))
        end
	case 'cheby1'
		if strcmp(parametri.tip_filtra, 'NF') || strcmp(parametri.tip_filtra, 'VF')
			
			[n, Wn]=cheb1ord(parametri.Wp, parametri.Wa, parametri.max_slabljenje, abs(parametri.max_slabljenje-parametri.min_slabljenje));
			if strcmp(parametri.tip_filtra, 'NF')
				
				[P, Q]=cheby1(n, parametri.max_slabljenje, Wn, 'low');
			elseif strcmp(parametri.tip_filtra, 'VF')
				handles.tip_filtra='VF';
				[P, Q]=cheby1(n, parametri.max_slabljenje, Wn, 'high');
			end
			Fp=parametri.Wp*fs/2;
			[H, w]=freqz(P, Q, Fp);

		
		
			y=filter(P, Q, sig);
			X=fft(sig);
			Y=fft(y);
		
		
		
			axes(handles.axes3)
			f_osa=0:fs/length(y):(fs-fs/length(y));
			fh=f_osa(1:end/2);
			plot(fh, abs(X(1:end/2)));
		
			axes(handles.axes4)
			f_osa=0:fs/length(y):(fs-fs/length(y));
			fh=f_osa(1:end/2);
			plot(fh, abs(Y(1:end/2)));
		
		
			f=w*fs/(2*pi);
			axes(handles.axes5)
			plot(f, abs(H))
		elseif strcmp(parametri.tip_filtra, 'BP') || strcmp(parametri.tip_filtra, 'BS')
			
			Rs=abs(parametri.max_slabljenje-parametri.min_slabljenje);
		
		
		
		
			[n, Wn]=cheb1ord(parametri.Wp, parametri.Wa, parametri.max_slabljenje, Rs);
			if strcmp(parametri.tip_filtra, 'BP')
				
				[P, Q]=cheby1(n, parametri.max_slabljenje, Wn, 'bandpass');
            elseif strcmp(parametri.tip_filtra, 'BS')
				
				[P, Q]=cheby1(n, parametri.max_slabljenje, Wn, 'stop');
			end
			Fp1=parametri.Wp(1)*fs/2;
			[H, w]=freqz(P, Q, Fp1);
				
		
		
		
			y=filter(P, Q, sig);
			X=fft(sig);
			Y=fft(y);
		
			axes(handles.axes3)
			f_osa=0:fs/length(y):(fs-fs/length(y));
			fh=f_osa(1:end/2);
			plot(fh, abs(X(1:end/2)));
		
			axes(handles.axes4)
			f_osa=0:fs/length(y):(fs-fs/length(y));
			fh=f_osa(1:end/2);
			plot(fh, abs(Y(1:end/2)));
		
		
			f=w*fs/(2*pi);
			axes(handles.axes5)
			plot(f, abs(H))
        end
end
