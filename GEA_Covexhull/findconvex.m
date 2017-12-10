function findconvex( slides_hue, count)

% slides_hue_real = find( slides_hue ~= 0 );
% slides_hue_real = slides_hue(slides_hue ~= 0);
disp('jkhjkkjbkj');
% disp(slides_hue(slides_hue>0));
% slides_hue(slides_hue==0)= NaN;
% 
% disp(size(slides_hue));
row= size(slides_hue, 1);
col= size(slides_hue, 2);
% disp('the 3rd:');
% disp(slides_hue(:,:,3))

% disp(slides_hue_real);
% a= sum(nonzeros(slides_hue));
% disp(a);
% disp(sum(nonzeros(lch_sRGB)));
% disp(size(slides_hue_real));
count_t = count;
n= 1;
slides_hue_real= zeros(count_t+2, 1, 3);
slides_hue_real_c = zeros(count_t+2, 1, 3);
alpha = 60;
D = 80;
gamma = 0.6;
Lmax = 0;
Cmax = 0; 
Lmin = 100;
Cmin = 0;
for i= 1:row
    for j= 1:col
        if slides_hue(i, j, 3)>0
            %disp('zhendema');
            if Lmax <slides_hue(i, j , 1)
                Lmax = slides_hue(i, j, 1);
            end
            if Lmin >slides_hue(i, j, 1)
                Lmin = slides_hue(i, j, 1); 
            end
            slides_hue_real(n, 1, 1) = slides_hue(i, j, 1);
            slides_hue_real_c(n, 1, 1) = alpha*(slides_hue(i, j, 1)/D)^gamma;
            slides_hue_real(n, 1, 2) = slides_hue(i, j, 2);
            slides_hue_real_c(n, 1, 2) = alpha*(slides_hue(i, j, 2)/D)^gamma;
            slides_hue_real(n, 1, 3) = slides_hue(i, j, 3);
            slides_hue_real_c(n, 1, 3) = slides_hue(i, j, 3);
            n= n+1;
        end 
    end
end
slides_hue_real(n, 1, 1) = Lmax;
slides_hue_real(n, 1, 2) = 0;
slides_hue_real(n+1, 1, 1) = Lmin;
slides_hue_real(n+1, 1, 2) = 0;
slides_hue_real_c(n, 1, 1) = alpha*(Lmax/D)^gamma;
slides_hue_real_c(n, 1, 2) = 0;
slides_hue_real_c(n+1, 1, 1) = alpha*(Lmin/D)^gamma;
slides_hue_real_c(n+1, 1, 2) = 0;
disp('tttt');
disp(slides_hue_real);
%the L AND C is corrected
L = slides_hue_real_c(:,:,1);
C = slides_hue_real_c(:,:,2);
%the L1 and C1 is original
L1 = slides_hue_real(:,:,1);
C1 = slides_hue_real(:,:,2);
k = convhull(L, C); 
k1 = convhull(L1, C1);
k_points = k_mapping_points(slides_hue_real, k1);
disp('k');
disp(k1);
disp('k_points are:');
disp(k_points);
%the num of real value without k
k_without = size(slides_hue_real, 1)- size(k, 1);
Points1 = zeros(1, 1, 2);
Points2 =  zeros(1, 1, 2);
Points2(1, 1, 1) = (Lmax - Lmin)/2;
Points2(1, 1, 2) = 0;
figure(2);
hold on
plot(L1(k),C1(k),'r-',L1, C1,'b*');

for i = 1:k_without
    Points1(1, 1, 1) = slides_hue_real(i, 1, 1);
    Points1(1, 1, 2) = slides_hue_real(i, 1, 2);
    disp('Points1 :');
    disp(Points1);
    disp('Points2 :');
    disp(Points2);
    Intersection_P  = Caculate_Intesection( Points1, Points2, k_points );
    disp('Intersection is :');
    disp(Intersection_P);
end
% disp('k:');
% disp(k);
%the corrected convex hull
% figure(1);
% hold on
% plot(L(k),C(k),'r-',L, C,'b*');
%the final convex hull
figure(2);
hold on
plot(L1(k),C1(k),'r-',L1, C1,'b*');
% disp('wan le');
% %the original convex hull
% figure(3);
% hold on
% plot(L1(k1),C1(k1),'r-',L1, C1,'b*');








end

