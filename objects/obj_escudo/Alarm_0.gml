/// @description Insert description here
// You can write your code in this editor

image_index --;
image_alpha -= 0.2;

if (image_index < 0) instance_destroy();

alarm[0] = room_speed *2;

