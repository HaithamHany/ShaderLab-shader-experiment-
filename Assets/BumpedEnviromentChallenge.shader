Shader "Holistic/BumpedEnviromentChallenge"
{
    Properties
    {
        _myNormal ("NormalMap", 2D)= "bump" {}
        _myCube("Cube Map", CUBE) = "white" {}
    }

    SubShader {

        CGPROGRAM
        #pragma surface surf Lambert

        sampler2D _myNormal;
        samplerCUBE _myCube;

        struct Input {

            float2 uv_myNormal;
            float3 worldRefl; INTERNAL_DATA //it will use a different data set because the normals are modifed in the surf function using world reflection

        };

        void surf(Input IN, inout SurfaceOutput o)
        {

            o.Normal = UnpackNormal( tex2D(_myNormal, IN.uv_myNormal )) * 0.3; //UnpackNormal is a built in function that runs over all the pixels and converts the RGB value into the XYZ   
            o.Albedo = texCUBE(_myCube, WorldReflectionVector (IN, o.Normal)).rgb;         
        }

        ENDCG
    }

    FallBack "Diffuse"
}