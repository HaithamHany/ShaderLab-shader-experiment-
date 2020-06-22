Shader "Holistic/BumpedEnviroment"
{
    Properties
    {
        _myDiffuse ("Diffuse Texture", 2D)= "white" {}
        _myBump ("Bump Texture", 2D)= "bump" {}
        _mySLider ("Bump Amount", Range(0,10)) = 1
        _myBright("Brightness", Range(0,10)) = 1
        _myCube("Cube Map", CUBE) = "white" {}
    }

    SubShader {

        CGPROGRAM
        #pragma surface surf Lambert

        sampler2D  _myDiffuse;
        sampler2D _myBump;
        half _mySLider;
        half _myBright;
        samplerCUBE _myCube;

        struct Input {

            float2 uv_myDiffuse;
            float2 uv_myBump;
            float3 worldRefl; INTERNAL_DATA //it will use a different data set because the normals are modifed in the surf function using world reflection

        };

        void surf(Input IN, inout SurfaceOutput o)
        {
            o.Albedo = tex2D(_myDiffuse, IN.uv_myDiffuse).rgb;
            //o.Albedo = texCUBE(_myCube, IN.worldRefl).rgb;
            o.Normal = UnpackNormal( tex2D(_myBump, IN.uv_myBump )) * _myBright; //UnpackNormal is a built in function that runs over all the pixels and converts the RGB value into the XYZ
           
           //multiply the slider to X and Y
            o.Normal *= float3(_mySLider, _mySLider,1); 

            // WorldReflectionVector is an internal function that calculates world reflection vector from input structure data given the normals of the model it self
            o.Emission = texCUBE(_myCube, WorldReflectionVector (IN, o.Normal)).rgb; 
        }

        ENDCG
    }

    FallBack "Diffuse"
}