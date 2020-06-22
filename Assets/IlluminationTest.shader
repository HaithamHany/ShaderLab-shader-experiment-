Shader "Holistic/IllumunationTest"
{
    Properties
    {
        _myTex_diffuse ("diffuse Texture ", 2D ) = "white" {}
        _myTex_emissive("Emissive Texture ", 2D ) = "black" {}
    }
    SubShader
    {
        CGPROGRAM
        #pragma surface surf Lambert

        struct Input
        {
            float2 uv_myTex_diffuse;
            float2 uv_myTex_emissive;
        };

        sampler2D  _myTex_diffuse;
        sampler2D  _myTex_emissive;

        void surf (Input IN, inout SurfaceOutput o)
        {
            o.Albedo = o.Normal;
           // o.Emission = tex2D(_myTex_emissive, IN.uv_myTex_emissive).rgb;
        }
       
        ENDCG
    }
    FallBack "Diffuse"
}
