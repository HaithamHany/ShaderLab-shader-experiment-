Shader "Holistic/AllProps"
{
    Properties
    {
        _myColor ("Example Color", Color) = (1,1,1,1)
        _myRange ("Example Range", Range(0,5))=1
        _myTex ("Example Texture", 2D) = "white" {}
        _myCube ("Example Cube", CUBE) = "" {}
        _myFloat("Example Float", Float) = 0.5
        _myVector("Example Vector", Vector) = (0.5,1,1,1)
       
    }
    SubShader
    {
        CGPROGRAM

        #pragma surface surf Lambert

        fixed4 _myColor;
        half _myRange;
        sampler2D _myTex;
        samplerCUBE _myCube;
        float _myFloat;
        float4 _myVector;


        struct Input { // declaring any values from the mesh that I need to mainpulate. its basically getting my hands on the mesh data using this struct

            float2 uv_myTex; // any UV value have to start with uv or uv2 and the name of the texture
            float3 worldRefl;

        };

        void surf(Input IN, inout SurfaceOutput o)
        {
            //tex2D is a built in shader function. Its built in to the High level shader language or CG
            // tex2D converts the texture that comes from the sampler2D format then grabing hold of rgb coming from the texture and using them as albedo of the model
            o.Albedo =  (tex2D(_myTex, IN.uv_myTex)* _myRange* _myColor).rgb; 
            o.Emission = texCUBE(_myCube, IN.worldRefl).rgb;
        }
       
        ENDCG
    }
    FallBack "Diffuse"
}
