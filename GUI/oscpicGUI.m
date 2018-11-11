


function varargout = oscpicGUI(varargin)
% OSCPICGUI MATLAB code for oscpicGUI.fig
%      OSCPICGUI, by itself, creates a new OSCPICGUI or raises the existing
%      singleton*.
%
%      H = OSCPICGUI returns the handle to a new OSCPICGUI or the handle to
%      the existing singleton*.
%
%      OSCPICGUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in OSCPICGUI.M with the given input arguments.
%
%      OSCPICGUI('Property','Value',...) creates a new OSCPICGUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before oscpicGUI_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to oscpicGUI_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help oscpicGUI

% Last Modified by GUIDE v2.5 11-Nov-2018 02:35:04

% Begin initialization code - DO NOT EDIT
    gui_Singleton = 1;
    gui_State = struct('gui_Name',       mfilename, ...
        'gui_Singleton',  gui_Singleton, ...
        'gui_OpeningFcn', @oscpicGUI_OpeningFcn, ...
        'gui_OutputFcn',  @oscpicGUI_OutputFcn, ...
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




% --- Executes just before oscpicGUI is made visible.
function oscpicGUI_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to oscpicGUI (see VARARGIN)
global t
global i
global song
global fs
global A
global freq
global dur
global phi
global inc
global C
global funcx1
global funcy1
global funcx2
global funcy2
global funcx3
global funcy3
global freq2
global A2
global phi2
freq2=220;
A2=8;
phi2=0;
global freq3
global A3
global phi3
freq3=220;
A3=8;
phi3=0;
global freq4
global A4
global phi4
freq4=220;
A4=8;
phi4=0;
global freq5
global A5
global phi5
freq5=220;
A5=8;
phi5=0;
global freq6
global A6
global phi6
freq6=220;
A6=8;
phi6=0;
funcx1=0;
funcy1=1;
funcx2=0;
funcy2=1;
funcx3=0;
funcy3=1;
global ch;
global ch2;
global ch3;
global ch6;
global ch4;
global ch5;
ch=0;
ch2=0;
ch3=0;
ch4=0;
ch5=0;
ch6=0;
global rep;
rep =1;
% create empty song variable
    song = 0;
    

    % Choose default command line output for oscpicGUI
    handles.output = hObject;

    % Update handles structure
    guidata(hObject, handles);

    % UIWAIT makes oscpicGUI wait for usglobal t;

    fs=44100;
    A=8;
    freq=440;
    phi=pi/4;
    dur=.5;
    inc=5;
    C=1;
    i=1/fs;
    t = 0:i:dur;

    % uiwait(handles.figure1);
end


% --- Outputs from this function are returned to the command line.
function varargout = oscpicGUI_OutputFcn(hObject, eventdata, handles)
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
    varargout{1} = handles.output;
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

% --- Executes on selection change in listbox2.
function listbox2_Callback(hObject, eventdata, handles)
% hObject    handle to listbox2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns listbox2 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from listbox2
end

% --- Executes during object creation, after setting all properties.
function listbox2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to listbox2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
    if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
        set(hObject,'BackgroundColor','white');
    end
end

% --- Executes on slider movement.
function slider1_Callback(hObject, eventdata, handles)
% hObject    handle to slider1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
global rep; 
small=get(hObject,'Min');
big=get(hObject,'Max');
rep=get(hObject,'Value');
end

% --- Executes during object creation, after setting all properties.
function slider1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
    if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
        set(hObject,'BackgroundColor',[.9 .9 .9]);
    end
end

% --- Executes on selection change in popupmenu1.
function popupmenu1_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu1 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu1
% Determine the selected data set.
    str = get(hObject, 'String'); %creates cell array filled with condents of menu
    val = get(hObject,'Value'); %returns item that is currently selected
    val
global funcx1;
    switch str{val}

        case 'What is the first X base function?'
            funcx1=0;
        case 'A*sin(2*pi*freq*t+phi)+C'
            funcx1=1;
        case 'A*t+C'
            funcx1=2;
        case 'A*square(t)+C'
            funcx1=3;
        case 'A*squareroot(t)+C'
            funcx1=4;
    end
    % Save the handles structure.
    guidata(hObject,handles)
end

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
end

% --- Executes on selection change in popupmenu2.
function popupmenu2_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu2 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu2
str = get(hObject, 'String'); %creates cell array filled with condents of menu
val = get(hObject,'Value'); %returns item that is currently selected
val
global funcy1;
disp(str{val})
    switch str{val}

        case 'What is the first X base function?'
            funcy1=0;
            
        case 'A*sin(2*pi*freq*t+phi)+C'
            funcy1=1;
        case 'A*t+C'
            funcy1=2;
        case 'A*square(t)+C'
            funcy1=3;
        case 'A*squareroot(t)+C'
            funcy1=4;
    end
end

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
end

% --- Executes on slider movement.
function slider4_Callback(hObject, eventdata, handles)
% hObject    handle to slider4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
global A; 
small=get(hObject,'Min');
big=get(hObject,'Max');
A=get(hObject,'Value');
end


% --- Executes during object creation, after setting all properties.
function slider4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
    if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
    end
end    



function edit1_Callback(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit1 as text
%        str2double(get(hObject,'String')) returns contents of edit1 as a double
end


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
end


% --- Executes on slider movement.
function slider6_Callback(hObject, eventdata, handles)
% hObject    handle to slider6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
global phi; 
small=get(hObject,'Min');
big=get(hObject,'Max');
phi=get(hObject,'Value');
end



% --- Executes during object creation, after setting all properties.
function slider6_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
    if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
        set(hObject,'BackgroundColor',[.9 .9 .9]);
    end
end

% --- Executes on selection change in popupmenu3.
function popupmenu3_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu3 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu3
str = get(hObject, 'String'); %creates cell array filled with condents of menu
val = get(hObject,'Value'); %returns item that is currently selected
global Ai;
global fri;
global iphii;
global phii;
global Cii;
global Ci;
switch val
    case 3
        Ai=1;
    case 4
       fri=1;
    case 5
        iphii=1;
    case 6
        phii=1;
    case 7
        Cii=1;
    case 8
        Ci=1; 
end
end


% --- Executes during object creation, after setting all properties.
function popupmenu3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
    if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
        set(hObject,'BackgroundColor','white');
    end
end

% --- Executes on slider movement.
function slider7_Callback(hObject, eventdata, handles)
% hObject    handle to slider7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
global dur; 
small=get(hObject,'Min');
big=get(hObject,'Max');
dur=get(hObject,'Value');
end


% --- Executes during object creation, after setting all properties.
function slider7_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
    if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
        set(hObject,'BackgroundColor',[.9 .9 .9]);
    end
end

% --- Executes on slider movement.
function slider9_Callback(hObject, eventdata, handles)
% hObject    handle to slider9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
global A2; 
small=get(hObject,'Min');
big=get(hObject,'Max');
A32=get(hObject,'Value');
end


% --- Executes during object creation, after setting all properties.
function slider9_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
    if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
        set(hObject,'BackgroundColor',[.9 .9 .9]);
    end
end

% --- Executes on slider movement.
function slider11_Callback(hObject, eventdata, handles)
% hObject    handle to slider11 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
global phi2; 
small=get(hObject,'Min');
big=get(hObject,'Max');
phi2=get(hObject,'Value')
end


% --- Executes during object creation, after setting all properties.
function slider11_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider11 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
    if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
        set(hObject,'BackgroundColor',[.9 .9 .9]);
    end
end

% --- Executes on selection change in popupmenu4.
function popupmenu4_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu4 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu4
str = get(hObject, 'String'); %creates cell array filled with condents of menu
val = get(hObject,'Value'); %returns item that is currently selected
global Ai2;
global fri2;
global iphii2;
global phii2;
global Cii2;
global Ci2;
switch val
    case 3
        Ai2=1;
    case 4
       fri2=1;
    case 5
        iphii2=1;
    case 6
        phii2=1;
    case 7
        Cii2=1;
    case 8
        Ci2=1; 
    
end
end


% --- Executes during object creation, after setting all properties.
function popupmenu4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
    if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
        set(hObject,'BackgroundColor','white');
    end
end

% --- Executes on selection change in popupmenu5.
function popupmenu5_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu5 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu5
str = get(hObject, 'String'); %creates cell array filled with condents of menu
val = get(hObject,'Value'); %returns item that is currently selected
val
    global funcx2;
    switch str{val}
        case 'What is the first X base function?'
            funcx2=0;
        case 'A*sin(2*pi*freq*t+phi)+C'
            funcx2=1;
        case 'A*t+C'
            funcx2=2;
        case 'A*square(t)+C'
            funcx2=3;
        case 'A*squareroot(t)+C'
            funcx2=4;
    end
end




% --- Executes during object creation, after setting all properties.
function popupmenu5_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
    if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
        set(hObject,'BackgroundColor','white');
    end
end

% --- Executes on selection change in popupmenu6.
function popupmenu6_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu6 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu6
str = get(hObject, 'String'); %creates cell array filled with condents of menu
val = get(hObject,'Value'); %returns item that is currently selected
str{val}
global funcy2;
    switch str{val}

        case 'What is the first X base function?'  
           funcy2=0; 
        case 'A*sin(2*pi*freq*t+phi)+C' 
           funcy2=1;
        case 'A*t+C' 
          funcy2=2;
        case 'A*square(t)+C'
            funcy2=3;
        case 'A*squareroot(t)+C'
            funcy2=4;
    end
end


% --- Executes during object creation, after setting all properties.
function popupmenu6_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
    if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
        set(hObject,'BackgroundColor','white');
    end
end

% --- Executes on slider movement.
function slider12_Callback(hObject, eventdata, handles)
% hObject    handle to slider12 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider

global A3; 
small=get(hObject,'Min');
big=get(hObject,'Max');
A3=get(hObject,'Value')
end


% --- Executes during object creation, after setting all properties.
function slider12_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider12 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
    if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
        set(hObject,'BackgroundColor',[.9 .9 .9]);
    end
end

% --- Executes on slider movement.
function slider14_Callback(hObject, eventdata, handles)
% hObject    handle to slider14 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
    global phi3; 
    small=get(hObject,'Min');
    big=get(hObject,'Max');
    phi3=get(hObject,'Value');


end


% --- Executes during object creation, after setting all properties.
function slider14_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider14 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
    if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
        set(hObject,'BackgroundColor',[.9 .9 .9]);
    end
end

% --- Executes on selection change in popupmenu7.
function popupmenu7_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu7 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu7
str = get(hObject, 'String'); %creates cell array filled with condents of menu
val = get(hObject,'Value'); %returns item that is currently selected

global Ai3;
global fri3;
global iphii3;
global phii3;
global Cii3;
global Ci3;
switch val
    case 3
        Ai3=1;
    case 4
       fri3=1;
    case 5
        iphii3=1;
    case 6
        phii3=1;
    case 7
        Cii3=1;
    case 8
        Ci3=1;  
end
end


% --- Executes during object creation, after setting all properties.
function popupmenu7_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
    if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
        set(hObject,'BackgroundColor','white');
    end
end

% --- Executes on slider movement.
function slider15_Callback(hObject, eventdata, handles)
% hObject    handle to slider15 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
    global A4; 
    small=get(hObject,'Min');
    big=get(hObject,'Max');
    A4=get(hObject,'Value')
end


% --- Executes during object creation, after setting all properties.
function slider15_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider15 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
    if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
        set(hObject,'BackgroundColor',[.9 .9 .9]);
    end
end


% --- Executes on slider movement.
function slider17_Callback(hObject, eventdata, handles)
% hObject    handle to slider17 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
    global phi4; 
    small=get(hObject,'Min');
    big=get(hObject,'Max');
    phi4=get(hObject,'Value');

end


% --- Executes during object creation, after setting all properties.
function slider17_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider17 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
    if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
        set(hObject,'BackgroundColor',[.9 .9 .9]);
    end
end


% --- Executes on selection change in popupmenu8.
function popupmenu8_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu8 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu8
str = get(hObject, 'String'); %creates cell array filled with condents of menu
val = get(hObject,'Value'); %returns item that is currently selected
global Ai4;
global fri4;
global iphii4;
global phii4;
global Cii4;
global Ci4;
switch val
    case 3
        Ai=1;
    case 4
       fri=1;
    case 5
        iphii=1;
    case 6
        phii=1;
    case 7
        Cii=1;
    case 8
        Ci=1; 
    
end
end



% --- Executes during object creation, after setting all properties.
function popupmenu8_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
    if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
        set(hObject,'BackgroundColor','white');
    end
end

% --- Executes on selection change in popupmenu9.
function popupmenu9_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu9 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu9

str = get(hObject, 'String'); %creates cell array filled with condents of menu
val = get(hObject,'Value'); %returns item that is currently selected
global funcx3;
val
    switch str{val}

        case 'What is the first X base function?'  
           funcx3=0; 
        case 'A*sin(2*pi*freq*t+phi)+C' 
           funcx3=1;
        case 'A*t+C' 
          funcx3=2;
        case 'A*square(t)+C'
            funcx3=3;
        case 'A*squareroot(t)+C'
            funcx3=4;
    end    
end

% --- Executes during object creation, after setting all properties.
function popupmenu9_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
    if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
        set(hObject,'BackgroundColor','white');
    end
end


% --- Executes on selection change in popupmenu10.
function popupmenu10_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu10 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu10
str = get(hObject, 'String'); %creates cell array filled with condents of menu
val = get(hObject,'Value'); %returns item that is currently selected
val
global funcy3;
    switch str{val}

        case 'What is the first X base function?'  
           funcy3=0; 
        case 'A*sin(2*pi*freq*t+phi)+C' 
           funcy3=1;
        case 'A*t+C' 
          funcy3=2;
        case 'A*square(t)+C'
            funcy3=3;
        case 'A*squareroot(t)+C'
            funcy3=4;
    end
end

% --- Executes during object creation, after setting all properties.
function popupmenu10_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
    if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
        set(hObject,'BackgroundColor','white');
    end
end


% --- Executes on slider movement.
function slider18_Callback(hObject, eventdata, ~)
% hObject    handle to slider18 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
    global A5; 
    small=get(hObject,'Min');
    big=get(hObject,'Max');
    A5=get(hObject,'Value')

end

% --- Executes during object creation, after setting all properties.
function slider18_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider18 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
    if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
        set(hObject,'BackgroundColor',[.9 .9 .9]);
    end
end


% --- Executes on slider movement.
function slider20_Callback(hObject, eventdata, handles)
% hObject    handle to slider20 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
% hObject    handle to popupmenu10 (see GCBO)
    global phi5; 
    small=get(hObject,'Min');
    big=get(hObject,'Max');
    phi5=get(hObject,'Value');

end


function slider20_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider20 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
    if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
    end
end


% --- Executes on selection change in popupmenu11.
function popupmenu11_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu11 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu11 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu11
str = get(hObject, 'String'); %creates cell array filled with condents of menu
val = get(hObject,'Value'); %returns item that is currently selected
global Ai5;
global fri5;
global iphii5;
global phii5;
global Cii5;
global Ci5;
switch val
    case 3
        Ai5=1;
    case 4
       fri5=1;
    case 5
        iphii5=1;
    case 6
        phii5=1;
    case 7
        Cii5=1;
    case 8
        Ci5=1; 
    
end
end


% --- Executes during object creation, after setting all properties.
function popupmenu11_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu11 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
    if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
    end
end

% --- Executes on slider movement.
function slider21_Callback(hObject, eventdata, handles)
% hObject    handle to slider21 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
    global A6; 
    small=get(hObject,'Min');
    big=get(hObject,'Max');
    A6=get(hObject,'Value');

end



% --- Executes during object creation, after setting all properties.
function slider21_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider21 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
    if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
    end
end

% --- Executes on slider movement.
function slider23_Callback(hObject, eventdata, handles)
% hObject    handle to slider23 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
    global phi6; 
    small=get(hObject,'Min');
    big=get(hObject,'Max');
    phi6=get(hObject,'Value');

end



% --- Executes during object creation, after setting all properties.
function slider23_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider23 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
    if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
    end
end


% --- Executes on selection change in popupmenu12.
function popupmenu12_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu12 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu12 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu12
str = get(hObject, 'String'); %creates cell array filled with condents of menu
val = get(hObject,'Value'); %returns item that is currently selected
global Ai6;
global fri6;
global iphii6;
global phii6;
global Cii6;
global Ci6;
switch val
    case 3
        Ai6=1;
    case 4
       fri6=1;
    case 5
        iphii6=1;
    case 6
        phii6=1;
    case 7
        Cii6=1;
    case 8
        Ci6=1; 

end
end


% --- Executes during object creation, after setting all properties.
function popupmenu12_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu12 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
    if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
    end
end


% --- Executes on button press in pushbutton1.
    function pushbutton1_Callback(hObject, eventdata, handles)
        % hObject    handle to pushbutton1 (see GCBO)
        % eventdata  reserved - to be defined in a future version of MATLAB
        % handles    structure with handles and user data (see GUIDATA)
        %lets create the song
        global Ai6;
        global fri6;
        global iphii6;
        global phii6;
        global Cii6;
        global Ci6;
        global Ai5;
        global fri5;
        global iphii5;
        global phii5;
        global Cii5;
        global Ci5;
        global Ai4;
        global fri4;
        global iphii4;
        global phii4;
        global Cii4;
        global Ci4;
        global Ai3;
        global fri3;
        global iphii3;
        global phii3;
        global Cii3;
        global Ci3;
        global Ai2;
        global fri2;
        global iphii2;
        global phii2;
        global Cii2;
        global Ci2;
        global Ai;
        global fri;
        global iphii;
        global phii;
        global Cii;
        global Ci;
        Ai=0;
        fri=0;
        iphii=0;
        phii=0;
        Cii=0;
        Ci=0;
        Ai2=0;
        fri2=0;
        iphii2=0;
        phii2=0;
        Cii2=0;
        Ci2=0;
        Ai3=0;
        fri3=0;
        iphii3=0;
        phii3=0;
        Cii3=0;
        Ci3=0;
        Ai4=0;
        fri4=0;
        iphii4=0;
        phii4=0;
        Cii4=0;
        Ci4=0;
        Ai5=0;
        fri5=0;
        iphii5=0;
        phii5=0;
        Cii5=0;
        Ci5=0;
        Ai6=0;
        fri6=0;
        iphii6=0;
        phii6=0;
        Cii6=0;
        Ci6=0;
        global t;
        global i;
        global rep;
        global song;
        global fs;
        global A;
        global freq;
        global dur;
        global phi;
        global C;
        global funcx1;
        global funcy1;
        global funcx2;
        global funcy2;
        global funcx3;
        global funcy3;
    song = [];
    for i=1:rep
        
        switch funcx1
            case 0
                x1=A*t;
            case 1
                x1=(1+Ai*i)*A*sin(2*pi*freq*(fri*i/2+1)*t+(phii*i+1)*(phi+iphii*i))+C*(Cii*i)+Ci*i;
            case 2
                x1=(1+Ai*i)*A*cos(2*pi*freq*(fri*i/2+1)*t+(phii*i+1)*(phi+iphii*i))+C*(Ci*i)+Ci*i;
            case 3
                x1=A(1+Ai*i)*t+C(Cii*i)+Ci*i;
            case 4
                x1=A(1+Ai*i)*power(t,2)+C(Cii*i)+Ci*i;
            case 5
                x1=A(1+Ai*i)*power(t,.5)+C(Cii*i)+Ci*i;
        end
        global A2
        global freq2
        global phi2
        switch funcy1
            case 0
                y1=A2*t;
            case 1
                y1=(1+Ai2*i)*A2*sin(2*pi*freq2*(fri2*i/2+1)*t+((1+phii2*i)*phi2)+iphii2*i)+C*Cii2*i+Ci2*i;
            case 2
                y1=(1+Ai2*i)*A2*cos(2*pi*freq2*(fri2*i/2+1)*t+((1+phii2*i)*phi2)+iphii2*i)+C*Cii2*i+Ci2*i;
            case 3
                y1=(1+Ai2)*A2*t+C*Ci22+Ci2;
            case 4
                y1=(1+Ai2)*A2*power(t,2)+C*Cii2+Ci2;
            case 5
                y1=(1+Ai2)*A2*power(t,.5)+C*Cii2+Ci2;
        end
       global A3;
        global freq3;
        global phi3;
        switch funcx2
            case 0
                x2=A3*t;
            case 1
                x2=(1+Ai3*i)*A3*sin(2*pi*freq3*(fri3*i/2+1)*t+phi3*(1+phii3*i)+iphii3*i)+C*Cii3*i+Ci3*i;
            case 2
                x2=(1+Ai3*i)*A3*cos(2*pi*freq3*(fri3*i/2+1)*t+phi3*(1+phii3*i)+iphii3*i)+C*Cii3*i+Ci3*i;
            case 3
                x2=(1+Ai3*i)*A3*t+C*Cii3*i+Ci3*i;
            case 4
                x2=(1+Ai3*i)*A3*power(t,2)+C*Cii3*i+Ci3*i;
            case 5
                x2=(1+Ai3*i)*A3*power(t,.5)+C*Cii3*i+Ci3*i;
        end
        
        global A4;
        global freq4;
        global phi4;
        switch funcy2
            case 0
                y2=A4;
            case 1
                y2=(1+Ai4*i)*A4*sin(2*pi*freq4*(fri4*i/2+1)*t+phi4*(1+phii4*i)+iphii4*i)+C*Cii4*i+Ci4*i;
            case 2
                y2=(1+Ai4*i)*A4*cos(2*pi*freq4*(fri4*i/2+1)*t+phi4*(1+phii4*i)+iphii4*i)+C*Cii4*i+Ci4*i;
            case 3
                y2=(1+Ai4*i)*A4*t+C*(Cii4*i)+Ci4*i;
            case 4
                y2=(1+Ai4*i)*A4*power(t,2)+C*Cii4*i+Ci4*i;
            case 5
                y2=(1+Ai4*i)*A4*power(t,.5)+Cii4*i+Ci4*i;
        end
        
        global A5;
        global freq5;
        global phi5;
        x3=t;
        switch funcx3
            case 0
                x3=A5*t;
            case 1
                x3=(1+Ai5*i)*A5*sin(2*pi*freq5*(fri5*i/2+1)*t+phi5*(1+phii5*i)+iphii5*i)+C*Cii5*i+Ci5*i;
            case 2
                x3=(1+Ai5*i)*A5*cos(2*pi*freq5*(fri5*i/2+1)*+phi5*(1+phii5*i)+iphii5*i)+C*Cii5*i+Ci5*i;
            case 3
                x2=(1+Ai5*i)*A5*t+C*Cii5*i+Ci5*i;
            case 4
                x3=(1+Ai5*i)*A5*power(t,2)+C*Cii5*i+Ci5*i;
            case 5
                x3=(1+Ai5*i)*A5*power(t,.5)+C*Cii5*i+Ci5*i;
        end
     
        global A6;
        global freq6;
        global phi6;
        switch funcy3
            case 0
                y3=A6*t;
            case 1
                y3=(1+Ai6*i)*A6*sin(2*pi*freq6*(fri6*i/2+1)*t+phi6*(1+phii6*i)+iphii6*i)+C*Cii6*i+Ci6*i;
            case 2
                y3=(1+Ai6*i)*A6*cos(2*pi*freq6*(fri6*i/2+1)*t*phi6*(1+phi6*i)+iphii6*i)+C*Cii6*i+Ci6*i;
            case 3
                y3=(1+Ai6*i)*A6*t+C*Cii6*i+Ci6*i;
            case 4
                y3=(1+Ai6*i)*A6*power(t,2)+C*Cii6*i+Ci6*i;
            case 5
                y3=(1+Ai6*i)*A6*power(t,.5)+C*Cii6*i+Ci6*i;
        end
        size(x1)
        size(x2)
        size(x3)
        size(y1)
        size(y2)
        size(y3)
        song=[song;[x1(:),y1(:)];[x2(:),y2(:)];[x3(:),y3(:)]];
    end
        
        
        %axes(handles.averSpec); % Make averSpec the current axes.
        cla reset; % Do a complete and total reset of the axes.
        plot(0:1/fs:((length(song)-1)/fs),song)
        song = audioplayer(song,fs);
        play(song)
       
    end



function edit2_Callback(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit2 as text
%        str2double(get(hObject,'String')) returns contents of edit2 as a double
global freq; 
freq=str2double(get(hObject, 'String'));
end
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
end



function edit3_Callback(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit3 as text
%        str2double(get(hObject,'String')) returns contents of edit3 as a double
global freq2; 
freq2=str2double(get(hObject, 'String'));
end


% --- Executes during object creation, after setting all properties.
function edit3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
    if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
        set(hObject,'BackgroundColor','white');
    end
end


function edit4_Callback(hObject, eventdata, handles)
% hObject    handle to edit4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit4 as text
%        str2double(get(hObject,'String')) returns contents of edit4 as a double
global freq3; 
freq3=str2double(get(hObject, 'String'));
end

% --- Executes during object creation, after setting all properties.
function edit4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
    if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
        set(hObject,'BackgroundColor','white');
    end
end


function edit5_Callback(hObject, eventdata, handles)
% hObject    handle to edit5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit5 as text
%        str2double(get(hObject,'String')) returns contents of edit5 as a double
global freq4; 
freq4=str2double(get(hObject, 'String'));
end

% --- Executes during object creation, after setting all properties.
function edit5_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
    if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
        set(hObject,'BackgroundColor','white');
    end
end



function edit6_Callback(hObject, eventdata, handles)
% hObject    handle to edit6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit6 as text
%        str2double(get(hObject,'String')) returns contents of edit6 as a double
global freq6; 
freq6=str2double(get(hObject, 'String'));
end

% --- Executes during object creation, after setting all properties.
function edit6_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
    if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
        set(hObject,'BackgroundColor','white');
    end
end



function edit9_Callback(hObject, eventdata, handles)
% hObject    handle to edit9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit9 as text
%        str2double(get(hObject,'String')) returns contents of edit9 as a double
global rep; 
rep=str2double(get(hObject, 'String'));
end


% --- Executes during object creation, after setting all properties.
function edit9_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
    if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
        set(hObject,'BackgroundColor','white');
    end
end


function edit10_Callback(hObject, eventdata, handles)
% hObject    handle to edit10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit10 as text
%        str2double(get(hObject,'String')) returns contents of edit10 as a double
global dur; 
dur=str2double(get(hObject, 'String'));
end

% --- Executes during object creation, after setting all properties.
function edit10_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
    if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
        set(hObject,'BackgroundColor','white');
    end
end



function edit11_Callback(hObject, eventdata, handles)
% hObject    handle to edit11 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit11 as text
%        str2double(get(hObject,'String')) returns contents of edit11 as a double
global freq5; 
freq5=str2double(get(hObject, 'String'));

end
% --- Executes during object creation, after setting all properties.

function edit11_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit11 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
    if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
        set(hObject,'BackgroundColor','white');
    end
end
