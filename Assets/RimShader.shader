Shader "Holistic/Rim"
{
    Properties
    {
        _RimColor("Rim Color", Color)=(0,0.5,0.5,0.0)
        _RimPower("Rim Power", Range(0.5,8.0)) = 3.0
        _MyTexture ("Diffuse Texture", 2D)= "white" {}
    }

    SubShader
    {
        CGPROGRAM
        #pragma surface surf Lambert

        struct Input
        {
            float2 viewDir;
            float3 worldPos; //gives world position for pixel about to be drawn
            float2 uv_MyTexture;
        };

        float4 _RimColor;
        float _RimPower;
        sampler2D _MyTexture;

        void surf (Input IN, inout SurfaceOutput o)
        {
            half rim = 1 - saturate(dot(normalize(IN.viewDir), o.Normal)); //reversing
            o.Emission =  frac(IN.worldPos.y *10 *0.5) > 0.4 ? float3(0,1,0) *rim: float3(1,0,0) *rim;
            o.Albedo = tex2D(_MyTexture, IN.uv_MyTexture).rgb;
        }

        ENDCG
    }
    FallBack "Diffuse"
}
