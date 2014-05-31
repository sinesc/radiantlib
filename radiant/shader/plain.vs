
uniform mat4 uMatrix;

attribute vec2 aPosition;
attribute vec2 aVertexOffset;
attribute vec2 aTextureCoord;
attribute vec4 aColor;
attribute float aRotation;

varying vec2 vTextureCoord;
varying vec4 vColor;

void main(void) {

    vTextureCoord = aTextureCoord;
    vColor = aColor;

    vec2 offset;
    offset.x = aVertexOffset.x * cos(aRotation) - aVertexOffset.y * sin(aRotation);
    offset.y = aVertexOffset.x * sin(aRotation) + aVertexOffset.y * cos(aRotation);

    gl_Position = uMatrix * vec4(aPosition + offset, 0.0, 1.0);
}