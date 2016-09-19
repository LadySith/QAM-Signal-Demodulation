Fs = 1000;          % Sampling frequency
T = 1/Fs;           % Sampling period
L = 8;              % Length of signal
t = (0:L-1)*T;      % Time vector

sym = 1000;         % Symbol rate
sam = 8000;         % Sampling rate
mH = 4;             % Maximum harmonic
H = 1;              % Current harmonic

a = [0.9998 0.5361 -1.7580 -0.8779 -0.9998 -0.5361 1.7580 0.8779];
%a = [0.0000 -0.8420 -1.1908 -0.8420 0.0000 0.8420 1.1908 0.8420];
arr = zeros(1,7);
arr2 = zeros(1,7);
suma = 0;
sumb = 0;

for i = 1:L
    arr(i) = a(i)*cos(2*pi*H*Fs*t(i));
    if i == 1
        suma = suma + 0.5*(arr(i))*(T/L);
    else
        suma = suma + 0.5*(arr(i) + arr(i-1))*(T/L);
    end
end

for i = 1:L
    arr2(i) = a(i)*sin(2*pi*H*Fs*t(i));
    if i == 1
        sumb = sumb + 0.5*(arr2(i))*(T/L);
    else
        sumb = sumb + 0.5*(arr2(i) + arr2(i-1))*(T/L);
    end
end

suma = suma*(2/T);
sumb = sumb*(2/T);

r = sqrt(suma^2 + sumb^2);
phi = (atan2(suma,sumb))*180/pi;

disp(r);
disp(phi);

%http://www.facstaff.bucknell.edu/mastascu/elessonshtml/freq/freq4.html

%ts = linspace(1,8,800)';
%y = sinc(ts(:,ones(size(t))) - t(:,ones(size(ts)))')*a;

%plot (t,a,'o',ts,y);