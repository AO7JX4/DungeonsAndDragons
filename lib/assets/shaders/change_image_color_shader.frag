#version 460 core

#include <flutter/runtime_effect.glsl>

out vec4 fragColor;
uniform vec2 uSize;
uniform sampler2D image;
uniform vec3 modColor; // This is the color that will be applied

void main() {

    // Convert image to texture coordinates
    vec2 iResolution = uSize;
    vec2 fragCoord = FlutterFragCoord();
    vec2 uv = fragCoord / iResolution.xy;
    vec4 col = texture(image, uv);

    // Define a small tolerance for black color detection
    float epsilon = 0.01;

    // If the pixel is not black, recolor it
    if (length(col.rgb) > epsilon) {
        vec4 white = vec4(1.0, 1.0, 1.0, 1.0);  // White color
        fragColor = vec4(white.rgb * modColor, col.a);  // Recolor it with the modColor
    }
    else {
        fragColor = col;  // Leave black pixels unchanged
    }
}
