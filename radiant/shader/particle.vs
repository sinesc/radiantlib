
uniform mat4 uMatrix;
uniform vec2 uScreenOffset;
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
varying vec2 vRampCoord;
varying vec4 vColor;

void main() {

    float elapsed = uNow - aStartTime;
    float progress = elapsed / aTimeToLive;

    // pass to fragment shader

    vTextureCoord.x = aCorner.x + 0.5;
    vTextureCoord.y = aCorner.y + 0.5;
    vColor = aColor;
    vRampCoord = vec2(progress, 0.5);

    // compute vertex position/rotation

    float size = mix(aStartSize, aEndSize, progress);
    size = (progress < 0.0 || progress > 1.0) ? 0.0 : size;

    vec2 sizedCorner;
    float sinRotation = sin(aRotation);
    float cosRotation = cos(aRotation);
    sizedCorner.x = (aCorner.x * cosRotation - aCorner.y * sinRotation) * size;
    sizedCorner.y = (aCorner.x * sinRotation + aCorner.y * cosRotation) * size;

    // motion offset

    float travelledDistance = (aVelocity * elapsed) + (0.5 * aAcceleration * pow(elapsed, 2.0));
    vec2 offsetOrigin;
    offsetOrigin.x = aOrigin.x + cos(aAngle) * travelledDistance;
    offsetOrigin.y = aOrigin.y + sin(aAngle) * travelledDistance;

    gl_Position = uMatrix * vec4(offsetOrigin + sizedCorner + uScreenOffset, 0.0, 1.0);
}
