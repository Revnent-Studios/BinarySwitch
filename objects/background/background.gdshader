shader_type canvas_item;

void vertex() {
	UV.x += TIME * 0.02;
	UV.y += TIME * 0.02;
	 
}

//void light() {
	// Called for every pixel for every light affecting the CanvasItem.
	// Uncomment to replace the default light processing function with this one.
//}
