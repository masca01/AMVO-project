function print_field2( u,label,format )
% print_field( u,label ) prints a field with the notation described in
% slide 18
% u: field to print
% label: string with a description
% format: fprintf format
% Written by: Manel Soria 2018
% Example of use: print_field(up,'predictor vel. u','%+.3e ');
 N=size(u,1)-2; % mesh size
 fprintf('field %s \n',label);
 for j=N+2:-1:1
 fprintf('j=%2d ',j);
 for i=1:N+2
 fprintf(format ,u(i,j));
 end
 fprintf('\n');
 end
end