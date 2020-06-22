Shader "Holistic/BasicLambert"
{
    Properties
    {
        _Color("Color", Color) = (1,1,1,1)
        _SpecColor("Spec Color", Color) = (1,1,1,1) //_SpecColor can be used straight away unlike any others
        _Spec("Specular", Range(0,1)) = 0.5
        _Gloss("Gloss", Range(0,1)) = 0.5
    }

    SubShader
    {

        Tags
        {
            "Queue" = "Geometry"
        }

        CGPROGRAM
        #pragma surface surf Lambert //Lambert Lighting doesn't have specualr highlight

        float4 _Color;
        half _Spec;
        fixed _Gloss;


        struct Input
        {
            float2 uv_MyTexture;
        };


        void surf (Input IN, inout SurfaceOutput o)
        {
            o.Albedo = _Color.rgb;
            o.Specular = _Spec;
            o.Gloss = _Gloss;
        }

        ENDCG
    }
    FallBack "Diffuse"
}
