% ## Copyright (C) 2013 ycuiac
% ## 
% ## This program is free software; you can redistribute it and/or modify
% ## it under the terms of the GNU General Public License as published by
% ## the Free Software Foundation; either version 3 of the License, or
% ## (at your option) any later version.
% ## 
% ## This program is distributed in the hope that it will be useful,
% ## but WITHOUT ANY WARRANTY; without even the implied warranty of
% ## MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
% ## GNU General Public License for more details.
% ## 
% ## You should have received a copy of the GNU General Public License
% ## along with Octave; see the file COPYING.  If not, see
% ## <http://www.gnu.org/licenses/>.

% ## visPCA To vusualize the difference between the original data and after PCA performed

% ## Author: ycuiac <ycuiac@CSZ900>
% ## Created: 2013-10-13

% % This script is not a function, just a code snippet for testing PCA result

% Get the original data
load('Test1');
clear gnd;
idx = randperm(4000);
fea = fea(idx(1:100),:);

% Get the data after performing PCA
load('PCA_25');

faceW = 28;
faceH = 28;
numPerLine = 20;
ShowLine = 4;

faceW1 = 5;
faceH1 = 5;

Y = zeros(faceH*ShowLine,faceW*numPerLine);
Y1 = zeros(faceH*ShowLine,faceW*numPerLine);
for i=0:ShowLine-1
   for j=0:numPerLine-1
     Y(i*faceH+1:(i+1)*faceH,j*faceW+1:(j+1)*faceW) = reshape(fea(i*numPerLine+j+1,:),[faceH,faceW])';
	 Y1(i*faceH1+1:(i+1)*faceH1,j*faceW1+1:(j+1)*faceW1) = reshape(ret(i*numPerLine+j+1,:),[faceH1,faceW1])';
   end
end
%imagesc(Y);colormap(gray);
subplot(2, 1, 1);
imshow(Y);
subplot(2, 1, 2);
imshow(Y1);




