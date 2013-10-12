## Copyright (C) 2013 ycuiac
## 
## This program is free software; you can redistribute it and/or modify
## it under the terms of the GNU General Public License as published by
## the Free Software Foundation; either version 3 of the License, or
## (at your option) any later version.
## 
## This program is distributed in the hope that it will be useful,
## but WITHOUT ANY WARRANTY; without even the implied warranty of
## MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
## GNU General Public License for more details.
## 
## You should have received a copy of the GNU General Public License
## along with Octave; see the file COPYING.  If not, see
## <http://www.gnu.org/licenses/>.

## preprocess

## Author: ycuiac <ycuiac@CSZ900>
## Created: 2013-10-12

function [ ret ] = preprocess (file)
	load(file);
	[m n] = size(fea);
	%temp = zeros(1);
	% for i=1:m
		% gnd(i, 1) = uint8(gnd(i, 1));
		% for j=1:n
			% fea(i, j) = uint8(fea(i, j));
		% end
	% end
	
endfunction
