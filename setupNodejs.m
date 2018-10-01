function setupNodejs
% SETUPNODEJS Downloads (if needed) and adds Node.js to PATH
%
% This lets you call Node.js programs from within MATLAB using SYSTEM.
%
% Example:
%
%   >> setupNodejs
%   v8.12.0
%   Node.js added to system path.
% 
% For more examples, see "examples" folder.

evalc 'nodeStatus = system(''node -v'')';
if (nodeStatus == 0)
  disp('Node.js is available. Nothing to do.');
  !node -v
  return;
end
if ismac()
  nodeFlavor = 'node-v8.12.0-darwin-x64';
elseif isunix()
  nodeFlavor = 'node-v8.12.0-linux-x64';
else
  disp('Currently, only supported for Mac/Linux');
  return;
end
downloadURL = ['https://nodejs.org/dist/v8.12.0/' nodeFlavor '.tar.xz'];
workingdir = fullfile(prefdir, 'mnode');
if ~exist(workingdir, 'dir')
  mkdir(workingdir);
end
oldPwd = pwd;
pwdRestorer = onCleanup(@() cd(oldPwd));
cd(workingdir);
bindir = fullfile(workingdir, 'node-v8.12.0-darwin-x64', 'bin');
nodebin = fullfile(bindir, 'node');
if ~exist(nodebin, 'file')
  system(['curl -s "' downloadURL '" | tar xz']);
end
setenv('PATH', [ getenv('PATH') ':' bindir ]);
!node -v
disp('Node.js added to system path.');
end