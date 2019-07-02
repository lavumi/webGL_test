attribute vec4 aVertexPosition;
attribute vec4 aVertexNormal;


uniform vec3 uAmbient;
uniform vec3 uDiffuse;
uniform vec3 uSpecular;


uniform mat4 uWorldMatrix;
uniform mat4 uViewMatrix;
uniform mat4 uProjectionMatrix;

uniform vec3 uDirectionalLight;

varying lowp vec4 vNormal;


void main() {
    gl_Position = uProjectionMatrix * uViewMatrix * uWorldMatrix *  aVertexPosition;

    vec4 worldNormal = uWorldMatrix * aVertexNormal;

    vec4 ambient = vec4(uAmbient,1);

    vec3 nLight = normalize(uDirectionalLight);
    worldNormal = normalize(worldNormal);
    float light = nLight.x  * worldNormal.x + nLight.y * worldNormal.y + nLight.z * worldNormal.z;

    vNormal =  vec4(uAmbient+  light * 0.5,1);
}


