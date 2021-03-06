clc

%load image and conver to double
src_sRGB = im2double(imread('flower_sRGB.jpg'));
disp(max(max(src_sRGB)));
src_adobe = im2double(imread('flower_adobe.jpg'));
disp(max(max(src_adobe)));
cform = makecform('lab2lch');
lab_sRGB = RGB2Lab(src_sRGB);
lab_adobe = RGB2Lab(src_adobe);
%applycform(src_sRGB, cform);

lab_sRGB_vec = reshape(lab_sRGB, [], 3);
lch_sRGB = applycform(lab_sRGB, cform);
lch_adobe = applycform(lab_adobe, cform);
disp(size(lch_sRGB));
%disp(lch_sRGB(:,:,3));
disp(sum(nonzeros(lch_sRGB)));

[slides_hue,count] = Slides_Hue(lch_sRGB, 120);
[slides_hue_a, count_a] = Slides_Hue(lch_adobe, 120);
disp(slides_hue(slides_hue>0))
disp('count:');
disp(count);

disp(size(slides_hue));
if count>10
findconvex(slides_hue, count);
end
% if count_a>10
% findconvex(slides_hue_a, count_a);
% end