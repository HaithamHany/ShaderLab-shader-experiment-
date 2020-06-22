Shader "Holistic/StandardSpecPBR"
{
    Properties
    {
        _Color ("Color", Color) = (1,1,1,1)
        _MetalicTex ("Metallic (R)", 2D) = "white" {}
        _SpecColor ("Specular color",Color) = (1,1,1,1)  //No need to declare variable for specColor because it already exists
    }
    SubShader
    {
        Tags { "Queue"="Geometry" }
        LOD 200

        CGPROGRAM
        // Physically based Standard lighting model, and enable shadows on all light types
        #pragma surface surf StandardSpecular

        // Use shader model 3.0 target, to get nicer looking lighting

        sampler2D _MetalicTex;
        fixed4 _Color;
       

        struct Input
        {
            float2 uv_MetalicTex;
        };

        void surf (Input IN, inout SurfaceOutputStandardSpecular o)
        {
            o.Albedo = _Color.rgb;
            o.Smoothness = 1-tex2D( _MetalicTex, IN.uv_MetalicTex) * _Color;
            o.Specular   = _SpecColor.rgb;

        }
        ENDCG
    }
    FallBack "Diffuse"
}
