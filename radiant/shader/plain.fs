
precision mediump float;

uniform sampler2D uTexture;
uniform vec2 uTextureMaxUV;

varying vec2 vTextureCoord;
varying vec4 vColor;

void main(void) {

/*
    // debug: colorize background

    gl_FragColor = texture2D(
                        uTexture,
                        vec2(   // wrap texture at max used u/v
                            fract(vTextureCoord.x / uTextureMaxUV.x) * uTextureMaxUV.x,
                            fract(vTextureCoord.y / uTextureMaxUV.y) * uTextureMaxUV.y
                         )
                    ) * vColor + (vColor / 3.0);
*/

    gl_FragColor = texture2D(
                        uTexture,
                        vec2(   // wrap texture at max used u/v
                            fract(vTextureCoord.x / uTextureMaxUV.x) * uTextureMaxUV.x,
                            fract(vTextureCoord.y / uTextureMaxUV.y) * uTextureMaxUV.y
                         )
                    ) * vColor;
}
