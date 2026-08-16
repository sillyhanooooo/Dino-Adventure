shader_type canvas_item;

uniform float bpm : hint_range(30.0, 200.0) = 72.0;
uniform float pulse_strength : hint_range(0.0, 1.0) = 0.15;

float heartbeat(float t) {
	float b1 = exp(-pow(mod(t, 1.0) * 10.0 - 1.0, 2.0) * 20.0);
	float b2 = exp(-pow(mod(t, 1.0) * 10.0 - 2.2, 2.0) * 20.0) * 0.6;
	return b1 + b2;
}

void vertex() {
	float t = TIME * (bpm / 120.0);
	float beat = heartbeat(t);
	VERTEX *= 1.0 + beat * pulse_strength;
}

void fragment() {
	
}

//void light() {
//	// Called for every pixel for every light affecting the CanvasItem.
//	// Uncomment to replace the default light processing function with this one.
//}
