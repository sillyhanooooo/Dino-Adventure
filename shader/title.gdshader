shader_type canvas_item;

uniform float pulse_speed : hint_range(0.1, 10.0) = 2.0;
uniform float pulse_amount : hint_range(0.0, 0.5) = 0.1;

void vertex() {
	vec2 center = 1.0 / TEXTURE_PIXEL_SIZE * 0.1;
	float wave = sin(TIME * pulse_speed);
	float scale_factor = 1.0 + (wave * pulse_amount);
	VERTEX = (VERTEX - center) * scale_factor + center;
}

void fragment() {
	// Called for every pixel the material is visible on.
}

//void light() {
//	// Called for every pixel for every light affecting the CanvasItem.
//	// Uncomment to replace the default light processing function with this one.
//}
