shader_type spatial;

uniform sampler2D albedo;
uniform sampler2D normal;
uniform bool normalEnabled;

void fragment() {
	ALBEDO = texture(albedo, UV).rgb;
	if(normalEnabled) {
		NORMAL_MAP = texture(normal, UV).rgb;
	}
}

uniform sampler2D heightmap;
uniform float height_ratio = 1.0;

void vertex() {
	vec3 vertex = VERTEX;
	float y = vertex.y / 600.0;
	float x = vertex.x / 600.0;
	float z = vertex.z / 600.0;
	
	VERTEX.y += texture(heightmap, UV).r * height_ratio * y;
	VERTEX.x += texture(heightmap, UV).r * height_ratio * x;
	VERTEX.z += texture(heightmap, UV).r * height_ratio * z;
}