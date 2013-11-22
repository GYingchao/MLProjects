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
	[n d] = size(fea);
	train = zeros(n/6, d);
	traingnd = zeros(n/6, 1);
	test = zeros(5*n/6, d);
	testgnd = zeros(5*n/6, 1);
	x = 0;
	y = 0;
	for i=1:n
		if (mod(i,6) == 1)
			x++;
			train(x,:) = fea(i,:);
			traingnd(x,1) = gnd(i, 1);
		else
			y++;
			test(y, :) = fea(i, :);
			testgnd(y,1) = gnd(i,1);
		end
	end
	fea = train;
	gnd = traingnd;
	save("-binary", "Train2.mat", "fea", "gnd");
	
	fea = test;
	gnd = testgnd;
	save("-binary", "Test2.mat", "fea", "gnd");
	ret = x;
endfunction
