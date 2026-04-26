var cam = view_camera[0];

var cam_x = camera_get_view_x(cam);
var cam_y = camera_get_view_y(cam);

camera_set_view_pos(cam, round(cam_x), round(cam_y));