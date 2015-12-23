
uniform mat4 uMatrix;
uniform vec2 uScreenOffset;

attribute vec2 aPosition;
attribute vec2 aVertexOffset;
attribute vec2 aTextureCoord;
attribute vec4 aColor;
attribute float aRotation;

varying vec2 vTextureCoord;
varying vec4 vColor;

void main() {

    // pass texture/tint to fragment shader

    vTextureCoord = aTextureCoord;
    vColor = aColor;

    // compute vertex position

    vec2 offset;
    float sinRotation = sin(aRotation);
    float cosRotation = cos(aRotation);

    offset.x = aVertexOffset.x * cosRotation - aVertexOffset.y * sinRotation;
    offset.y = aVertexOffset.x * sinRotation + aVertexOffset.y * cosRotation;

    gl_Position = uMatrix * vec4(aPosition + offset + uScreenOffset, 0.0, 1.0);
}
