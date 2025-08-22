varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform float size;
uniform vec2 texel;
uniform vec3 strokeColor;  // 自定义描边颜色

void main()
{
    vec4 base_col = texture2D( gm_BaseTexture, v_vTexcoord );
    
    // 当前像素不透明时直接输出原色
    if (base_col.a > 0.0) {
        gl_FragColor = v_vColour * base_col;
        return;
    }
    
    float n = ceil(size);
    float squared_radius = size * size;  // 优化：避免循环内重复计算
    
    for (float i = -n; i <= n; i++) {
        for (float j = -n; j <= n; j++) {
            // 使用平方距离比较避免开方运算
            if ((i*i + j*j) > squared_radius) {
                continue;
            }
            
            vec4 col = texture2D( gm_BaseTexture, v_vTexcoord + vec2(i*texel.x, j*texel.y));
            if (col.a > 0.0) {
                // 使用自定义描边颜色，保留原始alpha处理
                gl_FragColor = v_vColour * vec4(strokeColor, 1.0);
                return;
            }
        }
    }
    
    gl_FragColor = vec4(0.0);  // 完全透明
}