


dirpath='string to path';
dlist = dir(dirpath);
for di = 3:length(dlist)
    if dlist(di).isdir
        continue
    end
    [~,nm,ext] = fileparts(dlist(di).name);
    if ~strcmp(ext,'.txt')
        continue
    end
    filepath = fullfile(dirpath,dlist(di).name);
    fid = fopen(filepath,'r');
    %txt = textscan(fid,'\t');
    txt = char(fread(fid));
    fclose(fid);
    
    newlinepositions = find(double(txt)==10);
    
    lin = '3.0:  101  105   606'
    colonpos = find(lin==':');
    linaftercolon = lin(colonpos(end)+1:end);
    lin(double(lin)==9) = ' ';
     
end