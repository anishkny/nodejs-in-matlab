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
    !which node
    !node -v
    return;
  end
  if ispc()
    downloadForPC();
  else
    downloadForPOSIX();
  end
  !node -v
  disp('Node.js added to system path.');
end

function bindir = downloadForPC()
  nodeFlavor = 'node-v8.12.0-win-x64';
  downloadURL = ['https://nodejs.org/dist/v8.12.0/' nodeFlavor '.zip'];
  zipfile = fullfile(prefdir, [nodeFlavor '.zip']);
  websave(zipfile, downloadURL);
  workingdir = fullfile(prefdir, 'node');
  if ~exist(workingdir, 'dir')
    mkdir(workingdir);
  end
  unzip(zipfile, workingdir);
  bindir = fullfile(workingdir, nodeFlavor);
  setenv('PATH', [ getenv('PATH') ';' bindir ]);
end

function bindir = downloadForPOSIX()
  if ismac()
    nodeFlavor = 'node-v8.12.0-darwin-x64';
  elseif isunix()
    nodeFlavor = 'node-v8.12.0-linux-x64';
  else
    disp('Unknown POSIX OS.');
    return;
  end
  downloadURL = ['https://nodejs.org/dist/v8.12.0/' nodeFlavor '.tar.xz'];
  workingdir = fullfile(prefdir, 'node');
  if ~exist(workingdir, 'dir')
    mkdir(workingdir);
  end
  oldPwd = pwd;
  pwdRestorer = onCleanup(@() cd(oldPwd));
  cd(workingdir);
  bindir = fullfile(workingdir, nodeFlavor, 'bin');
  nodebin = fullfile(bindir, 'node');
  if ~exist(nodebin, 'file')
    system(['curl -s "' downloadURL '" | tar xz']);
  end
  setenv('PATH', [ getenv('PATH') ':' bindir ]);
end
