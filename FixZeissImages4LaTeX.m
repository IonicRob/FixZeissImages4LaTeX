%% FixZeissImages4LaTeX
% by R J Scales (copyright)
% robert.scales@materials.ox.ac.uk
% written 26/06/2023
%
% In LaTeX there are issues with Zeiss images, one, that it doesn't
% like tifs, and two, that the dpi is saved as 1.
% This code will load in the tif images in the photo and save them as
% png's and pdf's but now with a specified dpi.

clear; close all; clc;
fprintf('%s: Started...', mfilename);
path = uigetdir(pwd, 'Select the folder for which you want to convert the images:');

out = string({dir(fullfile(path, '*.tif')).name});
[~,names,~] = fileparts(out);

for imNum = 1:length(out)
    Image = imread(fullfile(path, out(imNum)));
    imshow(Image);
    exportgraphics(gcf().CurrentAxes, fullfile(path, sprintf('png %s.png', names(imNum))), "Resolution", 300);
%     print(fullfile(path, sprintf('png %s.png', names(imNum))),'-dpng','-r300')
%     imwrite(Image, fullfile(path, sprintf('png300 %s.png', names(imNum))), 'XResolution', 300, 'YResolution', 300)
end

close all
fprintf('%s: Finished...', mfilename);