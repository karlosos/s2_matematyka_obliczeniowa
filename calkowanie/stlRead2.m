function [fout, vout, cout] = stlRead(filename)
fid = fopen(filename, 'r');
if fid == -1
    error('File could not be opened, check name or path.')
end

nazwa_pliku = sscanf(fgetl(fid), '%*s %s'); %CAD object name, if needed.
vnum=0;
report_num=0;
VColor=0;

while feof(fid) == 0
    tline = fgetl(fid);
    fword = sscanf(tline, '%s ')
    if strncmpi(fword, 'c', 1) == 1;
        VColor = sscanf(tline, '%*s %f %f %f');
    end
    if strncmpi(fword, 'v', 1) == 1;
        vnum = vnum +1;
        report_num = report_num + 1;
        if report_num > 249
            disp(sprintf('wierzcholek numer: %d', vnum));
        end
        v(:,vnum) = sscanf(tline, '%*s %f %f %f');
        c(:,vnum) = VColor;
    end
end
fnum = vnum/3;
flist = 1:vnum;
F = reshape(flist, 3, fnum);
fout = F';
vout = v';
cout = c';
fclose(fid)
    