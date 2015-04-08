
precision mediump float;

uniform sampler2D uTexture;
uniform sampler2D uRamp;

varying vec2 vTextureCoord;
varying vec4 vColor;

void main() {

    //gl_FragColor = vec4(1., 0., 0., 1.);
    gl_FragColor = texture2D(uTexture, vTextureCoord);// * vColor;
}
