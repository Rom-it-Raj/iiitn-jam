// Change to 'canvas_item' if you are working in 2D
shader_type spatial; 

// Creates a slot in the Inspector to drop your .tres texture
uniform sampler2D albedo_texture : source_color, filter_linear_mipmap;
uniform sampler2D normal_texture : hint_normal;
uniform sampler2D roughness_texture;

void fragment() {
    // 1. Read the albedo (color) texture .tres
    vec4 albedo_tex = texture(albedo_texture, UV);
    ALBEDO = albedo_tex.rgb;
    ALPHA = albedo_tex.a; 
    
    // 2. Read and apply the normal map .tres
    NORMAL_MAP = texture(normal_texture, UV).rgb;
    
    // 3. Read and apply the roughness .tres
    float roughness_tex = texture(roughness_texture, UV).r;
    ROUGHNESS = roughness_tex;
}