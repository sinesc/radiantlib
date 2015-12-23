
precision mediump float;

uniform sampler2D uTexture;
uniform sampler2D uRamp;

varying vec2 vTextureCoord;
varying vec2 vRampCoord;
varying vec4 vColor;

void main() {

    //gl_FragColor = vec4(1.0, 0.0, 0.0, 1.0);
    gl_FragColor = texture2D(uTexture, vTextureCoord) * texture2D(uRamp, vRampCoord) * vColor;
}
