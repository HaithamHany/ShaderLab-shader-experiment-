﻿Shader "Holistic/BasicLambertCustom1"
{
    Properties
    {
        _Color ("Color", Color) = (1, 1, 1, 1)
    }

    SubShader
    {
        Tags
        {
            "Queue" = "Geometry+100"
        }
        ZWrite Off
        CGPROGRAM
        #pragma surface surf BasicLambert

        //My lighting Model
        half4 LightingBasicLambert(SurfaceOutput s, half3 lightDir, half atten)
        {
            half NdotL = dot(s.Normal, lightDir);
            half4 c;
            c.rgb = s.Albedo * _LightColor0.rgb * (NdotL * atten);
            c.a = s.Alpha;

            return c;
        }

        struct Input
        {
            float2 uv_MainTex;
        };

        float4 _Color;

        void surf(Input IN, inout SurfaceOutput o)
        {
            o.Albedo = _Color.rgb;
        }

        ENDCG
    }

    FallBack "Diffuse"
}