myFolder = '/Users/waynsday/Documents/MATLAB/LBYMF4D'; %main directory
if ~isfolder(myFolder)
    errorMessage = sprintf('Error: The following folder does not exist:\n%s\nPlease specify a new folder.', myFolder);
    uiwait(warndlg(errorMessage));
    myFolder = uigetdir(); % Ask for a new one.
    if myFolder == 0
         % User clicked Cancel
         return;
    end
end

S = dir(fullfile(myFolder, '*')); 
N = setdiff({S([S.isdir]).name},{'.','..'}); %subfolders, refer to zip file put into main directory
N = natsortfiles(N); % need to install natural sorting by stephen23 in matlab
for ii = 1:numel(N)
    T = dir(fullfile(myFolder,N{ii},'*.jpg'));
    C = {T(~[T.isdir]).name};
    C = natsortfiles(C);
    for jj = 1:numel(C)
        F = fullfile(myFolder,N{ii}, C{jj});
        I = imread(F);
        [msg, format] = readBarcode(I, '1D');
        disp(msg + ',' + N{ii});
        %... just need to add to table and save file na
    end
end