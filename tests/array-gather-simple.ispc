
export uniform int width() { return programCount; }

struct Foo { float f; };

export void f_fu(uniform float RET[], uniform float aFOO[], uniform float b) {
    float a = aFOO[programIndex];
    float foo[5] = { 0, a, 0, 2 * a, 3 };
    uniform int offset[4] = { 1,2,3,4 };
    int x = offset[programIndex & 0x3];
    RET[programIndex] = foo[x];
}

export void result(uniform float RET[]) { 
    for (uniform int i = 0; i < programCount; i += 4) {
        RET[i] = i+1;
        RET[i+1] = 0;
        RET[i+2] = 2 * (i+3);
        RET[i+3] = 3;
    }
}
