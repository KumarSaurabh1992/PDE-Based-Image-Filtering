close all;
clear all;

a = imread( 'triangle.jpg' ); 

a = a(:,:,1);
    a = im2double(a); 
    ad=imnoise(a,'gaussia',0.01);
    b = eed( ad, .12, 25); 
    figure; 
    imshow(b,[]); 