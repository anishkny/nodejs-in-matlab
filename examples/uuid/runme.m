!npm install
[~, rawresult] = system('node index.js');
result = jsondecode(rawresult);
result %#ok<NOPTS>