Shader "Holistic/StandardPBR"
{
    Properties
    {
        _Color ("Color", Color) = (1,1,1,1)
        _MetalicTex ("Metallic (R)", 2D) = "white" {}
        _Metallic ("Metallic", Range(0,1)) = 0.0
        _Emissivness ("Emmisivness", Range(0,10)) = 0.0
    }
    SubShader
    {
        Tags { "Queue"="Geometry" }
        LOD 200

        CGPROGRAM
        // Physically based Standard lighting model, and enable shadows on all light types
        #pragma surface surf Standard

        // Use shader model 3.0 target, to get nicer looking lighting

        sampler2D _MetalicTex;
        fixed4 _Color;
        half _Metallic;
        half _Emissivness;

        struct Input
        {
            float2 uv_MetalicTex;
        };

        void surf (Input IN, inout SurfaceOutputStandard o)
        {
            o.Albedo = _Color.rgb;
            o.Smoothness = tex2D( _MetalicTex, IN.uv_MetalicTex) * _Color;
            o.Metallic = _Metallic ;
            o.Emission = tex2D( _MetalicTex, IN.uv_MetalicTex) *_Emissivness;

        }
        ENDCG
    }
    FallBack "Diffuse"
}
