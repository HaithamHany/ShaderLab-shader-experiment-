Shader "Holistic/BumpDiffuse"
{
    Properties
    {
        _myDiffuse ("Diffuse Texture", 2D)= "white" {}
        _myBump ("Bump Texture", 2D)= "bump" {}
        _mySLider ("Bump Amount", Range(0,10)) = 1
        _BumpScaleSlider("Texture Bump Scale", Range(0.5,2)) = 1
    }

    SubShader {

        CGPROGRAM
        #pragma surface surf Lambert

        sampler2D  _myDiffuse;
        sampler2D _myBump;
        half _mySLider;
        half _BumpScaleSlider;

        struct Input {

            float2 uv_myDiffuse;
            float2 uv_myBump;

        };

        void surf(Input IN, inout SurfaceOutput o)
        {
            o.Albedo = tex2D(_myDiffuse, IN.uv_myDiffuse* _BumpScaleSlider).rgb;
            o.Normal = UnpackNormal( tex2D(_myBump, IN.uv_myBump *_BumpScaleSlider)); //UnpackNormal is a built in function that runs over all the pixels and converts the RGB value into the XYZ
            o.Normal *= float3(_mySLider, _mySLider,1); //multiply the slider to X and Y

        }

        ENDCG
    }

    FallBack "Diffuse"
}