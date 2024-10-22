#version 460 core

#include <flutter/runtime_effect.glsl>

out vec4 fragColor;
uniform vec2 uSize;
uniform sampler2D image;
uniform vec3 modColor;

void main() {

    vec4 white = vec4(1.0, 1.0, 1.0, 1.0);
    float tolerance = 0.01;

    // Convert image to texture
    vec2 iResolution = uSize;
    vec2 fragCoord = FlutterFragCoord();
    vec2 uv = fragCoord / iResolution.xy;
    vec4 col = texture(image, uv);




   //Change color if pixel is not black, otherwise stay black
    if (length(col.rgb) > tolerance)
        fragColor = vec4(white.rgb * modColor, col.a);
    else
        fragColor = col;

}
