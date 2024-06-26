% naive approach stores signal in a numeric variable and keeps track of the
% time information separately.
% harp = readmatrix("harp.csv");
% plot(harp);

% using timetable
tbl = readtimetable("harp.csv", "SampleRate", 50);
figure;
plot(tbl, "Var1");
title("HARP CSV Time Table")
grid on;

% harpFilePath = '.\data_files\HARP_BHZ_2004_361_01-10-00.SAC'
% if exist(sacFilePath, 'file') == 2
%     % Read the SAC file using rdsac
%     harp = rdsac(sacFilePath);
%     disp('SAC file has been read successfully.');
% else
%     error('SAC file does not exist: %s', sacFilePath);
% end

%%%%%%%%%%%%
%%%%%%%%%%%%
% % Define the subfolder and file
% subfolderPath = './data_files/';
% fileName = 'HARP_BHZ_2004_361_01-10-00.SAC';
% fullPath = fullfile(subfolderPath, fileName);
% 
% % Check if the subfolder exists
% if ~exist(subfolderPath, 'dir')
%     error('Subfolder does not exist: %s', subfolderPath);
% end
% 
% % Check if the file exists
% if ~exist(fullPath, 'file')
%     error('File does not exist: %s', fullPath);
% end
% 
% % Load the data
% [data, t0, header] = rdsac(fullPath);
% disp('Data loaded successfully');

% Path to your SAC file
filePathHarp = './data_files/HARP_BHZ_2004_361_01-10-00.SAC';
filePathPax = './data_files/PAX_BHZ_2004_361_01-10-00.SAC';
filePathWanc = './data_files/WANC_SHZ_2004_361_01-10-00.SAC';

% Reading the SAC file
[dataHarp, time0Harp, headerHarp] = rdsac(filePathHarp);
[dataPax, time0Pax, headerPax] = rdsac(filePathPax);
[dataWanc, time0Wanc, headerWanc] = rdsac(filePathWanc);


%plotting directly when calling functon
figure;
rdsac(filePathHarp, 'plot');
xlabel('Time (s)');
ylabel('Amplitude');
title('HARP Seismic Data Plot');