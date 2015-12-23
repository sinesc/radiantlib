
precision mediump float;

uniform sampler2D uTexture;

varying vec2 vTextureCoord;
varying vec4 vColor;

void main(void) {

    //gl_FragColor = vec4(1.0, 0.0, 0.0, 1.0);
    gl_FragColor = texture2D(uTexture, vTextureCoord) * vColor;
}
