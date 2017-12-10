function [ slides_hue, count] = Slides_Hue( lch_image, hue_value )

row = size(lch_image, 1);
col = size(lch_image, 2);
slides_hue = zeros(size(lch_image));
count = 0;

for i= 1:row
    for j= 1:col
        if lch_image(i, j, 3)>= hue_value &&lch_image(i, j, 3)<hue_value+1
            slides_hue(i, j, 1) = lch_image(i, j, 1);
            slides_hue(i, j, 2) = lch_image(i, j, 2);
            slides_hue(i, j, 3) = lch_image(i, j ,3);
            count= count+1;
        end
    end
end
end

