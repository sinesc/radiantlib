
uniform mat4 uMatrix;
uniform float uNow;

attribute float aStartTime;
attribute float aTimeToLive;
attribute float aStartSize;
attribute float aEndSize;
attribute vec2 aOrigin;
attribute vec2 aCorner;
attribute float aVelocity;
attribute float aAcceleration;
attribute float aAngle;
attribute float aRotation;
attribute vec4 aColor;

varying vec2 vTextureCoord;
varying vec4 vColor;

void main() {
float dummy = aStartTime * aRotation * aAcceleration;

    // pass to fragment shader

    vTextureCoord.x = aCorner.x + 0.5;
    vTextureCoord.y = aCorner.y + 0.5;
    vColor = aColor;

    // compute vertex position

    float progress = (uNow - aStartTime) / aTimeToLive;

    float size = mix(aStartSize, aEndSize, progress);
    size = (progress < 0.0 || progress > 1.0) ? 0.0 : size;

    vec2 sizedCorner;
    sizedCorner.x = aCorner.x * size;
    sizedCorner.y = aCorner.y * size;

    vec2 offsetOrigin;
    offsetOrigin.x = aOrigin.x + cos(aAngle) * aVelocity * progress;
    offsetOrigin.y = aOrigin.y + sin(aAngle) * aVelocity * progress;

    gl_Position = uMatrix * vec4(offsetOrigin + sizedCorner, 0.0, 1.0);
}
